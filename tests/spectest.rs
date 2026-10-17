//! Run the WebAssembly spec tests (`tests/spec/test/core/*.wast`) against Wasker.
//!
//! For each `(module ...)` in a `.wast` file, the module is compiled with Wasker, and the
//! assertions that follow it are turned into a C program (test cases). The test cases are
//! linked with the Wasker output and the test runtime (`tests/runtime`), then executed.
//! Known failures are listed in `spectest/ignore_list.rs` and skipped, so every assertion
//! that is executed must pass.

#[path = "spectest/ignore_list.rs"]
mod ignore_list;

use ignore_list::{Ignore, IGNORE_LIST};
use std::collections::{BTreeMap, HashMap, HashSet};
use std::fs;
use std::path::{Path, PathBuf};
use std::process::Command;
use wast::core::{NanPattern, WastArgCore, WastRetCore};
use wast::lexer::Lexer;
use wast::parser::{self, ParseBuffer};
use wast::{QuoteWat, Wast, WastArg, WastDirective, WastExecute, WastInvoke, WastRet};

const SPEC_DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/spec/test/core");
const RUNTIME_DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/runtime");
const WASKER: &str = env!("CARGO_BIN_EXE_wasker");
/// Time limit for running the test cases of a module, in seconds.
const TIMEOUT_SECS: &str = "60";

macro_rules! spec_tests {
    ($($name:ident => $file:literal,)*) => {
        $(
            #[test]
            fn $name() {
                run_wast($file);
            }
        )*
    };
}

spec_tests! {
    address => "address.wast",
    align => "align.wast",
    binary_leb128 => "binary-leb128.wast",
    binary => "binary.wast",
    block => "block.wast",
    br_if => "br_if.wast",
    br_table => "br_table.wast",
    br => "br.wast",
    bulk => "bulk.wast",
    call_indirect => "call_indirect.wast",
    call => "call.wast",
    comments => "comments.wast",
    r#const => "const.wast",
    conversions => "conversions.wast",
    custom => "custom.wast",
    data => "data.wast",
    elem => "elem.wast",
    endianness => "endianness.wast",
    exports => "exports.wast",
    f32_bitwise => "f32_bitwise.wast",
    f32_cmp => "f32_cmp.wast",
    f32 => "f32.wast",
    f64_bitwise => "f64_bitwise.wast",
    f64_cmp => "f64_cmp.wast",
    f64 => "f64.wast",
    fac => "fac.wast",
    float_exprs => "float_exprs.wast",
    float_literals => "float_literals.wast",
    float_memory => "float_memory.wast",
    float_misc => "float_misc.wast",
    forward => "forward.wast",
    func_ptrs => "func_ptrs.wast",
    func => "func.wast",
    global => "global.wast",
    i32 => "i32.wast",
    i64 => "i64.wast",
    r#if => "if.wast",
    imports => "imports.wast",
    inline_module => "inline-module.wast",
    int_exprs => "int_exprs.wast",
    int_literals => "int_literals.wast",
    labels => "labels.wast",
    left_to_right => "left-to-right.wast",
    linking => "linking.wast",
    load => "load.wast",
    local_get => "local_get.wast",
    local_set => "local_set.wast",
    local_tee => "local_tee.wast",
    r#loop => "loop.wast",
    memory_copy => "memory_copy.wast",
    memory_fill => "memory_fill.wast",
    memory_grow => "memory_grow.wast",
    memory_init => "memory_init.wast",
    memory_redundancy => "memory_redundancy.wast",
    memory_size => "memory_size.wast",
    memory_trap => "memory_trap.wast",
    memory => "memory.wast",
    names => "names.wast",
    nop => "nop.wast",
    obsolete_keywords => "obsolete-keywords.wast",
    ref_func => "ref_func.wast",
    ref_is_null => "ref_is_null.wast",
    ref_null => "ref_null.wast",
    r#return => "return.wast",
    select => "select.wast",
    skip_stack_guard_page => "skip-stack-guard-page.wast",
    stack => "stack.wast",
    start => "start.wast",
    store => "store.wast",
    switch => "switch.wast",
    table_copy => "table_copy.wast",
    table_fill => "table_fill.wast",
    table_get => "table_get.wast",
    table_grow => "table_grow.wast",
    table_init => "table_init.wast",
    table_set => "table_set.wast",
    table_size => "table_size.wast",
    table_sub => "table-sub.wast",
    table => "table.wast",
    token => "token.wast",
    traps => "traps.wast",
    r#type => "type.wast",
    unreachable => "unreachable.wast",
    unreached_invalid => "unreached-invalid.wast",
    unreached_valid => "unreached-valid.wast",
    unwind => "unwind.wast",
    utf8_custom_section_id => "utf8-custom-section-id.wast",
    utf8_import_field => "utf8-import-field.wast",
    utf8_import_module => "utf8-import-module.wast",
    utf8_invalid_encoding => "utf8-invalid-encoding.wast",
}

