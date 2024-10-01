//! `compiler` is the root module of Wasker compiler.

use crate::environment::Environment;
use crate::inkwell::init_inkwell;
use crate::section::translate_module;
use anyhow::{anyhow, Context, Ok, Result};
use clap::Parser;
use inkwell::{context, module::Module, passes::PassManager, targets};
use std::fmt::format;
use std::io::{Read, Write};
use std::path::PathBuf;
use wast::{
    core::WastArgCore, core::WastRetCore, lexer::Lexer, parser::ParseBuffer, Wast, WastDirective,
};
use wat;

/// Ahead-of-Time Wasm to ELF compiler.
#[derive(Parser, Debug)]
pub struct Args {
    /// Path to the input Wasm or WAT file.
    #[arg(short, long, default_value = "./hello.wat")]
    pub input_file: PathBuf,

    /// Path to the output ELF file.
    #[arg(short, long, default_value = "./wasm.o")]
    pub output_file: PathBuf,

    /// SpecTest mode
    /// If this flag is set, the compiler will output ELF file from spectest's *.wast file.
    #[arg(short, long, default_value = "false")]
    pub spectest: bool,
}

/// Receive a path to a Wasm binary or WAT and compile it into ELF binary.
pub fn compile_wasm_from_file(args: &Args) -> Result<()> {
    // Load bytes as either *.wat or *.wasm
    log::info!("input: {}", args.input_file.as_path().display());
    let buf: Vec<u8> = std::fs::read(&args.input_file).expect("error read file");

    // If input is *.wat, convert it into *wasm
    // If input is *.wasm, do nothing
    let wasm = wat::parse_bytes(&buf).expect("error translate wat");
    assert!(wasm.starts_with(b"\0asm"));

    compile_wasm(&wasm, args)
}

