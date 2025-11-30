//! `section` module parse each section of Wasm binary.

use anyhow::{anyhow, bail, Context, Ok, Result};
use inkwell::{
    attributes::Attribute,
    types::{BasicMetadataTypeEnum, BasicType, BasicTypeEnum, FunctionType},
    values::{BasicValue, BasicValueEnum, PhiValue, PointerValue},
    AddressSpace,
};
use wasmparser::{
    Chunk, CustomSectionReader, DataKind, DataSectionReader, Element, ElementItems, ElementKind,
    ElementSectionReader, ExportSectionReader, FunctionBody, FunctionSectionReader,
    GlobalSectionReader, ImportSectionReader, MemorySectionReader, Name, NameSectionReader,
    Operator, Parser, Payload, SectionLimited, TableSectionReader, TypeRef, TypeSectionReader,
    ValType,
};

use crate::inkwell::InkwellTypes;
use crate::insts::control;
use crate::{
    environment::{Environment, Global},
    insts::parse_instruction,
};

/// Parse Wasm binary and generate LLVM IR
pub fn translate_module(mut data: &[u8], environment: &mut Environment<'_, '_>) -> Result<()> {
    // Setup wasker_main and wasker_init
    setup(environment)?;

    // Parse CustomSectionReader in advance to get function name

    // Parse Wasm binary and generate LLVM IR
    let mut code_section_data: Option<&[u8]> = None;
    let mut elements_section: Option<SectionLimited<'_, Element<'_>>> = None;

    let mut parser = Parser::new(0);
    loop {
        let payload = match parser.parse(data, true)? {
            Chunk::Parsed { consumed, payload } => {
                if let Payload::CodeSectionStart { size, .. } = &payload {
                    code_section_data = Some(&data[..(*size as usize + consumed)]);
                }
                data = &data[consumed..];
                payload
            }
            // this state isn't possible with `eof = true`
            Chunk::NeedMoreData(_) => unreachable!(),
        };

        match payload {
            Payload::TypeSection(types) => {
                parse_type_section(types, environment)?;
            }
            Payload::ImportSection(imports) => {
                parse_import_section(imports, environment)?;
            }
            Payload::FunctionSection(functions) => {
                parse_function_section(functions, environment)?;
            }
            Payload::MemorySection(memories) => {
                parse_memory_section(memories, environment)?;
            }
            Payload::TableSection(tables) => {
                parse_table_section(tables)?;
            }
            Payload::GlobalSection(globals) => {
                parse_global_section(globals, environment)?;
            }
            Payload::ExportSection(exports) => {
                parse_export_section(exports, environment)?;
            }
            Payload::ElementSection(elements) => {
                // parse later
                elements_section = Some(elements);
            }
            Payload::DataSection(datas) => {
                parse_data_section(datas, environment)?;
            }
            Payload::CodeSectionEntry(_) => {
                // parse later
            }
            Payload::CustomSection(c) => {
                parse_custom_section(c, environment)?;
            }
            Payload::End(..) => {
                log::trace!("EndSection");
                break;
            }
            Payload::Version { num, encoding, .. } => {
                log::trace!("version:{num}, encoding: {encoding:?}");
            }
            Payload::CodeSectionStart { count, range, size } => {
                log::trace!("CodeSectionStart: count:{count}, range:{range:?}, size:{size}",);
                parser.skip_section();
                data = &data[size as usize..];
            }
            _other => {
                log::warn!("Unimplemented Section. Run with `RUST_LOG=trace` environment variable for more info.");
            }
        }
    }

    define_functions(environment)?;
    if let Some(element_section) = elements_section {
        parse_element_section(element_section, environment)?;
    }

    match code_section_data {
        Some(mut cs_data) => {
            while let Chunk::Parsed { consumed, payload } =
                parser.parse(cs_data, false).expect("Error parse")
            {
                cs_data = &cs_data[consumed..];
                match payload {
                    Payload::CodeSectionStart { .. } => (),
                    Payload::CodeSectionEntry(f) => {
                        parse_code_section(f, environment)?;
                    }
                    _other => {
                        log::error!("Unexpected payload");
                    }
                }
            }
        }
        None => {
            log::error!("CodeSection empty");
        }
    }

    // complete wasker_main and wasker_init
    complete(environment)?;
    Ok(())
}

