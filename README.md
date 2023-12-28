![Wasker_logo](./doc/assets/wasker.png "Wasker_logo")

# Wasker

Wasker is a WebAssembly compiler.
Wasker compiles Wasm binary into ELF format binary.

![Wasker_architecture](./doc/assets/wasker_architecture.png "Wasker_architecture")

## What's new with Wasker

There are already software tools that compile Wasm to native binaries.

What's new with Wasker is, Wasker generates an **OS-independent** ELF file where WASI calls from Wasm applications remain **unresolved**.

This unresolved feature allows Wasker's output ELF file to be **linked with WASI implementations provided by various operating systems**, enabling each OS to execute Wasm applications.

Wasker empowers your favorite OS to serve as a Wasm runtime!


# How to run Wasker
Wasker compiler is based on LLVM (LLVM 15 currently).

## Option1 : Use Docker
Clone repository
```
git clone https://github.com/Mewz-project/Wasker
cd Wasker
```

Create directory for mount and place input Wasm/WAT file. 

Please refer [examples](./examples) for building Wasm from Rust and Go. 
Here, as an example, we'll use the already built `helloworld.wat` included in this repository.
```
mkdir -p mount
mv helloworld.wat mount
```

Run Wasker. ELF file will be generated under `mount` directory.
```
// TODO
docker run -v mount:/wasker wasker mount/helloworld.wat
```


## Option2 : Build from source
Clone repository
```
git clone https://github.com/Mewz-project/Wasker
cd Wasker
```

Install LLVM locally
```
mkdir -p dependencies/llvm
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4.tar.xz -O /tmp/llvm-15.0.0.tar.xz
tar -xvf /tmp/llvm-15.0.0.tar.xz -C dependencies/llvm
export LLVM_SYS_150_PREFIX=$PWD/dependencies/llvm
```

Run Wasker
```
cargo run helloworld.wat
```

# How to run Wasker outputs
// TODO