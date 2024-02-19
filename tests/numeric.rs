use wasker::compiler;

#[test]
fn i64() {
    let wat = "./tests/wat/i64.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn convert() {
    let wat = "./tests/wat/convert.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn f64() {
    let wat = "./tests/wat/f64.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn f64_cmp() {
    let wat = "./tests/wat/f64_cmp.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn f64_bitwise() {
    let wat = "./tests/wat/f64_bitwise.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}
