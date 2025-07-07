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

fn run_test(testcase: &str){
    let project_root = env!("CARGO_MANIFEST_DIR");
    let log_dir = format!("{}/target/test_logs", project_root);
    ensure_log_dir(&log_dir);

    let wat_path = format!("{}/tests/wat/{}.wat", project_root, testcase);
    let wasker_output_path = format!("{}/wasm.o", log_dir);
    let executable_path = format!("{}/exec.out", log_dir);
    let wasi_wrapper_path = format!(
        "{}/tests/wasi-wrapper-for-test.c",
        project_root
    );

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
    let n_success = String::from_utf8_lossy(&output.stdout).matches("Pass").count();
    let n_fail = String::from_utf8_lossy(&output.stdout).matches("Fail").count();
    assert!(n_success > 0, "Test failed with output: {}",
          String::from_utf8_lossy(&output.stdout));
    assert!(n_fail == 0, "Test failed with output: {}",
           String::from_utf8_lossy(&output.stdout));
    println!("Test {} passed with {} successes and {} failures", testcase, n_success, n_fail);
}

#[test]
fn i64() {
    run_test("i64");
}

#[test]
fn convert() {
    let wat = "./tests/wat/convert.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn f64() {
    let wat = "./tests/wat/f64.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn f64_cmp() {
    let wat = "./tests/wat/f64_cmp.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}

#[test]
fn f64_bitwise() {
    let wat = "./tests/wat/f64_bitwise.wat";
    let args = compiler::Args {
        input_file: wat.into(),
        output_file: "/tmp/wasm.o".into(),
    };
    compiler::compile_wasm_from_file(&args).expect("fail compile");
}
