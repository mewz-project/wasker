use anyhow::Result;
use clap::Parser;
use wasker::compiler;

fn main() -> Result<()> {
    // init logger
    env_logger::init_from_env(env_logger::Env::new().default_filter_or("info"));
    let args = compiler::Args::parse();

    // If spectest mode is enabled, compile Wasm from spectest's *.wast file.
    if args.spectest {
        log::info!("SpecTest mode is enabled.");
        compiler::compile_wast_from_spectest().expect("Failed to compile spectest");
        return Ok(());
    }

    // Compile Wasm and output ELF
    compiler::compile_wasm_from_file(&args).expect("Failed to compile input Wasm");

    Ok(())
}
