use std::process::Command;
use wasker::compiler;

fn ensure_log_dir(log_dir: &str) {
    if !std::path::Path::new(log_dir).exists() {
        std::fs::create_dir_all(log_dir).expect("Failed to create log directory");
    }
}

fn compile_for_executable(output_path: &str, wasm_path: &str, wasi_wrapper_path: &str) {
    let compile_status = Command::new("gcc")
        .args(["-o", output_path, wasm_path, wasi_wrapper_path, "-no-pie"])
        .status()
        .expect("Failed to compile with GCC");
    if !compile_status.success() {
        panic!("GCC compilation failed");
    }
}

fn run_test(testcase: &str) {
    let project_root = env!("CARGO_MANIFEST_DIR");
    let log_dir = format!("{project_root}/target/test_logs");
    ensure_log_dir(&log_dir);

    let wat_path = format!("{project_root}/tests/wat/{testcase}.wat");
    let wasker_output_path = format!("{log_dir}/{testcase}.o");
    let executable_path = format!("{log_dir}/test_{testcase}.out");
    let wasi_wrapper_path = format!("{project_root}/tests/wasi-wrapper-for-test.c");

    let args = compiler::Args {
        input_file: wat_path.into(),
        output_file: wasker_output_path.clone().into(),
    };

    // Compile Wasm to ELF file
    compiler::compile_wasm_from_file(&args).expect("fail compile");

    // Compile ELF with WASI wrapper
    compile_for_executable(&executable_path, &wasker_output_path, &wasi_wrapper_path);

    // Run the executable and check output
    let output = Command::new(&executable_path)
        .output()
        .expect("Failed to execute the compiled program");
    let stdout = String::from_utf8_lossy(&output.stdout);

    // Count the number of "Fail" and "Pass" in the output
    let n_success = stdout.matches("Pass").count();
    let n_fail = stdout.matches("Fail").count();
    assert!(
        n_fail == 0,
        "{} tests failed with output: {}",
        n_fail,
        String::from_utf8_lossy(&output.stdout)
    );
    assert!(
        n_success > 0,
        "No tests successed: {}",
        String::from_utf8_lossy(&output.stdout)
    );
}

#[test]
fn spec_i64() {
    run_test("i64");
}

#[test]
fn spec_i32() {
    run_test("i32");
}

#[test]
fn spec_br() {
    run_test("br");
}

#[test]
fn spec_block() {
    run_test("block");
}