/// Convert wasmparser type to inkwell type
pub fn wasmparser_to_inkwell<'a>(
    wasmparser_type: &ValType,
    inkwell_types: &InkwellTypes<'a>,
) -> Result<BasicTypeEnum<'a>> {
    match wasmparser_type {
        ValType::I32 => Ok(BasicTypeEnum::IntType(inkwell_types.i32_type)),
        ValType::I64 => Ok(BasicTypeEnum::IntType(inkwell_types.i64_type)),
        ValType::F32 => Ok(BasicTypeEnum::FloatType(inkwell_types.f32_type)),
        ValType::F64 => Ok(BasicTypeEnum::FloatType(inkwell_types.f64_type)),
        _other => bail!("unimplemented ValType: {:?}", wasmparser_type),
    }
}

fn define_functions(environment: &mut Environment<'_, '_>) -> Result<()> {
    // assert
    if environment.function_list_name.len() != environment.function_list_signature.len() {
        log::error!(
            "funcion list length name vs signature = {} vs {}",
            environment.function_list_name.len(),
            environment.function_list_signature.len()
        );
        unreachable!();
    }
    if !environment.function_list.is_empty() {
        log::error!(
            "Already defined {} functions",
            environment.function_list.len()
        );
        unreachable!();
    }

    // define functions
    let func_num = environment.function_list_name.len();
    for i in 0..func_num {
        let fname = &environment.function_list_name[i];
        let fsig = environment.function_list_signature[i];

        // check if fname is already defined
        let already_defined = environment.module.get_function(fname);
        let fn_value = match already_defined {
            Some(v) => v,
            None => {
                let f = environment.module.add_function(
                    fname,
                    environment.function_signature_list[fsig as usize],
                    None,
                );
                // add attribute
                // create noredzone attribute
                let attr_noredzone = environment
                    .context
                    .create_enum_attribute(Attribute::get_named_enum_kind_id("noredzone"), 0);

                f.add_attribute(inkwell::attributes::AttributeLoc::Function, attr_noredzone);
                f
            }
        };
        environment.function_list.push(fn_value);
    }

    Ok(())
}

// Setup wasker_main and wasker_init
// Create these block then call memory_base()
fn setup(environment: &mut Environment<'_, '_>) -> Result<()> {
    // Define wasker_main function
    let wasker_main_fn_type = environment.inkwell_types.void_type.fn_type(&[], false);
    let wasker_main_fn = environment
        .module
        .add_function("wasker_main", wasker_main_fn_type, None);

    // Define init, enrty, return block
    let wasker_init_block = environment
        .context
        .append_basic_block(wasker_main_fn, "init");
    environment.wasker_init_block = Some(wasker_init_block);

    let wasker_main_block = environment
        .context
        .append_basic_block(wasker_main_fn, "entry");
    environment.wasker_main_block = Some(wasker_main_block);

    // Move position to wasker_init
    environment.builder.position_at_end(wasker_init_block);

    // Define memory_base
    let memory_base_fn_type = environment.inkwell_types.i8_ptr_type.fn_type(&[], false);
    let memory_base_fn = environment
        .module
        .add_function("memory_base", memory_base_fn_type, None);
    let fn_type_memory_grow = environment
        .inkwell_types
        .i32_type
        .fn_type(&[environment.inkwell_types.i32_type.into()], false);
    let fn_memory_grow = environment
        .module
        .add_function("memory_grow", fn_type_memory_grow, None);
    environment.fn_memory_grow = Some(fn_memory_grow);

    // Define Linear memory base as Global
    let linear_memory_offset_global = environment.module.add_global(
        environment.inkwell_types.i8_ptr_type,
        Some(AddressSpace::default()),
        "linm_global",
    );
    linear_memory_offset_global
        .set_initializer(&environment.inkwell_types.i8_ptr_type.const_zero());

    // Call memory_base
    let linear_memory_offset = environment
        .builder
        .build_call(memory_base_fn, &[], "linear_memory_offset")
        .try_as_basic_value()
        .left()
        .expect("error build_call memory_base");
    environment.builder.build_store::<PointerValue>(
        linear_memory_offset_global.as_pointer_value(),
        linear_memory_offset.into_pointer_value(),
    );
    environment.linear_memory_offset_global = Some(linear_memory_offset_global);

    let linear_memory_offset_int = environment.builder.build_ptr_to_int(
        linear_memory_offset.into_pointer_value(),
        environment.inkwell_types.i64_type,
        "linm_int",
    );
    environment.linear_memory_offset_int = Some(linear_memory_offset_int);

    Ok(())
}

