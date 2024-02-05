use wasker::compiler;

#[test]
fn example() {
    let wat = "./tests/wat/block.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn block() {
    let wat = "./tests/wat/block.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn ret() {
    let wat = "./tests/wat/return.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn call() {
    let wat = "./tests/wat/call.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn call_indirect() {
    let wat = "./tests/wat/call_indirect.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn select() {
    let wat = "./tests/wat/select.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn br() {
    let wat = "./tests/wat/br.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn br_table() {
    let wat = "./tests/wat/br_table.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn br_if() {
    let wat = "./tests/wat/br_if.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn iff() {
    let wat = "./tests/wat/if.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn loopp() {
    let wat = "./tests/wat/loop.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn switch() {
    let wat = "./tests/wat/switch.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn bulk() {
    let wat = "./tests/wat/bulk.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_dir: "./".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}
