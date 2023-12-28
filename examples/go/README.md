# Example application in Go

## Build Wasm binary from Go
Go >= 1.21 supports WASI preview 1.

```
cd Wasker/example/go

# Build
GOARCH=wasm GOOS=wasip1 go build -o go.wasm main.go 
```