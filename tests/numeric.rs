use wasker::compiler;

#[test]
fn i64() {
    let wat = "./tests/wat/i64.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn convert() {
    let wat = "./tests/wat/convert.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn f64() {
    let wat = "./tests/wat/f64.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn f64_cmp() {
    let wat = "./tests/wat/f64_cmp.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn f64_bitwise() {
    let wat = "./tests/wat/f64_bitwise.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}