#[derive(Default)]
struct Stats {
    executed: usize,
    ignored: usize,
    unsupported: usize,
}

fn run_wast(file: &str) {
    if let Some(reason) = ignored_file(file) {
        println!("{file}: skipped ({reason})");
        return;
    }

    let text = fs::read_to_string(Path::new(SPEC_DIR).join(file)).expect("read wast");
    // The spec tests contain unicode characters that the lexer rejects by default.
    let mut lexer = Lexer::new(&text);
    lexer.allow_confusing_unicode(true);
    let buf = ParseBuffer::new_with_lexer(lexer).unwrap_or_else(|e| panic!("{file}: {e}"));
    let wast: Wast = parser::parse(&buf).unwrap_or_else(|e| panic!("{file}: {e}"));

    let stem = file.trim_end_matches(".wast");
    let dir = Path::new(env!("CARGO_TARGET_TMPDIR"))
        .join("spectest")
        .join(stem);
    let _ = fs::remove_dir_all(&dir);
    fs::create_dir_all(&dir).expect("create output directory");

    let mut stats = Stats::default();
    let mut failures = Vec::new();
    // Test cases for the module defined last. None if that module is skipped or failed.
    let mut current: Option<TestCases> = None;
    // Whether the module defined last is skipped by the ignore list.
    let mut module_ignored = false;
    let mut n_modules = 0;

    for directive in wast.directives {
        let line = directive.span().linecol_in(&text).0 + 1;
        match directive {
            WastDirective::Module(mut module) => {
                if let Some(test_cases) = current.take() {
                    test_cases.run(&mut failures);
                }
                module_ignored = is_ignored(file, line, None);
                if module_ignored {
                    stats.ignored += 1;
                    continue;
                }
                let wasm = match module.encode() {
                    Ok(wasm) => wasm,
                    Err(e) => {
                        failures.push(format!("{file}:{line}: failed to encode module: {e}"));
                        continue;
                    }
                };
                let name = format!("m{n_modules}");
                n_modules += 1;
                match TestCases::new(&dir, &name, file, line, &wasm) {
                    Ok(test_cases) => current = Some(test_cases),
                    Err(e) => failures.push(format!("{file}:{line}: {e}")),
                }
            }
            WastDirective::AssertReturn { exec, results, .. } => {
                let Some(test_cases) = current.as_mut() else {
                    // The module is ignored or failed (the failure is already reported).
                    stats.ignored += module_ignored as usize;
                    continue;
                };
                let WastExecute::Invoke(invoke) = exec else {
                    stats.unsupported += 1;
                    continue;
                };
                if is_ignored(file, line, Some(invoke.name)) {
                    stats.ignored += 1;
                } else if test_cases.assert_return(line, &invoke, &results) {
                    stats.executed += 1;
                } else {
                    stats.unsupported += 1;
                }
            }
            WastDirective::AssertTrap { exec, .. } => {
                let Some(test_cases) = current.as_mut() else {
                    // The module is ignored or failed (the failure is already reported).
                    stats.ignored += module_ignored as usize;
                    continue;
                };
                let WastExecute::Invoke(invoke) = exec else {
                    stats.unsupported += 1;
                    continue;
                };
                if is_ignored(file, line, Some(invoke.name)) {
                    stats.ignored += 1;
                } else if test_cases.assert_trap(line, &invoke) {
                    stats.executed += 1;
                } else {
                    stats.unsupported += 1;
                }
            }
            WastDirective::Invoke(invoke) => {
                let Some(test_cases) = current.as_mut() else {
                    // The module is ignored or failed (the failure is already reported).
                    stats.ignored += module_ignored as usize;
                    continue;
                };
                if is_ignored(file, line, Some(invoke.name)) {
                    stats.ignored += 1;
                } else if test_cases.invoke(line, &invoke) {
                    stats.executed += 1;
                } else {
                    stats.unsupported += 1;
                }
            }
            WastDirective::AssertInvalid { mut module, .. } => {
                if is_ignored(file, line, None) || assert_invalid_ignored() {
                    stats.ignored += 1;
                    continue;
                }
                match module.encode() {
                    Ok(wasm) => {
                        stats.executed += 1;
                        expect_compile_error(&dir, file, line, &wasm, &mut failures);
                    }
                    // The module cannot be encoded into a binary to give Wasker.
                    Err(_) => stats.unsupported += 1,
                }
            }
            // Malformed text modules are rejected by the text parser, not by Wasker.
            WastDirective::AssertMalformed {
                module: mut module @ QuoteWat::Wat(_),
                ..
            } => {
                if is_ignored(file, line, None) {
                    stats.ignored += 1;
                    continue;
                }
                match module.encode() {
                    Ok(wasm) => {
                        stats.executed += 1;
                        expect_compile_error(&dir, file, line, &wasm, &mut failures);
                    }
                    Err(_) => stats.unsupported += 1,
                }
            }
            _ => stats.unsupported += 1,
        }
    }
    if let Some(test_cases) = current.take() {
        test_cases.run(&mut failures);
    }

    println!(
        "{file}: executed {}, ignored {}, unsupported {}, failed {}",
        stats.executed,
        stats.ignored,
        stats.unsupported,
        failures.len()
    );
    if !failures.is_empty() {
        panic!(
            "{} failure(s) in {file}:\n{}",
            failures.len(),
            failures.join("\n")
        );
    }
}

