use wasker::compiler;

#[test]
fn memory_size() {
    let wat = "./tests/wat/memory_size.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_file: "/tmp/wasm.o".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn memory_copy() {
    let wat = "./tests/wat/memory_copy.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_file: "/tmp/wasm.o".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn memory_fill() {
    let wat = "./tests/wat/memory_fill.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_file: "/tmp/wasm.o".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn endianness() {
    let wat = "./tests/wat/endianness.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_file: "/tmp/wasm.o".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn address32() {
    let wat = "./tests/wat/address32.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_file: "/tmp/wasm.o".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn address64() {
    let wat = "./tests/wat/address64.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_file: "/tmp/wasm.o".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn align() {
    let wat = "./tests/wat/align.wat";
    let args = compiler::Args {
        input_file: wat.to_string(),
        output_file: "/tmp/wasm.o".to_string(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}
