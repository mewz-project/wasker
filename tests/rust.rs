use wasker::compiler;

#[test]
fn rust() {
    let wat = "./helloworld.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}