fn ignored_file(file: &str) -> Option<&'static str> {
    IGNORE_LIST.iter().find_map(|ignore| match ignore {
        Ignore::File { wast, reason } if *wast == file => Some(*reason),
        _ => None,
    })
}

fn is_ignored(file: &str, line: usize, invoke: Option<&str>) -> bool {
    IGNORE_LIST.iter().any(|ignore| match ignore {
        Ignore::Lines { wast, lines, .. } => *wast == file && lines.contains(&line),
        Ignore::Invoke { wast, name, .. } => *wast == file && Some(*name) == invoke,
        _ => false,
    })
}

fn assert_invalid_ignored() -> bool {
    IGNORE_LIST
        .iter()
        .any(|ignore| matches!(ignore, Ignore::AssertInvalid { .. }))
}

/// Run Wasker on `wasm` and return the exit code (None if it was killed by a signal).
fn run_wasker(wasm_path: &Path, obj_path: &Path) -> (Option<i32>, String) {
    let output = Command::new(WASKER)
        .arg(wasm_path)
        .arg("-o")
        .arg(obj_path)
        .env("RUST_LOG", "error")
        .output()
        .expect("run wasker");
    (
        output.status.code(),
        String::from_utf8_lossy(&output.stderr).into_owned(),
    )
}

/// Wasker must reject `wasm` with an error (exit code 1). A panic or a crash is a failure.
fn expect_compile_error(
    dir: &Path,
    file: &str,
    line: usize,
    wasm: &[u8],
    failures: &mut Vec<String>,
) {
    let wasm_path = dir.join(format!("invalid_{line}.wasm"));
    fs::write(&wasm_path, wasm).expect("write wasm");
    let (code, stderr) = run_wasker(&wasm_path, &dir.join(format!("invalid_{line}.o")));
    match code {
        Some(1) => {}
        Some(0) => failures.push(format!(
            "{file}:{line}: expected a compile error, but compiled successfully"
        )),
        _ => failures.push(format!(
            "{file}:{line}: expected a compile error, but wasker crashed ({code:?}): {}",
            error_message(&stderr)
        )),
    }
}