// Complete wasker_main and wasker_init
// Return void
fn complete(environment: &mut Environment<'_, '_>) -> Result<()> {
    // init
    environment.builder.position_at_end(
        environment
            .wasker_init_block
            .expect("should define wasker_init_block"),
    );
    environment.builder.build_unconditional_branch(
        environment
            .wasker_main_block
            .expect("should define wasker_main_block"),
    );

    // main
    environment.builder.position_at_end(
        environment
            .wasker_main_block
            .expect("should define wasker_main_block"),
    );
    match environment.start_function_idx {
        Some(idx) => {
            environment
                .builder
                .build_call(environment.function_list[idx as usize], &[], "");
        }
        None => {
            log::warn!("_start is not defined");
        }
    }
    environment.builder.build_return(None);
    Ok(())
}

fn parse_type_section(
    types: TypeSectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    for entry in types {
        log::trace!("Type Section: {entry:?}");
        if let anyhow::Result::Ok(wasmparser::Type::Func(functype)) = entry {
            let params = functype.params();
            let returns = functype.results();

            // Convert wasmparser type to inkwell type
            let mut params_inkwell: Vec<BasicMetadataTypeEnum> = Vec::new();
            for param in params.iter() {
                let param_inkwell = wasmparser_to_inkwell(param, &environment.inkwell_types);
                params_inkwell.push(param_inkwell?.into());
            }

            let fn_signature: FunctionType = match returns.len() {
                0 => {
                    let return_inkwell = environment.inkwell_types.void_type;
                    return_inkwell.fn_type(&params_inkwell, false)
                }
                1 => {
                    let return_inkwell =
                        wasmparser_to_inkwell(&returns[0], &environment.inkwell_types);
                    return_inkwell?.fn_type(&params_inkwell, false)
                }
                // Multiple return value is not supported yet
                _other => {
                    bail!("TypeSection: Unimplemented multiple return value");
                }
            };
            environment.function_signature_list.push(fn_signature);
        } else {
            bail!("TypeSection: Type::ArrayType unimplemented");
        }
    }
    Ok(())
}

fn parse_import_section(
    imports: ImportSectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    environment.import_section_size = imports.count();
    for import in imports {
        let import = import?;
        match import.ty {
            TypeRef::Func(ty) => {
                environment.function_list_signature.push(ty);
                environment.function_list_name.push(import.name.to_string());
            }
            _other => {}
        }
    }
    log::trace!("- declare {} functions", environment.import_section_size);
    Ok(())
}

fn parse_function_section(
    functions: FunctionSectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    // Hold function signature
    // These functions will be registerd in ExportSection
    for function in functions {
        let ty = function?;
        let fname = format!("func_{}", environment.function_list_name.len());
        environment.function_list_signature.push(ty);
        environment.function_list_name.push(fname);
    }
    environment.function_section_size = environment.function_list_signature.len() as u32;
    log::trace!("- declare {} functions", environment.function_section_size);
    Ok(())
}

