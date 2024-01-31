//! `compiler` is the root module of Wasker compiler.

use crate::environment::Environment;
use crate::inkwell::init_inkwell;
use crate::insts::control::UnreachableReason;
use crate::section::translate_module;
use anyhow::{anyhow, Context, Result};
use inkwell::{context, module::Module, passes::PassManager, targets};
use wat;

/// Receive a path to a Wasm binary or WAT and compile it into ELF binary.
pub fn compile_wasm_from_file(filepath: &str) -> Result<()> {
    // Load bytes as either *.wat or *.wasm
    log::info!("input: {}", filepath);
    let buf: Vec<u8> = std::fs::read(filepath).expect("error read file");

    // If input is *.wat, convert it into *wasm
    // If input is *.wasm, do nothing
    let wasm = wat::parse_bytes(&buf).expect("error translate wat");
    assert!(wasm.starts_with(b"\0asm"));

    // TODO: make option to output wasm
    /*
    // Output wasm
    let pathbuf = PathBuf::from(filepath);
    let filestem = pathbuf
        .file_stem()
        .expect("error extract file stem")
        .to_string_lossy()
        .into_owned();
    let wasm_path = format!("tests/wasm/{}.wasm", filestem);
    let mut file = File::create(wasm_path)?;
    file.write_all(&wasm)?;
    file.flush()?;
    */
    compile_wasm(&wasm)
}

/// Receive a Wasm binary and compile it into ELF binary.
pub fn compile_wasm(wasm: &[u8]) -> Result<()> {
    // Prepare inkwell (Rust-wrapper of LLVM) instances
    let context = context::Context::create();
    let module = context.create_module("wasker_module");
    let builder = context.create_builder();
    let (inkwell_types, inkwell_insts) = init_inkwell(&context, &module);
    let mut environment = Environment {
        context: &context,
        module: &module,
        builder,
        inkwell_types,
        inkwell_insts,
        function_signature_list: Vec::new(),
        function_list: Vec::new(),
        function_list_signature: Vec::new(),
        function_list_name: Vec::new(),
        stack: Vec::new(),
        global: Vec::new(),
        import_section_size: 0,
        function_section_size: 0,
        current_function_idx: u32::MAX,
        control_frames: Vec::new(),
        wasker_init_block: None,
        wasker_main_block: None,
        linear_memory_offset_global: None,
        linear_memory_offset_int: None,
        start_function_idx: None,
        unreachable_depth: 0,
        unreachable_reason: UnreachableReason::Reachable,
        global_table: None,
        global_memory_size: None,
        fn_memory_grow: None,
    };

    // translate wasm to LLVM IR
    translate_module(wasm, &mut environment)?;

    let pass_manager: PassManager<Module<'_>> = PassManager::create(());
    pass_manager.add_type_based_alias_analysis_pass();
    pass_manager.add_sccp_pass();
    pass_manager.add_prune_eh_pass();
    pass_manager.add_dead_arg_elimination_pass();
    pass_manager.add_lower_expect_intrinsic_pass();
    pass_manager.add_scalar_repl_aggregates_pass();
    pass_manager.add_instruction_combining_pass();
    pass_manager.add_jump_threading_pass();
    pass_manager.add_correlated_value_propagation_pass();
    pass_manager.add_cfg_simplification_pass();
    pass_manager.add_reassociate_pass();
    pass_manager.add_loop_rotate_pass();
    pass_manager.add_ind_var_simplify_pass();
    pass_manager.add_licm_pass();
    pass_manager.add_loop_vectorize_pass();
    pass_manager.add_instruction_combining_pass();
    pass_manager.add_sccp_pass();
    pass_manager.add_reassociate_pass();
    pass_manager.add_cfg_simplification_pass();
    pass_manager.add_gvn_pass();
    pass_manager.add_memcpy_optimize_pass();
    pass_manager.add_dead_store_elimination_pass();
    pass_manager.add_bit_tracking_dce_pass();
    pass_manager.add_instruction_combining_pass();
    pass_manager.add_reassociate_pass();
    pass_manager.add_cfg_simplification_pass();
    pass_manager.add_early_cse_pass();
    pass_manager.run_on(&module);

    // output LLVM IR to native ELF
    output_elf(environment).context("error output_elf")?;

    log::info!("Compile success");
    Ok(())
}

fn output_elf(environment: Environment) -> Result<()> {
    log::info!("write to wasm.ll");
    environment
        .module
        .print_to_file(std::path::Path::new("./wasm.ll"))
        .map_err(|e| anyhow!(e.to_string()))
        .context("fail print_to_file")?;
    log::info!("write to wasm.o, it may take a while");
    get_host_target_machine()
        .expect("error get_host_target_machine")
        .write_to_file(
            environment.module,
            targets::FileType::Object,
            std::path::Path::new("./wasm.o"),
        )
        .map_err(|e| anyhow!(e.to_string()))
        .context("fail write_to_file")?;
    Ok(())
}

fn get_host_target_machine() -> Result<targets::TargetMachine, String> {
    use targets::*;

    Target::initialize_native(&InitializationConfig::default())
        .map_err(|e| format!("failed to initialize native target: {}", e))?;

    let triple = TargetMachine::get_default_triple();
    let target =
        Target::from_triple(&triple).map_err(|e| format!("failed to get target: {}", e))?;

    let cpu = TargetMachine::get_host_cpu_name();
    let features = TargetMachine::get_host_cpu_features();

    let opt_level = inkwell::OptimizationLevel::Aggressive;
    let reloc_mode = RelocMode::Default;
    let code_model = CodeModel::Default;

    target
        .create_target_machine(
            &triple,
            cpu.to_str().expect("error get cpu info"),
            features.to_str().expect("error get features"),
            opt_level,
            reloc_mode,
            code_model,
        )
        .ok_or("failed to get target machine".to_string())
}
