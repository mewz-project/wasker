use std::io::Read;

use wasker::compiler::{self, compile_wasm};
use wast::{lexer::Lexer, parser::ParseBuffer, Wast, WastDirective};

fn run_spec_test(testname: &str) {
    let path = "./tests/testsuite";

    // Read Wast
    let mut wat = String::new();
    let wat_path = std::path::Path::new(path).join(format!("{}.wast", testname));
    println!("open file: {:?}", wat_path);
    let mut file = std::fs::File::open(wat_path).expect("error open file");
    file.read_to_string(&mut wat).expect("cannot read file");

    // Parse Wast
    let mut lexer = Lexer::new(&wat);
    lexer.allow_confusing_unicode(true);
    let parse_buffer = match ParseBuffer::new_with_lexer(lexer) {
        Ok(buffer) => buffer,
        Err(error) => {
            panic!("failed to create ParseBuffer : {}", error)
        }
    };
    let wast = match wast::parser::parse::<Wast>(&parse_buffer) {
        Ok(wast) => wast,
        Err(error) => {
            panic!(
                "failed to parse `.wast` spec test file {} for: {}",
                testname, error
            )
        }
    };

    // Execute
    for directive in wast.directives {
        match directive {
            WastDirective::Wat(mut wat) => {
                // Get Wasm binary
                let wasm = wat.encode().expect("failed to encode wat");
                assert_eq!(wasm[0..4], [0, 97, 115, 109]);

                // Compile with Wasker
                let args = compiler::Args {
                    input_file: "dummy.wasm".into(),
                    output_file: "/tmp/wasm.o".into(),
                };
                compile_wasm(&wasm, &args).expect("failed to Wasker compile");
            }
            WastDirective::AssertReturn {
                span: _,
                exec: _,
                results: _,
            } => {}
            WastDirective::AssertInvalid {
                span: _,
                module: _,
                message: _,
            } => {}
            WastDirective::AssertTrap {
                span: _,
                exec: _,
                message: _,
            } => {}
            WastDirective::AssertMalformed {
                span: _,
                module: _,
                message: _,
            } => {}
            WastDirective::Invoke(_invoke) => {}
            _other => {}
        }
    }
}

macro_rules! spec_test {
    ($testname:ident, $fname:expr) => {
        #[test]
        #[allow(non_snake_case)]
        fn $testname() {
            run_spec_test($fname);
        }
    };
}

spec_test!(i64, "i64");

/*
spec_test!(address, "address");
spec_test!(align, "align");
spec_test!(binary, "binary");
spec_test!(binary_leb128, "binary-leb128");
spec_test!(block, "block");
spec_test!(br, "br");
spec_test!(br_if, "br_if");
spec_test!(br_table, "br_table");
spec_test!(break_drop, "break-drop");
spec_test!(call, "call");
spec_test!(call_indirect, "call_indirect");
spec_test!(comments, "comments");
spec_test!(r#const, "const");
spec_test!(conversions, "conversions");
spec_test!(custom, "custom");
spec_test!(endianness, "endianness");
spec_test!(exports, "exports");
spec_test!(f32, "f32");
spec_test!(f32_bitwise, "f32_bitwise");
spec_test!(f32_cmp, "f32_cmp");
spec_test!(f64, "f64");
spec_test!(f64_bitwise, "f64_bitwise");
spec_test!(f64_cmp, "f64_cmp");
spec_test!(fac, "fac");
spec_test!(float_exprs, "float_exprs");
spec_test!(float_literals, "float_literals");
spec_test!(float_memory, "float_memory");
spec_test!(float_misc, "float_misc");
spec_test!(forward, "forward");
spec_test!(func_ptrs, "func_ptrs");
spec_test!(i32, "i32");
spec_test!(r#if, "if");
spec_test!(inline_module, "inline-module");
spec_test!(int_exprs, "int_exprs");
spec_test!(int_literals, "int_literals");
spec_test!(labels, "labels");
spec_test!(left_to_right, "left-to-right");
spec_test!(load, "load");
spec_test!(local_get, "local_get");
spec_test!(local_set, "local_set");
spec_test!(local_tee, "local_tee");
spec_test!(r#loop, "loop");
spec_test!(memory, "memory");
spec_test!(memory_grow, "memory_grow");
spec_test!(memory_redundancy, "memory_redundancy");
spec_test!(memory_size, "memory_size");
spec_test!(memory_trap, "memory_trap");
spec_test!(names, "names");
spec_test!(nop, "nop");
spec_test!(r#return, "return");
spec_test!(select, "select");
spec_test!(skip_stack_guard_page, "skip-stack-guard-page");
spec_test!(start, "start");
spec_test!(store, "store");
spec_test!(switch, "switch");
spec_test!(traps, "traps");
spec_test!(token, "token");
spec_test!(r#type, "type");
spec_test!(unreachable, "unreachable");
spec_test!(unreached_invalid, "unreached-invalid");
spec_test!(utf8_import_field, "utf8-import-field");
spec_test!(utf8_import_module, "utf8-import-module");
spec_test!(utf8_invalid_encoding, "utf8-invalid-encoding");
spec_test!(utf8_custom_section_id, "utf8-custom-section-id");

// Run failed because of unsupported ImportKind::Memory
spec_test!(data, "data");
spec_test!(elem, "elem");
spec_test!(globals, "globals");
spec_test!(imports, "imports");
spec_test!(linking, "linking");


spec_test!(func, "func");
spec_test!(unwind, "unwind");

spec_test!(stack, "stack");
*/
