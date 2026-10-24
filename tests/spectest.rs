//! Run the WebAssembly spec tests (`tests/spec/test/core/*.wast`) against Wasker.
//!
//! For each `(module ...)` in a `.wast` file, the module is compiled with Wasker, and the
//! assertions that follow it are turned into a C program (test cases). The test cases are
//! linked with the Wasker output and the test runtime (`tests/runtime`), then executed.
//! Known failures are listed in `spectest/ignore_list.rs` and skipped, so every assertion
//! that is executed must pass.

#[path = "spectest/ignore_list.rs"]
mod ignore_list;

use handlebars::Handlebars;
use ignore_list::{Ignore, IGNORE_LIST};
use serde::Serialize;
use std::collections::{BTreeMap, HashMap, HashSet};
use std::fs;
use std::path::{Path, PathBuf};
use std::process::{Command, ExitStatus};
use wast::core::{NanPattern, WastArgCore, WastRetCore};
use wast::lexer::Lexer;
use wast::parser::{self, ParseBuffer};
use wast::{QuoteWat, Wast, WastArg, WastDirective, WastExecute, WastInvoke, WastRet};

const SPEC_DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/spec/test/core");
const RUNTIME_DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/runtime");
const WASKER: &str = env!("CARGO_BIN_EXE_wasker");
/// C source of the test cases. Each assertion becomes one statement in `main`.
const TEST_CASES_TEMPLATE: &str = include_str!("spectest/test_cases.c.hbs");
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

/// Spec test features that this runner does not handle.
///
/// They are decided only from the wast file (directives, values, and the types of the module),
/// never from a failure to generate test cases, so that a bug in the runner cannot silently
/// turn an assertion into one not handled by the runner. A failure to generate test cases is a failure.
#[derive(Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Debug)]
enum NotHandledByRunner {
    /// Directives such as `register`, `assert_exhaustion` and `assert_unlinkable`.
    Directive,
    /// `assert_malformed` with a text module, which is rejected by the text parser, not by Wasker.
    QuoteModule,
    /// A module that the wast crate cannot encode into a binary.
    UnencodableModule,
    /// `invoke $module ...`, which needs linking multiple modules.
    NamedModule,
    /// An action other than `invoke`, such as `get`.
    NonInvoke,
    /// Values other than i32, i64, f32 and f64.
    ValueType,
    /// Functions with multiple results.
    MultiValue,
    /// Export names that cannot be used as a symbol name.
    SymbolName,
}

/// Why test cases cannot be generated for an assertion.
enum Skip {
    NotHandledByRunner(NotHandledByRunner),
    /// The assertion should be supported, so this is a failure.
    Error(String),
}

#[derive(Default)]
struct Stats {
    executed: usize,
    ignored: usize,
    not_handled_by_runner: BTreeMap<NotHandledByRunner, usize>,
}

impl Stats {
    fn not_handled_by_runner(&mut self, kind: NotHandledByRunner) {
        *self.not_handled_by_runner.entry(kind).or_default() += 1;
    }