/// Pick the error message from the stderr of Wasker.
fn error_message(stderr: &str) -> String {
    let lines: Vec<&str> = stderr.lines().collect();
    if let Some(i) = lines.iter().position(|l| l.contains("panicked at")) {
        // The panic message follows the location line.
        return format!("panicked: {}", lines.get(i + 1).unwrap_or(&"").trim());
    }
    lines
        .iter()
        .find(|l| l.starts_with("Error"))
        .or(lines.iter().rev().find(|l| !l.trim().is_empty()))
        .unwrap_or(&"")
        .trim()
        .to_string()
}

#[derive(Clone, Copy, PartialEq)]
enum ValType {
    I32,
    I64,
    F32,
    F64,
}

impl ValType {
    fn c_type(self) -> &'static str {
        match self {
            ValType::I32 => "uint32_t",
            ValType::I64 => "uint64_t",
            ValType::F32 => "float",
            ValType::F64 => "double",
        }
    }
}

#[derive(Clone)]
struct FuncType {
    params: Vec<ValType>,
    results: Vec<ValType>,
}

/// Read the types of the exported functions. Functions using other types are omitted.
fn exported_functions(wasm: &[u8]) -> Result<HashMap<String, FuncType>, String> {
    use wasmparser::{ExternalKind, Payload, Type, TypeRef};

    let convert = |types: &[wasmparser::ValType]| -> Option<Vec<ValType>> {
        types
            .iter()
            .map(|t| match t {
                wasmparser::ValType::I32 => Some(ValType::I32),
                wasmparser::ValType::I64 => Some(ValType::I64),
                wasmparser::ValType::F32 => Some(ValType::F32),
                wasmparser::ValType::F64 => Some(ValType::F64),
                _ => None,
            })
            .collect()
    };

    let mut types = Vec::new();
    let mut funcs = Vec::new();
    let mut exports = Vec::new();
    for payload in wasmparser::Parser::new(0).parse_all(wasm) {
        match payload.map_err(|e| format!("failed to parse module: {e}"))? {
            Payload::TypeSection(reader) => {
                for ty in reader {
                    types.push(match ty {
                        Ok(Type::Func(f)) => convert(f.params())
                            .zip(convert(f.results()))
                            .map(|(params, results)| FuncType { params, results }),
                        _ => None,
                    });
                }
            }
            Payload::ImportSection(reader) => {
                for import in reader.into_iter().flatten() {
                    if let TypeRef::Func(ty) = import.ty {
                        funcs.push(ty);
                    }
                }
            }
            Payload::FunctionSection(reader) => funcs.extend(reader.into_iter().flatten()),
            Payload::ExportSection(reader) => {
                for export in reader.into_iter().flatten() {
                    if export.kind == ExternalKind::Func {
                        exports.push((export.name.to_string(), export.index));
                    }
                }
            }
            _ => {}
        }
    }

    Ok(exports
        .into_iter()
        .filter_map(|(name, index)| {
            let ty = types.get(*funcs.get(index as usize)? as usize)?.clone()?;
            Some((name, ty))
        })
        .collect())
}

/// Test cases for one module: a C program calling the exported functions of the module.
struct TestCases {
    dir: PathBuf,
    name: String,
    /// Where the module comes from, for messages.
    origin: String,
    exports: HashMap<String, FuncType>,
    /// Export name -> C function name, for the declarations.
    used: BTreeMap<String, String>,
    body: Vec<String>,
    /// wast line of each assertion, in the order of execution.
    lines: Vec<usize>,
}

