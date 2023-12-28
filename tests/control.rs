use wasker::compiler;

#[test]
fn example() {
    let wat = "./tests/wat/example.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn block() {
    let wat = "./tests/wat/block.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn ret() {
    let wat = "./tests/wat/return.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn call() {
    let wat = "./tests/wat/call.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn call_indirect() {
    let wat = "./tests/wat/call_indirect.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn select() {
    let wat = "./tests/wat/select.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn br() {
    let wat = "./tests/wat/br.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn br_table() {
    let wat = "./tests/wat/br_table.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn br_if() {
    let wat = "./tests/wat/br_if.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn iff() {
    let wat = "./tests/wat/if.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn loopp() {
    let wat = "./tests/wat/loop.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn switch() {
    let wat = "./tests/wat/switch.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}

#[test]
fn bulk() {
    let wat = "./tests/wat/bulk.wat";
    compiler::compile_wasm_from_file(wat).expect("fail compile");
}