fn parse_memory_section(
    memories: MemorySectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    // Declare memory size as a global value
    let mut size: u32 = 0;
    for (i, memory) in memories.into_iter().enumerate() {
        let memory = memory?;
        size += memory.initial as u32;
        log::trace!("- memory[{i}] = {memory:?}");
    }
    let global = environment.module.add_global(
        environment.inkwell_types.i32_type,
        Some(AddressSpace::default()),
        "global_mem_size",
    );
    global.set_initializer(
        &environment
            .inkwell_types
            .i32_type
            .const_int(size as u64, false),
    );
    environment.global_memory_size = Some(global);

    // malloc memory from OS
    environment.builder.build_call(
        environment
            .fn_memory_grow
            .expect("should define memory_grow"),
        &[environment
            .inkwell_types
            .i32_type
            .const_int(size as u64, false)
            .into()],
        "linear_memory_offset",
    );
    Ok(())
}

fn parse_table_section(tables: TableSectionReader) -> Result<()> {
    for (i, table) in tables.into_iter().enumerate() {
        let table = table?;
        log::trace!("- table[{}] size={:?}", i, table.ty.initial);
    }
    Ok(())
}

fn parse_global_section(
    globals: GlobalSectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    // Hold function signature
    // These functions will be registerd in ExportSection
    for (i, global) in globals.into_iter().enumerate() {
        let global = global?;
        let gname = format!("global_{i}");
        let ty = wasmparser_to_inkwell(&global.ty.content_type, &environment.inkwell_types)?;

        // Get initial value
        let init_expr_binary_reader = &mut global.init_expr.get_binary_reader();
        let init_val: BasicValueEnum = match init_expr_binary_reader
            .read_operator()
            .expect("fail read_operator")
        {
            Operator::I32Const { value } => ty
                .into_int_type()
                .const_int(value as u64, false)
                .as_basic_value_enum(),
            Operator::I64Const { value } => ty
                .into_int_type()
                .const_int(value as u64, false)
                .as_basic_value_enum(),
            Operator::F32Const { value } => ty
                .into_float_type()
                .const_float(f32::from_bits(value.bits()).into())
                .as_basic_value_enum(),
            Operator::F64Const { value } => ty
                .into_float_type()
                .const_float(f64::from_bits(value.bits()))
                .as_basic_value_enum(),
            _other => {
                bail!("Unsupposed Global const value");
            }
        };

        // declare
        if global.ty.mutable {
            // Declare GlobalValue
            let global_value =
                environment
                    .module
                    .add_global(ty, Some(AddressSpace::default()), &gname);
            match init_val.get_type() {
                BasicTypeEnum::IntType(..) => {
                    global_value.set_initializer(&init_val.into_int_value());
                }
                BasicTypeEnum::FloatType(..) => {
                    global_value.set_initializer(&init_val.into_float_value());
                }
                _other => {
                    bail!("Unsupposed Global mutable value");
                }
            }
            environment.global.push(Global::Mut {
                ptr_to_value: global_value,
                ty,
            });
            global_value.set_initializer(&init_val);
        } else {
            // declare as BasicValueEnum
            environment.global.push(Global::Const { value: init_val });
        }
    }
    log::trace!("- declare {} globals", environment.function_section_size);
    Ok(())
}

fn parse_export_section(
    exports: ExportSectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    //let mut register_done_idx = environment.import_section_size;
    for export in exports {
        log::trace!("ExportSection {export:?}");
        let export = export?;
        match export.kind {
            wasmparser::ExternalKind::Func => {
                log::trace!("Export func[{}] = {}", export.name, export.index);
                environment.function_list_name[export.index as usize] = export.name.to_string();
                if export.name == "_start" {
                    environment.function_list_name[export.index as usize] =
                        "wasker_start".to_string();
                    environment.start_function_idx = Some(export.index);
                }
            }
            _other => {
                log::trace!("ExportSection: not support other than Memory");
            }
        }
    }
    Ok(())
}

