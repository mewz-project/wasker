//! `compiler` is the root module of Wasker compiler.

use crate::environment::Environment;
use crate::inkwell::init_inkwell;
use crate::section::translate_module;
use anyhow::{anyhow, Context, Result};
use clap::Parser;
use inkwell::{context, passes::PassBuilderOptions, targets};
use std::path;
use wat;

#[derive(Parser, Debug)]
pub struct Args {
    pub input_file: path::PathBuf,

    #[arg(short, long, default_value = "./wasm.o")]
    pub output_file: path::PathBuf,
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

    let target_machine =
        get_host_target_machine().map_err(|e| anyhow!(e)).context("error get_host_target_machine")?;
    let pass_options = PassBuilderOptions::create();
    module
        .run_passes("default<O3>", &target_machine, pass_options)
        .map_err(|e| anyhow!(e.to_string()))
        .context("fail run_passes")?;

    // output LLVM IR to native ELF
    output_elf(environment, &target_machine).context("error output_elf")?;

    log::info!("Compile success");
    Ok(())
}

fn output_elf(environment: Environment, target_machine: &targets::TargetMachine) -> Result<()> {
    let obj_path = path::Path::new(environment.output_file);
    let ll_path = obj_path.with_extension("ll");

    log::info!("write to {}", ll_path.display());
    environment
        .module
        .print_to_file(ll_path.to_str().expect("error ll_path"))
        .map_err(|e| anyhow!(e.to_string()))
        .context("fail print_to_file")?;

    log::info!("write to {}, it may take a while", obj_path.display());
    target_machine
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
        .map_err(|e| format!("failed to initialize native target: {e}"))?;

    let triple = TargetMachine::get_default_triple();
    let target = Target::from_triple(&triple).map_err(|e| format!("failed to get target: {e}"))?;

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