impl TestCases {
    /// Compile the module with Wasker.
    fn new(dir: &Path, name: &str, file: &str, line: usize, wasm: &[u8]) -> Result<Self, String> {
        let wasm_path = dir.join(format!("{name}.wasm"));
        fs::write(&wasm_path, wasm).expect("write wasm");
        let (code, stderr) = run_wasker(&wasm_path, &dir.join(format!("{name}.o")));
        if code != Some(0) {
            return Err(format!(
                "wasker failed ({code:?}): {}",
                error_message(&stderr)
            ));
        }
        Ok(TestCases {
            dir: dir.to_path_buf(),
            name: name.to_string(),
            origin: format!("{file}:{line}"),
            exports: exported_functions(wasm)?,
            used: BTreeMap::new(),
            body: Vec::new(),
            lines: Vec::new(),
        })
    }

    /// Build a C expression calling the function of `invoke`. None if it is not supported.
    fn call(&mut self, invoke: &WastInvoke) -> Option<(String, Vec<ValType>)> {
        if invoke.module.is_some() {
            return None;
        }
        // The export name is used as a symbol name in the C source and the assembly.
        let name = invoke.name;
        if name.is_empty()
            || name
                .chars()
                .any(|c| c == '"' || c == '\\' || c.is_control())
        {
            return None;
        }
        let ty = self.exports.get(name)?;
        if ty.params.len() != invoke.args.len() || ty.results.len() > 1 {
            return None;
        }
        let mut args = Vec::new();
        for (arg, &param) in invoke.args.iter().zip(&ty.params) {
            args.push(match (arg, param) {
                (WastArg::Core(WastArgCore::I32(v)), ValType::I32) => format!("0x{:x}u", *v as u32),
                (WastArg::Core(WastArgCore::I64(v)), ValType::I64) => {
                    format!("0x{:x}ull", *v as u64)
                }
                (WastArg::Core(WastArgCore::F32(v)), ValType::F32) => {
                    format!("rt_f32(0x{:08x}u)", v.bits)
                }
                (WastArg::Core(WastArgCore::F64(v)), ValType::F64) => {
                    format!("rt_f64(0x{:016x}ull)", v.bits)
                }
                _ => return None,
            });
        }
        let id = self.used.len();
        let c_name = self
            .used
            .entry(name.to_string())
            .or_insert_with(|| format!("wasm_f{id}"))
            .clone();
        let results = self.exports[name].results.clone();
        Some((format!("{c_name}({})", args.join(", ")), results))
    }

    fn assert_return(&mut self, line: usize, invoke: &WastInvoke, results: &[WastRet]) -> bool {
        let Some((call, result_types)) = self.call(invoke) else {
            return false;
        };
        if result_types.len() != results.len() {
            return false;
        }
        let check = match (results.first(), result_types.first()) {
            (None, None) => format!("{call}; rt_pass({line})"),
            (Some(WastRet::Core(ret)), Some(&ty)) => match (ret, ty) {
                (WastRetCore::I32(v), ValType::I32) => {
                    format!("rt_check_i32({line}, {call}, 0x{:x}u)", *v as u32)
                }
                (WastRetCore::I64(v), ValType::I64) => {
                    format!("rt_check_i64({line}, {call}, 0x{:x}ull)", *v as u64)
                }
                (WastRetCore::F32(NanPattern::Value(v)), ValType::F32) => {
                    format!("rt_check_f32({line}, {call}, 0x{:08x}u)", v.bits)
                }
                (WastRetCore::F64(NanPattern::Value(v)), ValType::F64) => {
                    format!("rt_check_f64({line}, {call}, 0x{:016x}ull)", v.bits)
                }
                (WastRetCore::F32(NanPattern::CanonicalNan), ValType::F32) => {
                    format!("rt_check_f32_canonical_nan({line}, {call})")
                }
                (WastRetCore::F64(NanPattern::CanonicalNan), ValType::F64) => {
                    format!("rt_check_f64_canonical_nan({line}, {call})")
                }
                (WastRetCore::F32(NanPattern::ArithmeticNan), ValType::F32) => {
                    format!("rt_check_f32_arithmetic_nan({line}, {call})")
                }
                (WastRetCore::F64(NanPattern::ArithmeticNan), ValType::F64) => {
                    format!("rt_check_f64_arithmetic_nan({line}, {call})")
                }
                _ => return false,
            },
            _ => return false,
        };
        self.body.push(format!("RT_RUN({line}, {check});"));
        self.lines.push(line);
        true
    }

