fn main() {
    let llvm_version = "15.0.0";
    let target = format!("clang+llvm-{}-x86_64-linux-gnu-rhel-8.4", llvm_version);
    let home_dir = env::var("HOME").expect("fail to get home dir");
    let wasker_dir = format!("{}/.wasker", home_dir);
    let install_dir = format!("{}/{}", wasker_dir, target);

    // Check if the specified version of LLVM is installed
    if std::path::Path::new(&install_dir).exists() {
        println!("LLVM is already installed in {}", install_dir);
        return;
    }
    // Download LLVM from Github
    println!("Downloading LLVM {}, it takes while...", llvm_version);
    let url = format!(
        "https://github.com/llvm/llvm-project/releases/download/llvmorg-{}/{}.tar.xz",
        llvm_version, target
    );
    std::process::Command::new("wget")
        .arg(&url)
        .arg("-O")
        .arg(format!("/tmp/{}.tar.xz", target))
        .output()
        .expect("Failed to download LLVM");

    // Create directory
    if !std::path::Path::new(&wasker_dir).exists() {
        println!("Creating directory {:?}", wasker_dir);
        std::fs::create_dir(&wasker_dir).expect("Failed to create directory");
    }

    // Extract the tar file
    println!("Extracting tar file to {:?}", wasker_dir);
    std::process::Command::new("tar")
        .arg("-xf")
        .arg(format!("/tmp/{}.tar.xz", target))
        .arg("-C")
        .arg(wasker_dir)
        .output()
        .expect("Failed to extract tar file");

    // Remove the tar file
    std::fs::remove_file(format!("/tmp/{}.tar.xz", target)).expect("Failed to remove tar file");
}