fn compile_spec_test(testname: &str, idx: usize) {
    let project_root = std::env::var("CARGO_MANIFEST_DIR").expect("error get env");

    // Read Wast
    let mut wat = String::new();
    let wat_path = std::path::Path::new(&project_root).join(format!("testsuite/{}.wast", testname));
    log::info!("open file: {:?}", wat_path);
    let mut file = std::fs::File::open(wat_path).expect("error open file");
    file.read_to_string(&mut wat).expect("cannot read file");

    // Parse Wast
    let mut lexer = Lexer::new(&wat);
    lexer.allow_confusing_unicode(true);
    let parse_buffer = match ParseBuffer::new_with_lexer(lexer) {
        core::result::Result::Ok(buffer) => buffer,
        Err(error) => {
            panic!("failed to create ParseBuffer : {}", error)
        }
    };
    let wast = match wast::parser::parse::<Wast>(&parse_buffer) {
        core::result::Result::Ok(wast) => wast,
        Err(error) => {
            panic!(
                "failed to parse `.wast` spec test file {} for: {}",
                testname, error
            )
        }
    };

    // Compile Wast
    let target_dir = std::path::Path::new(&project_root).join(format!("target/spectest"));
    if !target_dir.exists() {
        std::fs::create_dir_all(&target_dir).expect("error create target dir");
    }

    let mut buff_externc = if idx == 0 {
        String::from("#[link(name = \"spectest\")]\nextern \"C\" {\n")
    } else {
        String::new()
    };
    let mut buff_test = String::from(format!("#[test]\nfn test_{}()", testname));
    buff_test.push_str("{\n");

    for directive in wast.directives {
        match directive {
            WastDirective::Wat(mut wat) => {
                // Get Wasm binary
                let wasm = wat.encode().expect("failed to encode wat");
                assert_eq!(wasm[0..4], [0, 97, 115, 109]);

                // Compile with Wasker
                let args = Args {
                    input_file: "dummy.wasm".into(),
                    output_file: format!("{}/{}.o", target_dir.display(), testname).into(),
                    spectest: false,
                };
                compile_wasm(&wasm, &args).expect("failed to Wasker compile");
            }
            WastDirective::AssertReturn {
                span: _,
                exec,
                results,
            } => match exec {
                wast::WastExecute::Invoke(wast::WastInvoke {
                    span: _,
                    module: _,
                    name,
                    args,
                }) => {
                    let mut test_strings = String::from("\tassert_eq!(");
                    if results.len() > 1 {
                        log::error!("TODO: results.len() > 1");
                        assert!(false);
                    }
                    match &results[0] {
                        wast::WastRet::Core(ret) => match ret {
                            WastRetCore::I32(i) => {
                                test_strings.push_str(&format!("{},", i));
                            }
                            WastRetCore::I64(i) => {
                                test_strings.push_str(&format!("{},", i));
                            }
                            WastRetCore::F32(f) => {
                                test_strings.push_str(&format!("{:?},", f));
                            }
                            WastRetCore::F64(f) => {
                                test_strings.push_str(&format!("{:?},", f));
                            }
                            _ => {}
                        },
                        _ => {
                            log::error!("TODO: results[0] is not Core");
                            assert!(false);
                        }
                    }
                    test_strings.push_str(format!("{}(", name).as_str());
                    for arg in args {
                        match arg {
                            wast::WastArg::Core(argcore) => match argcore {
                                WastArgCore::I32(i) => {
                                    test_strings.push_str(&format!("{},", i));
                                }
                                WastArgCore::I64(i) => {
                                    test_strings.push_str(&format!("{},", i));
                                }
                                WastArgCore::F32(f) => {
                                    test_strings.push_str(&format!("{:?},", f));
                                }
                                WastArgCore::F64(f) => {
                                    test_strings.push_str(&format!("{:?},", f));
                                }
                                _ => {}
                            },
                            _ => {}
                        }
                    }
                    // remove last comma
                    test_strings.pop();
                    test_strings.push_str("));\n");
                    buff_test.push_str(test_strings.as_str());
                }

                _ => {}
            },
            WastDirective::AssertInvalid {
                span: _,
                module: _,
                message: _,
            } => {}
            WastDirective::AssertTrap {
                span: _,
                exec: _,
                message: _,
            } => {}
            WastDirective::AssertMalformed {
                span: _,
                module: _,
                message: _,
            } => {}
            _other => {}
        }
    }

    buff_externc.push_str("\n}\n");
    buff_test.push_str("}\n");
    let rs_path = target_dir.join(format!("{}/target/spectest/spectest.rs", project_root));

    if idx == 0 {
        // remove file if exists
        if rs_path.exists() {
            std::fs::remove_file(&rs_path).expect("error remove file");
        }

        // write to new file
        let buff = format!("{}{}", buff_externc, buff_test);
        std::fs::write(&rs_path, &buff).expect("error write file");
    } else {
        let f = std::fs::OpenOptions::new()
            .write(true)
            .append(true)
            .open(&rs_path)
            .expect("error open file");
        let mut bw = std::io::BufWriter::new(f);
        bw.write_all(buff_test.as_bytes())
            .expect("error write file");
    }
}

pub const SPECTESTS: [&str; 2] = ["i32", "i64"];

pub fn compile_wast_from_spectest() -> Result<()> {
    for (i, testname) in SPECTESTS.iter().enumerate() {
        compile_spec_test(testname, i);
    }
    Ok(())
}

/// Receive a Wasm binary and compile it into ELF binary.
pub fn compile_wasm(wasm: &[u8], args: &Args) -> Result<()> {
    // Prepare inkwell (Rust-wrapper of LLVM) instances
    let context = context::Context::create();
    let module = context.create_module("wasker_module");
    let builder = context.create_builder();
    let (inkwell_types, inkwell_insts) = init_inkwell(&context, &module);
    let mut environment = Environment::new(
        args.output_file.as_path(),
        &context,
        &module,
        builder,
        inkwell_types,
        inkwell_insts,
    );

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
    let obj_path = PathBuf::from(environment.output_file);
    let ll_path = obj_path.with_extension("ll");

    log::info!("write to {}", ll_path.display());
    environment
        .module
        .print_to_file(ll_path.to_str().expect("error ll_path"))
        .map_err(|e| anyhow!(e.to_string()))
        .context("fail print_to_file")?;

    log::info!("write to {}, it may take a while", obj_path.display());
    get_host_target_machine()
        .expect("error get_host_target_machine")
        .write_to_file(
            environment.module,
            targets::FileType::Object,
            std::path::Path::new(obj_path.to_str().expect("error obj_path")),
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