    /// Record the result of generating test cases for an assertion.
    fn record(&mut self, result: Result<(), Skip>, location: String, failures: &mut Vec<String>) {
        match result {
            Ok(()) => self.executed += 1,
            Err(Skip::NotHandledByRunner(kind)) => self.not_handled_by_runner(kind),
            Err(Skip::Error(e)) => failures.push(format!("{location}: {e}")),
        }
    }
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
                    stats.not_handled_by_runner(NotHandledByRunner::NonInvoke);
                    continue;
                };
                if is_ignored(file, line, Some(invoke.name)) {
                    stats.ignored += 1;
                    continue;
                }
                let result = test_cases.assert_return(line, &invoke, &results);
                stats.record(result, format!("{file}:{line}"), &mut failures);
            }
            WastDirective::AssertTrap { exec, .. } => {
                let Some(test_cases) = current.as_mut() else {
                    // The module is ignored or failed (the failure is already reported).
                    stats.ignored += module_ignored as usize;
                    continue;
                };
                let WastExecute::Invoke(invoke) = exec else {
                    stats.not_handled_by_runner(NotHandledByRunner::NonInvoke);
                    continue;
                };
                if is_ignored(file, line, Some(invoke.name)) {
                    stats.ignored += 1;
                    continue;
                }
                let result = test_cases.assert_trap(line, &invoke);
                stats.record(result, format!("{file}:{line}"), &mut failures);
            }
            WastDirective::Invoke(invoke) => {
                let Some(test_cases) = current.as_mut() else {
                    // The module is ignored or failed (the failure is already reported).
                    stats.ignored += module_ignored as usize;
                    continue;
                };
                if is_ignored(file, line, Some(invoke.name)) {
                    stats.ignored += 1;
                    continue;
                }
                let result = test_cases.invoke(line, &invoke);
                stats.record(result, format!("{file}:{line}"), &mut failures);
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
                    Err(_) => stats.not_handled_by_runner(NotHandledByRunner::UnencodableModule),
                }
            }
            WastDirective::AssertMalformed {
                module: QuoteWat::QuoteModule(..),
                ..
            } => stats.not_handled_by_runner(NotHandledByRunner::QuoteModule),
            WastDirective::AssertMalformed { mut module, .. } => {
                if is_ignored(file, line, None) {
                    stats.ignored += 1;
                    continue;
                }
                match module.encode() {
                    Ok(wasm) => {
                        stats.executed += 1;
                        expect_compile_error(&dir, file, line, &wasm, &mut failures);
                    }
                    Err(_) => stats.not_handled_by_runner(NotHandledByRunner::UnencodableModule),
                }
            }
            _ => stats.not_handled_by_runner(NotHandledByRunner::Directive),
        }
    }
    if let Some(test_cases) = current.take() {
        test_cases.run(&mut failures);
    }

    println!(
        "{file}: executed {}, ignored {}, not handled by runner {:?}, failed {}",
        stats.executed,
        stats.ignored,
        stats.not_handled_by_runner,
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

/// Run `program` with the time limit. `timeout` exits with 124 when the limit is exceeded.
fn command_with_timeout(program: &Path) -> Command {
    let mut command = Command::new("timeout");
    command.arg(TIMEOUT_SECS).arg(program);
    command
}

/// Describe an abnormal exit status of a process run by `command_with_timeout`.
fn describe_status(status: ExitStatus) -> String {
    match status.code() {
        Some(124) => format!("timed out after {TIMEOUT_SECS}s"),
        Some(code) => format!("exit code {code}"),
        None => format!("killed ({status})"),
    }
}

/// Run Wasker on `wasm` and return its exit status and stderr.
fn run_wasker(wasm_path: &Path, obj_path: &Path) -> (ExitStatus, String) {
    let output = command_with_timeout(Path::new(WASKER))
        .arg(wasm_path)
        .arg("-o")
        .arg(obj_path)
        .env("RUST_LOG", "error")
        .output()
        .expect("run wasker");
    (
        output.status,
        String::from_utf8_lossy(&output.stderr).into_owned(),
    )
}

/// Wasker must reject `wasm` with an error (exit code 1). A panic, a crash or a timeout is a failure.
fn expect_compile_error(
    dir: &Path,
    file: &str,
    line: usize,
    wasm: &[u8],
    failures: &mut Vec<String>,
) {
    let wasm_path = dir.join(format!("invalid_{line}.wasm"));
    fs::write(&wasm_path, wasm).expect("write wasm");
    let (status, stderr) = run_wasker(&wasm_path, &dir.join(format!("invalid_{line}.o")));
    match status.code() {
        Some(1) => {}
        Some(0) => failures.push(format!(
            "{file}:{line}: expected a compile error, but compiled successfully"
        )),
        _ => failures.push(format!(
            "{file}:{line}: expected a compile error, but wasker failed ({}): {}",
            describe_status(status),
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

/// Read the types of the exported functions. A function whose types the runner does not handle maps to the reason.
fn exported_functions(
    wasm: &[u8],
) -> Result<HashMap<String, Result<FuncType, NotHandledByRunner>>, String> {
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
                        Ok(Type::Func(f)) => match (convert(f.params()), convert(f.results())) {
                            (Some(_), Some(results)) if results.len() > 1 => {
                                Err(NotHandledByRunner::MultiValue)
                            }
                            (Some(params), Some(results)) => Ok(FuncType { params, results }),
                            _ => Err(NotHandledByRunner::ValueType),
                        },
                        _ => Err(NotHandledByRunner::ValueType),
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
            let ty = types.get(*funcs.get(index as usize)? as usize)?.clone();
            Some((name, ty))
        })
        .collect())
}

/// Data rendered into `TEST_CASES_TEMPLATE`.
#[derive(Serialize)]
struct TestCasesSource<'a> {
    origin: &'a str,
    externs: Vec<Extern<'a>>,
    /// C statements, one per assertion.
    body: &'a [String],
}

/// Declaration of an exported function called from the test cases.
#[derive(Serialize)]
struct Extern<'a> {
    export: &'a str,
    c_name: &'a str,
    ret: &'static str,
    params: String,
}

