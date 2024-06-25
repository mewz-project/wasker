//! `section` module parse each section of Wasm binary.

use anyhow::{anyhow, bail, Context, Ok, Result};
use inkwell::{
    attributes::Attribute,
    types::{BasicMetadataTypeEnum, BasicType, BasicTypeEnum, FunctionType},
    values::{
        BasicMetadataValueEnum, BasicValue, BasicValueEnum, FunctionValue, PhiValue, PointerValue,
    },
    AddressSpace,
};
use wasmparser::{
    Chunk, CustomSectionReader, DataKind, DataSectionReader, Element, ElementItems, ElementKind,
    ElementSectionReader, ExportSectionReader, FunctionBody, FunctionSectionReader,
    GlobalSectionReader, ImportSectionReader, MemorySectionReader, Name, NameSectionReader,
    Operator, Parser, Payload, SectionLimited, TableSectionReader, TypeRef, TypeSectionReader,
    ValType,
};

use crate::environment::{Environment, Global};
use crate::inkwell::InkwellTypes;
use crate::insts::control::UnreachableReason;
use crate::insts::{control, memory, numeric};

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
        //log::debug!("### {:?}", payload.as_ref().expect("fail get payload"));
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
                log::debug!("EndSection");
                break;
            }
            Payload::Version { num, encoding, .. } => {
                log::debug!("version:{}, encoding: {:?}", num, encoding);
            }
            Payload::CodeSectionStart { count, range, size } => {
                log::debug!(
                    "CodeSectionStart: count:{}, range:{:?}, size:{}",
                    count,
                    range,
                    size
                );
                parser.skip_section();
                data = &data[size as usize..];
            }
            _other => {
                log::warn!("Unimplemented Section. Run with `RUST_LOG=debug` environment variable for more info.");
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
        log::debug!("Type Section: {:?}", entry);
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
            _other => {
                unreachable!("ImportSection only support Func type");
            }
        }
    }
    log::debug!("- declare {} functions", environment.import_section_size);
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
    log::debug!("- declare {} functions", environment.function_section_size);
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
        log::debug!("- memory[{}] = {:?}", i, memory);
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
        log::debug!("- table[{}] size={:?}", i, table.ty.initial);
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
        let gname = format!("global_{}", i);
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
    log::debug!("- declare {} globals", environment.function_section_size);
    Ok(())
}

