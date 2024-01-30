use anyhow::Result;
use clap::Parser;
use wasker::compiler;

#[derive(Parser, Debug)]
struct Args {
    input_file: String,

    #[arg(default_value = "./")]
    output_dir: String,
}

fn main() -> Result<()> {
    // init logger
    env_logger::init_from_env(env_logger::Env::new().default_filter_or("info"));
    let args = Args::parse();

    // Compile Wasm and output ELF
    compiler::compile_wasm_from_file(&args.input_file, &args.output_dir)?;

    Ok(())
}
