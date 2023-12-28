use wasker::compiler;

#[test]
fn local_get() {
    let wat = "./tests/wat/local_get.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn global() {
    let wat = "./tests/wat/global.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}
