//! Wasker is a WebAssembly compiler written in Rust.
//! It compiles Wasm binary into ELF format binary.

pub mod compiler;
pub mod environment;
pub mod inkwell;
pub mod insts;
pub mod section;
pub mod wasi_wrapper;
