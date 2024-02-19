use wasker::compiler;

#[test]
fn local_get() {
    let wat = "./tests/wat/local_get.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn global() {
    let wat = "./tests/wat/global.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}
