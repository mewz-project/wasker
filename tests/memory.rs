use wasker::compiler;

#[test]
fn memory_size() {
    let wat = "./tests/wat/memory_size.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn memory_copy() {
    let wat = "./tests/wat/memory_copy.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn memory_fill() {
    let wat = "./tests/wat/memory_fill.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn endianness() {
    let wat = "./tests/wat/endianness.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn address32() {
    let wat = "./tests/wat/address32.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn address64() {
    let wat = "./tests/wat/address64.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn align() {
    let wat = "./tests/wat/align.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}
