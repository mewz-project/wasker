use std::{path::Path, process::Command};

fn path_to_str(path: &Path) -> &str {
    path.as_os_str().to_str().unwrap()
}

fn main() {
    let target_name = "wasm";
    let target_obj_name = format!("{}.o", target_name);
    let wasm_path = Path::new("../../rust");
    let target_path = wasm_path.join(&target_obj_name);
    println!("cargo:rerun-if-changed={}", path_to_str(&target_path));

    std::env::set_current_dir(wasm_path).unwrap();
    Command::new("cargo")
        .args(["build", "--target=wasm32-wasi"])
        .status()
        .expect("failed to compile target into WASM");
    Command::new("wasker")
        .args([
            "-o",
            &target_obj_name,
            "target/wasm32-wasi/debug/rust.wasm",
        ])
        .status()
        .expect("failed to compile target into obj");

    let target_lib_name = format!("lib{}.a", target_name);
    Command::new("ar")
        .args([
            "rcs",
            &target_lib_name,
            &target_obj_name,
        ])
        .status()
        .expect("failed to execute process");

    println!("cargo:rustc-link-arg=-no-pie");
    println!("cargo:rustc-link-search=native={}", path_to_str(wasm_path));
    println!("cargo:rustc-link-lib=static={}", target_name);
}
