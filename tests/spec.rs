use std::process::Command;
use wasker::compiler;

fn ensure_log_dir(log_dir: &str) {
    std::fs::create_dir_all(&log_dir).expect("Failed to create log directory");
}

fn compile_for_executable(output_path: &str, wasm_path: &str, wasi_wrapper_path: &str) {
    let compile_status = Command::new("gcc")
        .args(&[
            "-o",
            &output_path,
            &wasm_path,
            &wasi_wrapper_path,
            "-no-pie",
        ])
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
    let wasker_output_path = format!("{log_dir}/wasm.o");
    let executable_path = format!("{log_dir}/exec.out");
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
    // If the output contains "Fail", the test should fail
    // Count the number of "Fail" and "Success"
    let n_success = String::from_utf8_lossy(&output.stdout)
        .matches("Pass")
        .count();
    let n_fail = String::from_utf8_lossy(&output.stdout)
        .matches("Fail")
        .count();
    assert!(
        n_success > 0,
        "Test failed with output: {}",
        String::from_utf8_lossy(&output.stdout)
    );
    assert!(
        n_fail == 0,
        "Test failed with output: {}",
        String::from_utf8_lossy(&output.stdout)
    );
}

#[test]
fn i64() {
    run_test("i64");
}
