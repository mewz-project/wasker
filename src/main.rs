use anyhow::Result;
use clap::Parser;
use wasker::compiler;

fn main() -> Result<()> {
    // init logger
    env_logger::init_from_env(env_logger::Env::new().default_filter_or("info"));
    let args = compiler::Args::parse();

    // Compile Wasm and output ELF
    compiler::compile_wasm_from_file(&args)?;

    Ok(())
}