fn parse_element_section(
    elements: ElementSectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    for element in elements {
        let element = element?;
        match element.kind {
            ElementKind::Active {
                table_index,
                offset_expr,
            } => {
                log::trace!("table[{table_index}]");
                // TODO: support multiple tables
                assert_eq!(table_index, 0);

                let offset_op = offset_expr
                    .get_binary_reader()
                    .read_operator()
                    .expect("failed to get data section offset");
                let offset = match offset_op {
                    Operator::I32Const { value } => value,
                    _other => unreachable!("unsupported offset type"),
                };
                match element.items {
                    ElementItems::Functions(elems) => {
                        // Declare function pointer array as global
                        let count = elems.count();
                        let array_fpointer = environment
                            .inkwell_types
                            .i8_ptr_type
                            .array_type(count + offset as u32);
                        let global_table = environment.module.add_global(
                            array_fpointer,
                            Some(AddressSpace::default()),
                            "global_table",
                        );
                        environment.global_table = Some(global_table);

                        // Initialize function pointer array
                        let mut fpointers: Vec<PointerValue> = Vec::new();
                        for _ in 0..offset {
                            fpointers.push(environment.inkwell_types.i8_ptr_type.const_null());
                        }
                        for (i, elem) in elems.into_iter().enumerate() {
                            let elem = elem?;
                            let func = environment.function_list[elem as usize];
                            fpointers.push(func.as_global_value().as_pointer_value());
                            log::trace!("- elem[{}] = Function[{}]", i + offset as usize, elem);
                        }
                        let initializer = environment
                            .inkwell_types
                            .i8_ptr_type
                            .const_array(&fpointers);
                        global_table.set_initializer(&initializer);
                    }
                    ElementItems::Expressions { .. } => {
                        bail!("ElementSection: Expressions item Unsupported");
                    }
                }
            }
            ElementKind::Declared => {
                bail!("ElementSection: Declared kind Unsupported");
            }
            ElementKind::Passive => {
                bail!("ElementSection: Passive kind Unsupported");
            }
        }
    }
    Ok(())
}

fn parse_data_section(
    datas: DataSectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    // Move position to init block
    environment.builder.position_at_end(
        environment
            .wasker_init_block
            .expect("should define wasker_init_block"),
    );

    for data in datas {
        let data = data?;
        log::trace!(
            "DataSection　DDDataKind:{:?},  range:{}-{}",
            data.kind,
            data.range.start,
            data.range.end
        );
        match data.kind {
            DataKind::Passive => {
                log::error!("DataKind::Passive is not supported")
            }
            DataKind::Active {
                memory_index: _,
                offset_expr,
            } => {
                // Make array from data
                let size = data.data.len();
                log::trace!("- data size = {size}");
                let array_ty = environment.inkwell_types.i8_type.array_type(size as u32);
                let global_mem_initializer = environment.module.add_global(
                    array_ty,
                    Some(AddressSpace::default()),
                    "global_mem_initializer",
                );

                // Initialize array
                let mut data_intvalue = Vec::new();
                for d in data.data {
                    let d_intvalue = environment
                        .inkwell_types
                        .i8_type
                        .const_int(*d as u64, false);
                    data_intvalue.push(d_intvalue);
                }
                log::trace!("- data_intvalue.len = {}", data_intvalue.len());
                let initializer = environment
                    .inkwell_types
                    .i8_type
                    .const_array(&data_intvalue);
                global_mem_initializer.set_initializer(&initializer);

                // Get offset from the base of the Linear Memory
                let offset_op = offset_expr
                    .get_binary_reader()
                    .read_operator()
                    .expect("failed to get data section offset");
                let offset = match offset_op {
                    Operator::I32Const { value } => value,
                    _other => unreachable!("unsupported offset type"),
                };
                log::trace!("- offset = 0x{offset:x}");
                let offset_int = environment
                    .inkwell_types
                    .i64_type
                    .const_int(offset as u64, false);
                let dest_int = environment.builder.build_int_add(
                    environment
                        .linear_memory_offset_int
                        .expect("should define linear_memory_offset_int"),
                    offset_int,
                    "dest_int",
                );
                let dest_ptr = environment.builder.build_int_to_ptr(
                    dest_int,
                    environment.inkwell_types.i64_ptr_type,
                    "dest_ptr",
                );

                // Memcpy from data to Linear Memory
                environment
                    .builder
                    .build_memcpy(
                        dest_ptr,
                        1,
                        global_mem_initializer.as_pointer_value(),
                        1,
                        environment
                            .inkwell_types
                            .i64_type
                            .const_int(data.data.len() as u64, false),
                    )
                    .map_err(|e| anyhow!(e))
                    .context("fail build_memcpy")?;
            }
        }
    }
    Ok(())
}