fn parse_export_section(
    exports: ExportSectionReader,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    //let mut register_done_idx = environment.import_section_size;
    for export in exports {
        log::debug!("ExportSection {:?}", export);
        let export = export?;
        match export.kind {
            wasmparser::ExternalKind::Func => {
                log::debug!("Export func[{}] = {}", export.name, export.index);
                environment.function_list_name[export.index as usize] = export.name.to_string();
                if export.name == "_start" {
                    environment.function_list_name[export.index as usize] =
                        "wasker_start".to_string();
                    environment.start_function_idx = Some(export.index);
                }
            }
            _other => {
                log::debug!("ExportSection: not support other than Memory");
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
                log::debug!("table[{}]", table_index);
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
                            log::debug!("- elem[{}] = Function[{}]", i + offset as usize, elem);
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
        log::debug!(
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
                log::debug!("- data size = {}", size);
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
                log::debug!("- data_intvalue.len = {}", data_intvalue.len());
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
                log::debug!("- offset = 0x{:x}", offset);
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
        log::debug!("CustomSection other than `name` is not supported");
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
                    log::debug!("CustomSection: unsupported Name");
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
    log::debug!("### function idx = {}", environment.current_function_idx);

    // Create block
    let current_fn = environment.function_list[environment.current_function_idx as usize];
    let current_func_block = environment.context.append_basic_block(current_fn, "entry");
    let current_ret_block = environment.context.append_basic_block(current_fn, "ret");

    // Phi
    environment.builder.position_at_end(current_ret_block);
    let ret = current_fn.get_type().get_return_type();
    let mut end_phis: Vec<PhiValue> = Vec::new();
    if let Some(v) = ret {
        log::debug!("- return type {:?}", v);
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

        log::debug!("CodeSection: op[{}] = {:?}", num_op, op);
        num_op += 1;

        parse_instruction(environment, &op, &current_fn, &locals)?;
    }
    Ok(())
}

fn parse_instruction<'a>(
    environment: &mut Environment<'a, '_>,
    op: &Operator,
    current_fn: &FunctionValue<'a>,
    locals: &[(PointerValue<'a>, BasicTypeEnum<'a>)],
) -> Result<()> {
    if environment.unreachable_depth != 0 {
        log::debug!("- under unreachable");

        match op {
            Operator::Block { blockty: _ }
            | Operator::Loop { blockty: _ }
            | Operator::If { blockty: _ } => {
                environment.unreachable_depth += 1;
                return Ok(());
            }
            Operator::Else => {
                if environment.unreachable_depth == 1 {
                    control::gen_else(environment).context("error gen Else")?;
                    environment.unreachable_depth -= 1;
                    environment.unreachable_reason = UnreachableReason::Reachable;
                    log::debug!("- end of unreachable");
                    return Ok(());
                } else {
                    return Ok(());
                }
            }
            Operator::End => match environment.unreachable_depth {
                0 => {
                    unreachable!("Unexpected depth 0");
                }
                1 => {
                    control::gen_end(environment, current_fn).context("error gen End")?;
                    environment.unreachable_depth -= 1;
                    environment.unreachable_reason = UnreachableReason::Reachable;
                    log::debug!("- end of unreachable");
                    return Ok(());
                }
                2_u32..=u32::MAX => {
                    environment.unreachable_depth -= 1;
                    return Ok(());
                }
            },
            _ => {
                return Ok(());
            }
        }
    }

    match &op {
        /******************************
          Control flow instructions
        ******************************/
        Operator::Block { blockty } => {
            control::gen_block(environment, blockty).context("error gen Block")?;
        }
        Operator::Loop { blockty } => {
            control::gen_loop(environment, blockty).context("error gen Loop")?;
        }
        Operator::If { blockty } => {
            control::gen_if(environment, blockty).context("error gen If")?;
        }
        Operator::Else {} => {
            control::gen_else(environment).context("error gen Else")?;
        }
        Operator::Br { relative_depth } => {
            control::gen_br(environment, *relative_depth).context("error gen Br")?;
        }
        Operator::BrIf { relative_depth } => {
            control::gen_brif(environment, *relative_depth).context("errpr gen BrIf")?;
        }
        Operator::BrTable { targets } => {
            control::gen_br_table(environment, targets).context("error gen BrTable")?;
        }
        Operator::End => {
            log::debug!(
                "- gen_end, fn = {:?}, ret = {:?}",
                current_fn.get_name(),
                current_fn.get_type().get_return_type()
            );
            control::gen_end(environment, current_fn).context("error gen End")?;
        }
        Operator::Call { function_index } => {
            control::gen_call(environment, *function_index).context("error gen Call")?;
        }
        Operator::CallIndirect {
            type_index,
            table_index,
            table_byte,
        } => {
            control::gen_call_indirect(environment, *type_index, *table_index, *table_byte)
                .context("error gen CallIndirect")?;
        }
        Operator::Drop => {
            control::gen_drop(environment).context("error gen Drop")?;
        }
        Operator::Return => {
            control::gen_return(environment, current_fn).context("error gen Return")?;
        }
        Operator::Select => {
            control::gen_select(environment).context("error gen Select")?;
        }
        Operator::Nop => {
            // No Operation
        }
        Operator::Unreachable => {
            control::gen_unreachable(environment).context("error gen Unreachable")?;
        }
        /******************************
          Numeric instructions
        ******************************/
        Operator::I32Const { value } => {
            let i = environment
                .inkwell_types
                .i32_type
                .const_int(*value as u64, false);
            environment.stack.push(i.as_basic_value_enum());
        }
        Operator::I64Const { value } => {
            let i = environment
                .inkwell_types
                .i64_type
                .const_int(*value as u64, false);
            environment.stack.push(i.as_basic_value_enum());
        }
        Operator::F32Const { value } => {
            let bits = environment
                .inkwell_types
                .i32_type
                .const_int(value.bits() as u64, false);
            let i = environment
                .builder
                .build_bitcast(bits, environment.inkwell_types.f32_type, "");
            environment.stack.push(i.as_basic_value_enum());
        }
        Operator::F64Const { value } => {
            let bits = environment
                .inkwell_types
                .i64_type
                .const_int(value.bits(), false);
            let i = environment
                .builder
                .build_bitcast(bits, environment.inkwell_types.f64_type, "");
            environment.stack.push(i.as_basic_value_enum());
        }
        Operator::I32Clz => {
            let v1 = environment.stack.pop().expect("stack empty");
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.ctlz_i32,
                &[
                    v1.into(),
                    environment.inkwell_types.i1_type.const_zero().into(),
                ],
            )
            .context("error gen I32Clz")?;
        }
        Operator::I64Clz => {
            let v1 = environment.stack.pop().expect("stack empty");
            let function = environment.inkwell_insts.ctlz_i64;
            let clz = environment
                .builder
                .build_call(
                    function,
                    &[
                        v1.into(),
                        environment.inkwell_types.i1_type.const_zero().into(),
                    ],
                    "",
                )
                .try_as_basic_value()
                .left()
                .expect("fail build_call llvm_insts");
            let res = environment.builder.build_int_sub(
                environment.inkwell_types.i64_type.const_int(63, false),
                clz.into_int_value(),
                "",
            );
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::I32Ctz => {
            let v1 = environment.stack.pop().expect("stack empty");
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.cttz_i32,
                &[
                    v1.into(),
                    environment.inkwell_types.i1_type.const_zero().into(),
                ],
            )
            .context("error gen I32Ctz")?;
        }
        Operator::I64Ctz => {
            let v1 = environment.stack.pop().expect("stack empty");
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.cttz_i64,
                &[
                    v1.into(),
                    environment.inkwell_types.i1_type.const_zero().into(),
                ],
            )
            .context("error gen I64Ctz")?;
        }
        Operator::I32Popcnt => {
            let v1 = environment.stack.pop().expect("stack empty");
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.ctpop_i32,
                &[v1.into()],
            )
            .context("I32Popcnt")?;
        }
        Operator::I64Popcnt => {
            let v1 = environment.stack.pop().expect("stack empty");
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.ctpop_i64,
                &[v1.into()],
            )
            .context("I64Popcnt")?;
        }
        Operator::I32Add | Operator::I64Add => {
            let (v1, v2) = environment.pop2();
            let res =
                environment
                    .builder
                    .build_int_add(v1.into_int_value(), v2.into_int_value(), "");
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::I32Sub | Operator::I64Sub => {
            let (v1, v2) = environment.pop2();
            let res =
                environment
                    .builder
                    .build_int_sub(v1.into_int_value(), v2.into_int_value(), "");
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::I32Mul | Operator::I64Mul => {
            let (v1, v2) = environment.pop2();
            let res =
                environment
                    .builder
                    .build_int_mul(v1.into_int_value(), v2.into_int_value(), "");
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::I32DivS | Operator::I64DivS => {
            let (v1, v2) = environment.pop2();
            let res = environment.builder.build_int_signed_div(
                v1.into_int_value(),
                v2.into_int_value(),
                "",
            );
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::I32DivU | Operator::I64DivU => {
            let (v1, v2) = environment.pop2();
            let res = environment.builder.build_int_unsigned_div(
                v1.into_int_value(),
                v2.into_int_value(),
                "",
            );
            environment.stack.push(res.as_basic_value_enum());
        }
        /* % operator */
        Operator::I32RemS | Operator::I64RemS => {
            let (v1, v2) = environment.pop2();
            let res = environment.builder.build_int_signed_rem(
                v1.into_int_value(),
                v2.into_int_value(),
                "",
            );
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::I32RemU | Operator::I64RemU => {
            let (v1, v2) = environment.pop2();
            let res = environment.builder.build_int_unsigned_rem(
                v1.into_int_value(),
                v2.into_int_value(),
                "",
            );
            environment.stack.push(res.as_basic_value_enum());
        }
        /******************************
            bitwise instructions
        ******************************/
        Operator::I32And | Operator::I64And => {
            numeric::gen_and(environment).context("error gen And")?;
        }
        Operator::I32Or | Operator::I64Or => {
            numeric::gen_or(environment).context("error gen Or")?;
        }
        Operator::I32Xor | Operator::I64Xor => {
            numeric::gen_xor(environment).context("error gen Xor")?;
        }
        Operator::I32Shl | Operator::I64Shl => {
            numeric::gen_shl(environment).context("error gen Shl")?;
        }
        Operator::I32ShrS | Operator::I64ShrS => {
            numeric::gen_shr(environment, true).context("error gen ShrS")?;
        }
        Operator::I32ShrU | Operator::I64ShrU => {
            numeric::gen_shr(environment, false).context("error gen ShrU")?;
        }
        Operator::I32Rotl => {
            numeric::gen_rotl(environment, true).context("error gen I32Rotl")?;
        }
        Operator::I64Rotl => {
            numeric::gen_rotl(environment, false).context("error gen I64Rotl")?;
        }
        Operator::I32Rotr => {
            numeric::gen_rotr(environment, true).context("error gen I32Rotr")?;
        }
        Operator::I64Rotr => {
            numeric::gen_rotr(environment, false).context("error gen I64Rotr")?;
        }
        /******************************
          Conversion instructions
        ******************************/
        Operator::I32WrapI64 => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let wraped =
                environment
                    .builder
                    .build_int_truncate(v, environment.inkwell_types.i32_type, "");
            environment.stack.push(wraped.as_basic_value_enum());
        }
        Operator::I64Extend32S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let narrow_value =
                environment
                    .builder
                    .build_int_truncate(v, environment.inkwell_types.i32_type, "");
            let extended = environment.builder.build_int_s_extend(
                narrow_value,
                environment.inkwell_types.i64_type,
                "i64extend32s",
            );
            environment.stack.push(extended.as_basic_value_enum());
        }
        Operator::I64Extend16S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let narrow_value =
                environment
                    .builder
                    .build_int_truncate(v, environment.inkwell_types.i16_type, "");
            let extended = environment.builder.build_int_s_extend(
                narrow_value,
                environment.inkwell_types.i64_type,
                "i64extend16s",
            );
            environment.stack.push(extended.as_basic_value_enum());
        }
        Operator::I64Extend8S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let narrow_value =
                environment
                    .builder
                    .build_int_truncate(v, environment.inkwell_types.i8_type, "");
            let extended = environment.builder.build_int_s_extend(
                narrow_value,
                environment.inkwell_types.i64_type,
                "i64extend8s",
            );
            environment.stack.push(extended.as_basic_value_enum());
        }
        Operator::I32Extend16S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let narrow_value =
                environment
                    .builder
                    .build_int_truncate(v, environment.inkwell_types.i16_type, "");
            let extended = environment.builder.build_int_s_extend(
                narrow_value,
                environment.inkwell_types.i32_type,
                "i32extend16s",
            );
            environment.stack.push(extended.as_basic_value_enum());
        }
        Operator::I32Extend8S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let narrow_value =
                environment
                    .builder
                    .build_int_truncate(v, environment.inkwell_types.i8_type, "");
            let extended = environment.builder.build_int_s_extend(
                narrow_value,
                environment.inkwell_types.i32_type,
                "i32extend8s",
            );
            environment.stack.push(extended.as_basic_value_enum());
        }
        Operator::I64ExtendI32U => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let extended = environment.builder.build_int_z_extend(
                v,
                environment.inkwell_types.i64_type,
                "i64extendi32u",
            );
            environment.stack.push(extended.as_basic_value_enum());
        }
        Operator::I64ExtendI32S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let extended = environment.builder.build_int_s_extend(
                v,
                environment.inkwell_types.i64_type,
                "i64extendi32s",
            );
            environment.stack.push(extended.as_basic_value_enum());
        }
        Operator::F32DemoteF64 => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            let demoted = environment.builder.build_float_trunc(
                v,
                environment.inkwell_types.f32_type,
                "f32demotef64",
            );
            environment.stack.push(demoted.as_basic_value_enum());
        }
        Operator::F64PromoteF32 => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            let promoted = environment.builder.build_float_ext(
                v,
                environment.inkwell_types.f64_type,
                "f64promotef32",
            );
            environment.stack.push(promoted.as_basic_value_enum());
        }
        Operator::F64ConvertI64S | Operator::F64ConvertI32S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let converted = environment.builder.build_signed_int_to_float(
                v,
                environment.inkwell_types.f64_type,
                "f64converti64s",
            );
            environment.stack.push(converted.as_basic_value_enum());
        }
        Operator::F64ConvertI64U | Operator::F64ConvertI32U => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let converted = environment.builder.build_unsigned_int_to_float(
                v,
                environment.inkwell_types.f64_type,
                "f64converti64u",
            );
            environment.stack.push(converted.as_basic_value_enum());
        }
        Operator::F32ConvertI32S | Operator::F32ConvertI64S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let converted = environment.builder.build_signed_int_to_float(
                v,
                environment.inkwell_types.f32_type,
                "f32converti32s",
            );
            environment.stack.push(converted.as_basic_value_enum());
        }
        Operator::F32ConvertI32U | Operator::F32ConvertI64U => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let converted = environment.builder.build_unsigned_int_to_float(
                v,
                environment.inkwell_types.f32_type,
                "f32converti32u",
            );
            environment.stack.push(converted.as_basic_value_enum());
        }
        Operator::I64TruncF64S | Operator::I64TruncF32S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            let converted = environment.builder.build_float_to_signed_int(
                v,
                environment.inkwell_types.i64_type,
                "i64truncf64s",
            );
            environment.stack.push(converted.as_basic_value_enum());
        }
        Operator::I32TruncF32S | Operator::I32TruncF64S => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            let converted = environment.builder.build_float_to_signed_int(
                v,
                environment.inkwell_types.i32_type,
                "i32truncf32s",
            );
            environment.stack.push(converted.as_basic_value_enum());
        }
        Operator::I64TruncF64U | Operator::I64TruncF32U => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            let converted = environment.builder.build_float_to_unsigned_int(
                v,
                environment.inkwell_types.i64_type,
                "i64truncf64u",
            );
            environment.stack.push(converted.as_basic_value_enum());
        }
        Operator::I32TruncF32U | Operator::I32TruncF64U => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            let converted = environment.builder.build_float_to_unsigned_int(
                v,
                environment.inkwell_types.i32_type,
                "i32truncf32u",
            );
            environment.stack.push(converted.as_basic_value_enum());
        }
        Operator::F64ReinterpretI64 => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let reinterpreted =
                environment
                    .builder
                    .build_bitcast(v, environment.inkwell_types.f64_type, "");
            environment.stack.push(reinterpreted);
        }
        Operator::F32ReinterpretI32 => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_int_value();
            let reinterpreted =
                environment
                    .builder
                    .build_bitcast(v, environment.inkwell_types.f32_type, "");
            environment.stack.push(reinterpreted);
        }
        Operator::I64ReinterpretF64 => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            let reinterpreted =
                environment
                    .builder
                    .build_bitcast(v, environment.inkwell_types.i64_type, "");
            environment.stack.push(reinterpreted);
        }
        Operator::I32ReinterpretF32 => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            let reinterpreted =
                environment
                    .builder
                    .build_bitcast(v, environment.inkwell_types.i32_type, "");
            environment.stack.push(reinterpreted);
        }
        /******************************
            Floating
        ******************************/
        Operator::F32Eq | Operator::F64Eq => {
            numeric::helper_code_gen_comparison_float(inkwell::FloatPredicate::OEQ, environment)
                .expect("error gen compare float");
        }
        Operator::F32Ne | Operator::F64Ne => {
            numeric::helper_code_gen_comparison_float(inkwell::FloatPredicate::UNE, environment)
                .expect("error gen compare float");
        }
        Operator::F64Lt | Operator::F32Lt => {
            numeric::helper_code_gen_comparison_float(inkwell::FloatPredicate::OLT, environment)
                .expect("error gen compare float");
        }
        Operator::F64Gt | Operator::F32Gt => {
            numeric::helper_code_gen_comparison_float(inkwell::FloatPredicate::OGT, environment)
                .expect("error gen compare float");
        }
        Operator::F64Le | Operator::F32Le => {
            numeric::helper_code_gen_comparison_float(inkwell::FloatPredicate::OLE, environment)
                .expect("error gen compare float");
        }
        Operator::F64Ge | Operator::F32Ge => {
            numeric::helper_code_gen_comparison_float(inkwell::FloatPredicate::OGE, environment)
                .expect("error gen compare float");
        }
        Operator::F64Abs => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.fabs_f64,
                &[v.into()],
            )
            .context("error gen F64Abs")?;
        }
        Operator::F32Abs => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.fabs_f32,
                &[v.into()],
            )
            .context("error gen F32Abs")?;
        }
        Operator::F64Neg => {
            let v1 = environment.stack.pop().expect("stack empty");
            let res = environment
                .builder
                .build_float_neg(v1.into_float_value(), "f64neg");
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::F32Neg => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            let res = environment.builder.build_float_neg(v, "f32neg");
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::F64Ceil => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.ceil_f64,
                &[v.into()],
            )
            .context("error gen F64Ceil")?;
        }
        Operator::F32Ceil => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.ceil_f32,
                &[v.into()],
            )
            .context("error gen F32Ceil")?;
        }
        Operator::F64Floor => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.floor_f64,
                &[v.into()],
            )
            .context("error gen F64Floor")?;
        }
        Operator::F32Floor => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.floor_f32,
                &[v.into()],
            )
            .context("error gen F32Floor")?;
        }
        Operator::F64Trunc => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.trunc_f64,
                &[v.into()],
            )
            .context("error gen F64Trunc")?;
        }
        Operator::F32Trunc => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.trunc_f32,
                &[v.into()],
            )
            .context("error gen F32Trunc")?;
        }
        Operator::F64Nearest => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.nearbyint_f64,
                &[v.into()],
            )
            .context("error gen F64Nearest")?;
        }
        Operator::F32Nearest => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.nearbyint_f32,
                &[v.into()],
            )
            .context("error gen F32Nearest")?;
        }
        Operator::F64Sqrt => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.sqrt_f64,
                &[v.into()],
            )
            .context("error gen F64Sqrt")?;
        }
        Operator::F32Sqrt => {
            let v = environment
                .stack
                .pop()
                .expect("stack empty")
                .into_float_value();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.sqrt_f32,
                &[v.into()],
            )
            .context("error gen F64Sqrt")?;
        }
        Operator::F64Add | Operator::F32Add => {
            let (v1, v2) = environment.pop2();
            let res = environment.builder.build_float_add(
                v1.into_float_value(),
                v2.into_float_value(),
                "",
            );
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::F64Sub | Operator::F32Sub => {
            let (v1, v2) = environment.pop2();
            let res = environment.builder.build_float_sub(
                v1.into_float_value(),
                v2.into_float_value(),
                "",
            );
            environment.stack.push(res.as_basic_value_enum());
        }
        Operator::F64Mul | Operator::F32Mul => {
            let (v1, v2) = environment.pop2();
            let res = environment.builder.build_float_mul(
                v1.into_float_value(),
                v2.into_float_value(),
                "",
            );
            environment.stack.push(res.as_basic_value_enum());
        }

        Operator::F64Div | Operator::F32Div => {
            let (v1, v2) = environment.pop2();
            let res = environment.builder.build_float_div(
                v1.into_float_value(),
                v2.into_float_value(),
                "",
            );
            environment.stack.push(res.as_basic_value_enum());
        }

        Operator::F64Min => {
            let (v1, v2) = environment.pop2();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.minnum_f64,
                &[v1.into(), v2.into()],
            )
            .context("error gen F64Min")?;
        }
        Operator::F32Min => {
            let (v1, v2) = environment.pop2();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.minnum_f32,
                &[v1.into(), v2.into()],
            )
            .context("error gen F32Min")?;
        }
        Operator::F64Max => {
            let (v1, v2) = environment.pop2();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.maxnum_f64,
                &[v1.into(), v2.into()],
            )
            .context("error gen F64Max")?;
        }
        Operator::F32Max => {
            let (v1, v2) = environment.pop2();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.maxnum_f32,
                &[v1.into(), v2.into()],
            )
            .context("error gen F32Max")?;
        }
        Operator::F32Copysign => {
            let (v1, v2) = environment.pop2();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.copysign_f32,
                &[v1.into(), v2.into()],
            )
            .context("error gen copysign.f32")?;
        }
        Operator::F64Copysign => {
            let (v1, v2) = environment.pop2();
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.copysign_f64,
                &[v1.into(), v2.into()],
            )
            .context("error gen copysign.f64")?;
        }
        /******************************
          Variables
        ******************************/
        // Loads the value of local variable to stack
        Operator::LocalGet { local_index } => {
            assert!(*local_index < locals.len() as u32);
            let v = environment.builder.build_load(
                locals[*local_index as usize].1,
                locals[*local_index as usize].0,
                "",
            );
            environment.stack.push(v);
        }
        // Sets the value of the local variable
        Operator::LocalSet { local_index } => {
            assert!(*local_index < locals.len() as u32);
            let local_value_pointer = locals[*local_index as usize].0;
            let v = environment.stack.pop().expect("stack empty");
            environment.builder.build_store(local_value_pointer, v);
        }
        Operator::LocalTee { local_index } => {
            assert!(*local_index < locals.len() as u32);
            let ptr_local_value = locals[*local_index as usize].0;
            let v = environment.stack.pop().expect("stack empty");
            environment.builder.build_store(ptr_local_value, v);
            environment.stack.push(v);
        }
        Operator::GlobalGet { global_index } => {
            assert!(*global_index < environment.global.len() as u32);
            let global = &environment.global[*global_index as usize];
            match global {
                Global::Const { value } => {
                    environment.stack.push(*value);
                }
                Global::Mut { ptr_to_value, ty } => {
                    let value =
                        environment
                            .builder
                            .build_load(*ty, ptr_to_value.as_pointer_value(), "");
                    environment.stack.push(value);
                }
            };
        }
        Operator::GlobalSet { global_index } => {
            assert!(*global_index < environment.global.len() as u32);
            let global = &environment.global[*global_index as usize];
            match global {
                Global::Const { value: _ } => {
                    bail!("Global.Set to const value");
                }
                Global::Mut {
                    ptr_to_value,
                    ty: _,
                } => {
                    let value = environment.stack.pop().expect("stack empty");
                    environment
                        .builder
                        .build_store(ptr_to_value.as_pointer_value(), value);
                }
            };
        }
        /******************************
          Memory instructions
        ******************************/
        Operator::MemorySize {
            mem: _,
            mem_byte: _,
        } => {
            memory::memory_size(environment).context("error gen MemorySize")?;
        }
        Operator::MemoryGrow {
            mem: _,
            mem_byte: _,
        } => {
            memory::memory_grow(environment).context("error gen MemoryGrow")?;
        }
        Operator::MemoryCopy { dst_mem, src_mem } => {
            memory::memory_copy(environment, *dst_mem, *src_mem).context("error gen MemoryCopy")?;
        }
        Operator::MemoryFill { mem } => {
            memory::memory_fill(environment, *mem).context("error gen MemoryFill")?;
        }
        // TODO: memarg
        Operator::I32Load { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                false,
                false,
                environment,
            )
            .context("error gen I32Load")?;
        }
        Operator::I64Load { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i64_type.as_basic_type_enum(),
                environment.inkwell_types.i64_type.as_basic_type_enum(),
                false,
                false,
                environment,
            )
            .context("error gen I64Load")?;
        }
        Operator::F32Load { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.f32_type.as_basic_type_enum(),
                environment.inkwell_types.f32_type.as_basic_type_enum(),
                false,
                false,
                environment,
            )
            .context("error gen F32Load")?;
        }
        Operator::F64Load { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.f64_type.as_basic_type_enum(),
                environment.inkwell_types.f64_type.as_basic_type_enum(),
                false,
                false,
                environment,
            )
            .context("error gen F64Load")?;
        }
        Operator::I32Load8S { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                environment.inkwell_types.i8_type.as_basic_type_enum(),
                true,
                true,
                environment,
            )
            .context("error gen I32Load8S")?;
        }
        Operator::I32Load8U { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                environment.inkwell_types.i8_type.as_basic_type_enum(),
                false,
                true,
                environment,
            )
            .context("error gen I32Load8U")?;
        }
        Operator::I32Load16S { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                environment.inkwell_types.i16_type.as_basic_type_enum(),
                true,
                true,
                environment,
            )
            .context("error gen I32Load16S")?;
        }
        Operator::I32Load16U { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                environment.inkwell_types.i16_type.as_basic_type_enum(),
                false,
                true,
                environment,
            )
            .context("error gen I32Load16S")?;
        }
        Operator::I64Load8S { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i64_type.as_basic_type_enum(),
                environment.inkwell_types.i8_type.as_basic_type_enum(),
                true,
                true,
                environment,
            )
            .context("error gen I64Load8S")?;
        }
        Operator::I64Load8U { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i64_type.as_basic_type_enum(),
                environment.inkwell_types.i8_type.as_basic_type_enum(),
                false,
                true,
                environment,
            )
            .context("error gen I64Load8U")?;
        }
        Operator::I64Load16S { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i64_type.as_basic_type_enum(),
                environment.inkwell_types.i16_type.as_basic_type_enum(),
                true,
                true,
                environment,
            )
            .context("error gen I64Load16S")?;
        }
        Operator::I64Load16U { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i64_type.as_basic_type_enum(),
                environment.inkwell_types.i16_type.as_basic_type_enum(),
                false,
                true,
                environment,
            )
            .context("error gen I64Load16U")?;
        }
        Operator::I64Load32S { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i64_type.as_basic_type_enum(),
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                true,
                true,
                environment,
            )
            .context("error gen I64Load32S")?;
        }
        Operator::I64Load32U { memarg } => {
            memory::generate_load(
                memarg,
                environment.inkwell_types.i64_type.as_basic_type_enum(),
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                false,
                true,
                environment,
            )
            .context("error gen I64Load32U")?;
        }
        Operator::I32Store { memarg } => {
            memory::generate_store(
                memarg,
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                false,
                environment,
            )
            .context("error gen I32Store")?;
        }
        Operator::I64Store { memarg } => {
            memory::generate_store(
                memarg,
                environment.inkwell_types.i64_type.as_basic_type_enum(),
                false,
                environment,
            )
            .context("error gen I64Store")?;
        }
        Operator::F32Store { memarg } => {
            memory::generate_store(
                memarg,
                environment.inkwell_types.f32_type.as_basic_type_enum(),
                false,
                environment,
            )
            .context("error gen F32Store")?;
        }
        Operator::F64Store { memarg } => {
            memory::generate_store(
                memarg,
                environment.inkwell_types.f64_type.as_basic_type_enum(),
                false,
                environment,
            )
            .context("error gen F64Store")?;
        }
        Operator::I32Store8 { memarg } | Operator::I64Store8 { memarg } => {
            memory::generate_store(
                memarg,
                environment.inkwell_types.i8_type.as_basic_type_enum(),
                true,
                environment,
            )
            .context("error I32Store")?;
        }
        Operator::I32Store16 { memarg } | Operator::I64Store16 { memarg } => {
            memory::generate_store(
                memarg,
                environment.inkwell_types.i16_type.as_basic_type_enum(),
                true,
                environment,
            )
            .context("error I32Store16")?;
        }
        Operator::I64Store32 { memarg } => {
            memory::generate_store(
                memarg,
                environment.inkwell_types.i32_type.as_basic_type_enum(),
                true,
                environment,
            )
            .context("error gen I64Store32")?;
        }
        /******************************
          Comparison instructions
        ******************************/
        Operator::I32Eqz => {
            environment.stack.push(
                environment
                    .inkwell_types
                    .i32_type
                    .const_zero()
                    .as_basic_value_enum(),
            );
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::EQ, environment)
                .context("error gen I32Eqz")?;
        }
        Operator::I64Eqz => {
            environment.stack.push(
                environment
                    .inkwell_types
                    .i64_type
                    .const_zero()
                    .as_basic_value_enum(),
            );
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::EQ, environment)
                .context("error gen I64Eqz")?;
        }
        Operator::I32Eq | Operator::I64Eq => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::EQ, environment)
                .context("error gen Eq")?;
        }
        Operator::I32Ne | Operator::I64Ne => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::NE, environment)
                .context("error gen Ne")?;
        }
        Operator::I32LtS | Operator::I64LtS => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::SLT, environment)
                .context("error gen LtS")?;
        }
        Operator::I32LtU | Operator::I64LtU => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::ULT, environment)
                .context("error gen LtU")?;
        }
        Operator::I32GtS | Operator::I64GtS => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::SGT, environment)
                .context("error gen GtS")?;
        }
        Operator::I32GtU | Operator::I64GtU => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::UGT, environment)
                .context("error gen GtU")?;
        }
        Operator::I32LeS | Operator::I64LeS => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::SLE, environment)
                .context("error gen LeS")?;
        }
        Operator::I32LeU | Operator::I64LeU => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::ULE, environment)
                .context("error gen LeU")?;
        }
        Operator::I32GeS | Operator::I64GeS => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::SGE, environment)
                .context("error gen GeS")?;
        }
        Operator::I32GeU | Operator::I64GeU => {
            numeric::helper_code_gen_comparison(inkwell::IntPredicate::UGE, environment)
                .context("error gen GeU")?;
        }
        _other => {
            log::error!("Unimplemented Inst {:?}", op);
            unreachable!("- unimplemented inst {:?}", op);
        }
    }
    Ok(())
}

// translate from linear memory's offset to Mewz's virtual address
fn helper_code_gen_llvm_insts<'a>(
    environment: &mut Environment<'a, '_>,
    function: FunctionValue<'a>,
    args: &[BasicMetadataValueEnum<'a>],
) -> Result<()> {
    let res = environment
        .builder
        .build_call(function, args, "")
        .try_as_basic_value()
        .left()
        .expect("fail build_call llvm_insts");
    environment.stack.push(res);
    Ok(())
}
