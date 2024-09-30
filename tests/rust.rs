use wasker::compiler;

#[test]
fn rust() {
    let wat = "./helloworld.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
        spectest: false,
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}
