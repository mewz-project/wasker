use wasker::compiler;

#[test]
fn rust() {
    let wat = "./tests/wasm/hello-rust.wasm";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}