fn parse_custom_section(
    customs: CustomSectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    //println!("{}", pretty_hex(&customs.data()));
    if customs.name() != "name" {
        log::trace!("CustomSection other than `name` is not supported");
        return Ok(());
    }
    let name_section_reader = NameSectionReader::new(customs.data(), customs.data_offset());
    for name_reader in name_section_reader {
        match name_reader {
            std::result::Result::Ok(entry) => match entry {
                Name::Function(fnames) => {
                    for n in fnames {
                        let n = n.expect("Error get Naming");
                        // assert
                        if environment.function_list_name.len() <= n.index as usize {
                            log::error!("function_list_name length too short");
                            unreachable!();
                        }

                        // update fname
                        if n.name != "_start" && n.index >= environment.import_section_size {
                            let fname = format!("{}_{}", n.index, n.name);
                            environment.function_list_name[n.index as usize] = fname;
                        };
                    }
                }
                _ => {
                    log::trace!("CustomSection: unsupported Name");
                }
            },
            Err(_) => {
                log::error!("Error get NameSectionReader.next()");
            }
        }
    }
    Ok(())
}

fn parse_code_section(f: FunctionBody, environment: &mut Environment<'_, '_>) -> Result<()> {
    // Move to function
    environment.current_function_idx = if environment.current_function_idx == u32::MAX {
        // init
        environment.import_section_size
    } else {
        environment.current_function_idx + 1
    };
    log::trace!("### function idx = {}", environment.current_function_idx);

    // Create block
    let current_fn = environment.function_list[environment.current_function_idx as usize];
    let current_func_block = environment.context.append_basic_block(current_fn, "entry");
    let current_ret_block = environment.context.append_basic_block(current_fn, "ret");

    // Phi
    environment.builder.position_at_end(current_ret_block);
    let ret = current_fn.get_type().get_return_type();
    let mut end_phis: Vec<PhiValue> = Vec::new();
    if let Some(v) = ret {
        log::trace!("- return type {v:?}");
        let phi = environment.builder.build_phi(v, "return_phi");
        end_phis.push(phi);
    }

    // ControlFrame
    environment.builder.position_at_end(current_func_block);
    environment
        .control_frames
        .push(control::ControlFrame::Block {
            next: current_ret_block,
            end_phis,
            stack_size: environment.stack.len(),
        });

    // params
    let mut locals = vec![];
    for idx in 0..current_fn.count_params() {
        let v = current_fn
            .get_nth_param(idx)
            .expect("fail to get_nth_param");
        let ty = current_fn.get_type().get_param_types()[idx as usize];
        let alloca = environment.builder.build_alloca(ty, "param");
        environment.builder.build_store(alloca, v);
        locals.push((alloca, ty));
    }

    // locals
    let mut local_reader = f.get_locals_reader()?;
    let num_locals = local_reader.get_count();
    for _ in 0..num_locals {
        let (count, ty) = local_reader.read()?;
        let ty = wasmparser_to_inkwell(&ty, &environment.inkwell_types)?;
        for _ in 0..count {
            let alloca = environment.builder.build_alloca(ty, "local");
            environment.builder.build_store(alloca, ty.const_zero());
            locals.push((alloca, ty));
        }
    }

    // parse instructions
    let mut op_reader = f.get_operators_reader()?.get_binary_reader();
    let mut num_op = 0;
    while !op_reader.eof() {
        let op = match op_reader.read_operator() {
            anyhow::Result::Ok(v) => v,
            Err(e) => return Err(e.into()),
        };

        log::trace!("CodeSection: op[{num_op}] = {op:?}");
        num_op += 1;

        parse_instruction(environment, &op, &current_fn, &locals)?;
    }
    Ok(())
}