    fn assert_trap(&mut self, line: usize, invoke: &WastInvoke) -> bool {
        let Some((call, _)) = self.call(invoke) else {
            return false;
        };
        self.body.push(format!("RT_EXPECT_TRAP({line}, {call});"));
        self.lines.push(line);
        true
    }

    fn invoke(&mut self, line: usize, invoke: &WastInvoke) -> bool {
        let Some((call, _)) = self.call(invoke) else {
            return false;
        };
        self.body
            .push(format!("RT_RUN({line}, (void){call}; rt_pass({line}));"));
        self.lines.push(line);
        true
    }

    /// Generate the C program, build it with the Wasker output, run it, and collect failures.
    fn run(self, failures: &mut Vec<String>) {
        if self.lines.is_empty() {
            return;
        }
        let origin = &self.origin;

        let mut src = format!(
            "// Generated from {origin} by tests/spectest.rs. Do not edit.\n#include \"runtime.h\"\n\n"
        );
        for (export, c_name) in &self.used {
            let ty = &self.exports[export];
            let ret = ty.results.first().map_or("void", |t| t.c_type());
            let params = if ty.params.is_empty() {
                "void".to_string()
            } else {
                ty.params
                    .iter()
                    .map(|t| t.c_type())
                    .collect::<Vec<_>>()
                    .join(", ")
            };
            src += &format!("extern {ret} {c_name}({params}) __asm__(\"\\\"{export}\\\"\");\n");
        }
        src += "\nint main(void)\n{\n    rt_init();\n    wasker_main();\n";
        for stmt in &self.body {
            src += &format!("    {stmt}\n");
        }
        src += "    return rt_finish();\n}\n";

        let c_path = self.dir.join(format!("{}_test_cases.c", self.name));
        let exe_path = self.dir.join(&self.name);
        fs::write(&c_path, src).expect("write test cases");

        let output = Command::new("gcc")
            .args(["-O0", "-w", "-no-pie", "-I", RUNTIME_DIR, "-o"])
            .arg(&exe_path)
            .arg(&c_path)
            .arg(self.dir.join(format!("{}.o", self.name)))
            .arg(Path::new(RUNTIME_DIR).join("runtime.c"))
            .arg("-lm")
            .output()
            .expect("run gcc");
        if !output.status.success() {
            failures.push(format!(
                "{origin}: failed to build test cases: {}",
                String::from_utf8_lossy(&output.stderr).trim()
            ));
            return;
        }

        let output = Command::new("timeout")
            .arg(TIMEOUT_SECS)
            .arg(&exe_path)
            .output()
            .expect("run test cases");
        let stdout = String::from_utf8_lossy(&output.stdout);
        let file = origin.split(':').next().unwrap_or(origin);
        let mut reported = HashSet::new();
        let mut done = false;
        for l in stdout.lines() {
            if let Some(rest) = l.strip_prefix("PASS ") {
                reported.insert(rest.trim().parse::<usize>().unwrap_or(0));
            } else if let Some(rest) = l.strip_prefix("FAIL ") {
                let line = rest.split(':').next().unwrap_or("").trim();
                reported.insert(line.parse::<usize>().unwrap_or(0));
                failures.push(format!("{file}:{rest}"));
            } else if l.starts_with("DONE ") {
                done = true;
            }
        }
        if !done {
            // The process crashed or timed out: point at the first assertion without a result.
            let at = self.lines.iter().find(|l| !reported.contains(l));
            let status = if output.status.code() == Some(124) {
                "timed out".to_string()
            } else {
                format!("crashed ({})", output.status)
            };
            match at {
                Some(line) => failures.push(format!("{file}:{line}: test cases {status}")),
                None => failures.push(format!("{origin}: test cases {status}")),
            }
        }
    }
}
