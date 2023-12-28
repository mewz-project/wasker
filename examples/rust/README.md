# Example application in Rust

## Build Wasm binary from Rust
```
cd Wasker/example/rust

# Add Wasm target if you haven't done yet
rustup target add wasm32-wasi

# Build
# Wasm file will be generated at target/wasm32-wasi/debug/rust.wasm
cargo build --target wasm32-wasi
```