/// Test cases for one module: a C program calling the exported functions of the module.
struct TestCases {
    dir: PathBuf,
    name: String,
    /// Where the module comes from, for messages.
    origin: String,
    exports: HashMap<String, Result<FuncType, NotHandledByRunner>>,
    /// Export name -> C function name and type, for the declarations.
    used: BTreeMap<String, (String, FuncType)>,
    body: Vec<String>,
    /// wast line of each assertion, in the order of execution.
    lines: Vec<usize>,
}

impl TestCases {
    /// Compile the module with Wasker.
    fn new(dir: &Path, name: &str, file: &str, line: usize, wasm: &[u8]) -> Result<Self, String> {
        let wasm_path = dir.join(format!("{name}.wasm"));
        fs::write(&wasm_path, wasm).expect("write wasm");
        let (status, stderr) = run_wasker(&wasm_path, &dir.join(format!("{name}.o")));
        if !status.success() {
            return Err(format!(
                "wasker failed ({}): {}",
                describe_status(status),
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

    /// Build a C expression calling the function of `invoke`, and return it with the result types.
    fn call(&mut self, invoke: &WastInvoke) -> Result<(String, Vec<ValType>), Skip> {
        if invoke.module.is_some() {
            return Err(Skip::NotHandledByRunner(NotHandledByRunner::NamedModule));
        }
        // The export name is used as a symbol name in the C source and the assembly.
        let name = invoke.name;
        if name.is_empty()
            || name
                .chars()
                .any(|c| c == '"' || c == '\\' || c.is_control())
        {
            return Err(Skip::NotHandledByRunner(NotHandledByRunner::SymbolName));
        }
        let mut args = Vec::new();
        for arg in &invoke.args {
            args.push(match arg {
                WastArg::Core(WastArgCore::I32(v)) => (ValType::I32, format!("0x{:x}u", *v as u32)),
                WastArg::Core(WastArgCore::I64(v)) => {
                    (ValType::I64, format!("0x{:x}ull", *v as u64))
                }
                WastArg::Core(WastArgCore::F32(v)) => {
                    (ValType::F32, format!("rt_f32(0x{:08x}u)", v.bits))
                }
                WastArg::Core(WastArgCore::F64(v)) => {
                    (ValType::F64, format!("rt_f64(0x{:016x}ull)", v.bits))
                }
                _ => return Err(Skip::NotHandledByRunner(NotHandledByRunner::ValueType)),
            });
        }
        let ty = match self.exports.get(name) {
            None => return Err(Skip::Error(format!("no exported function \"{name}\""))),
            Some(Err(kind)) => return Err(Skip::NotHandledByRunner(*kind)),
            Some(Ok(ty)) => ty.clone(),
        };
        if args.iter().map(|(t, _)| *t).ne(ty.params.iter().copied()) {
            return Err(Skip::Error(format!(
                "arguments do not match the type of \"{name}\""
            )));
        }
        let id = self.used.len();
        let (c_name, _) = self
            .used
            .entry(name.to_string())
            .or_insert_with(|| (format!("wasm_f{id}"), ty.clone()));
        let args: Vec<String> = args.into_iter().map(|(_, v)| v).collect();
        Ok((format!("{c_name}({})", args.join(", ")), ty.results))
    }

    fn assert_return(
        &mut self,
        line: usize,
        invoke: &WastInvoke,
        results: &[WastRet],
    ) -> Result<(), Skip> {
        if results.len() > 1 {
            return Err(Skip::NotHandledByRunner(NotHandledByRunner::MultiValue));
        }
        let expected = match results.first() {
            None => None,
            Some(WastRet::Core(
                ret @ (WastRetCore::I32(_)
                | WastRetCore::I64(_)
                | WastRetCore::F32(_)
                | WastRetCore::F64(_)),
            )) => Some(ret),
            Some(_) => return Err(Skip::NotHandledByRunner(NotHandledByRunner::ValueType)),
        };
        let (call, result_types) = self.call(invoke)?;
        let check = match (expected, result_types.first()) {
            (None, None) => format!("{call}; rt_pass({line})"),
            (Some(ret), Some(&ty)) => match (ret, ty) {
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
                _ => return Err(Skip::Error("the result type does not match".to_string())),
            },
            _ => {
                return Err(Skip::Error(
                    "the number of results does not match".to_string(),
                ))
            }
        };
        self.body.push(format!("RT_RUN({line}, {check});"));
        self.lines.push(line);
        Ok(())
    }

    fn assert_trap(&mut self, line: usize, invoke: &WastInvoke) -> Result<(), Skip> {
        let (call, _) = self.call(invoke)?;
        self.body.push(format!("RT_EXPECT_TRAP({line}, {call});"));
        self.lines.push(line);
        Ok(())
    }

    fn invoke(&mut self, line: usize, invoke: &WastInvoke) -> Result<(), Skip> {
        let (call, _) = self.call(invoke)?;
        self.body
            .push(format!("RT_RUN({line}, (void){call}; rt_pass({line}));"));
        self.lines.push(line);
        Ok(())
    }

    /// Generate the C program, build it with the Wasker output, run it, and collect failures.
    fn run(self, failures: &mut Vec<String>) {
        if self.lines.is_empty() {
            return;
        }
        let origin = &self.origin;

        let externs = self
            .used
            .iter()
            .map(|(export, (c_name, ty))| Extern {
                export,
                c_name,
                ret: ty.results.first().map_or("void", |t| t.c_type()),
                params: if ty.params.is_empty() {
                    "void".to_string()
                } else {
                    ty.params
                        .iter()
                        .map(|t| t.c_type())
                        .collect::<Vec<_>>()
                        .join(", ")
                },
            })
            .collect();
        let source = TestCasesSource {
            origin,
            externs,
            body: &self.body,
        };
        let mut handlebars = Handlebars::new();
        // The output is C, not HTML.
        handlebars.register_escape_fn(handlebars::no_escape);
        handlebars.set_strict_mode(true);
        let src = handlebars
            .render_template(TEST_CASES_TEMPLATE, &source)
            .expect("render test cases");

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

        let output = command_with_timeout(&exe_path)
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
            let status = describe_status(output.status);
            match at {
                Some(line) => failures.push(format!("{file}:{line}: test cases failed ({status})")),
                None => failures.push(format!("{origin}: test cases failed ({status})")),
            }
        }
    }
}
