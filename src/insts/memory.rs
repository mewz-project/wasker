//! Definition of memory instructions.

use crate::environment::Environment;
use anyhow::{anyhow, Context, Ok, Result};
use inkwell::{
    types::{BasicType, PointerType},
    values::{BasicValue, IntValue, PointerValue},
    AddressSpace,
};
use wasmparser::MemArg;

pub fn memory_size(environment: &mut Environment<'_, '_>) -> Result<()> {
    let size = environment.builder.build_load(
        environment.inkwell_types.i32_type,
        environment
            .global_memory_size
            .expect("should defined global_memory_size")
            .as_pointer_value(),
        "mem_size",
    );
    environment.stack.push(size);
    Ok(())
}

pub fn memory_grow(environment: &mut Environment<'_, '_>) -> Result<()> {
    // Request to OS
    let delta = environment.stack.pop().expect("stack empty");
    environment.builder.build_call(
        environment
            .fn_memory_grow
            .expect("shold define fn_memory_grow"),
        &[delta.into()],
        "memory_grow",
    );

    // Load old memory size
    let size_old = environment.builder.build_load(
        environment.inkwell_types.i32_type,
        environment
            .global_memory_size
            .expect("should define global_memory_size")
            .as_pointer_value(),
        "mem_size_old",
    );
    environment.stack.push(size_old);

    // Update new memory size
    let size_new =
        environment
            .builder
            .build_int_add(size_old.into_int_value(), delta.into_int_value(), "");
    environment.builder.build_store(
        environment
            .global_memory_size
            .expect("shold define global_memory_size")
            .as_pointer_value(),
        size_new,
    );
    Ok(())
}

pub fn memory_copy(
    environment: &mut Environment<'_, '_>,
    dst_mem: u32,
    src_mem: u32,
) -> Result<()> {
    // TODO: multi memory
    assert_eq!(dst_mem, 0);
    assert_eq!(src_mem, 0);

    let len = environment.stack.pop().expect("stack empty");
    let src = environment.stack.pop().expect("stack empty");
    let dst = environment.stack.pop().expect("stack empty");
    let src_addr = resolve_pointer(
        src.into_int_value(),
        environment
            .inkwell_types
            .i32_type
            .ptr_type(AddressSpace::default()),
        environment,
    );
    let dst_addr = resolve_pointer(
        dst.into_int_value(),
        environment
            .inkwell_types
            .i32_type
            .ptr_type(AddressSpace::default()),
        environment,
    );
    environment
        .builder
        .build_memcpy(dst_addr, 1, src_addr, 1, len.into_int_value())
        .map_err(|e| anyhow!(e))
        .context("error build_memcpy")?;
    Ok(())
}

pub fn memory_fill(environment: &mut Environment<'_, '_>, mem: u32) -> Result<()> {
    // TODO: multi memory
    assert_eq!(mem, 0);

    let len = environment.stack.pop().expect("stack empty");
    let val = environment.stack.pop().expect("stack empty");
    let dst = environment.stack.pop().expect("stack empty");
    let dst_addr = resolve_pointer(
        dst.into_int_value(),
        environment
            .inkwell_types
            .i32_type
            .ptr_type(AddressSpace::default()),
        environment,
    );
    let val_i8 = environment.builder.build_int_truncate(
        val.into_int_value(),
        environment.inkwell_types.i8_type,
        "val_i8",
    );
    environment
        .builder
        .build_memset(dst_addr, 1, val_i8, len.into_int_value())
        .map_err(|e| anyhow!(e))
        .context("error build_memset")?;
    Ok(())
}

// generate IR for load instructions
pub fn generate_load<'a>(
    memarg: MemArg,
    extended_type: inkwell::types::BasicTypeEnum<'a>,
    load_type: inkwell::types::BasicTypeEnum<'a>,
    signed: bool,
    require_extend: bool,
    environment: &mut Environment<'a, '_>,
) -> Result<()> {
    // offset
    let address_operand = environment
        .stack
        .pop()
        .expect("stack empty")
        .into_int_value();
    let address_operand_ex = environment.builder.build_int_z_extend(
        address_operand,
        environment.inkwell_types.i64_type,
        "",
    );
    let memarg_offset = environment
        .inkwell_types
        .i64_type
        .const_int(memarg.offset, false);
    let offset = environment
        .builder
        .build_int_add(address_operand_ex, memarg_offset, "offset");

    // get actual virtual address
    let dst_addr = resolve_pointer(
        offset,
        load_type.ptr_type(AddressSpace::default()),
        environment,
    );
    // load value
    let result = environment
        .builder
        .build_load(load_type, dst_addr, "loaded");

    // push loaded value
    if require_extend {
        // extend value
        let extended_result = match signed {
            true => environment.builder.build_int_s_extend(
                result.into_int_value(),
                extended_type.into_int_type(),
                "loaded_extended",
            ),
            false => environment.builder.build_int_z_extend(
                result.into_int_value(),
                extended_type.into_int_type(),
                "loaded_extended",
            ),
        };
        environment
            .stack
            .push(extended_result.as_basic_value_enum());
    } else {
        environment.stack.push(result.as_basic_value_enum());
    }
    Ok(())
}

// generate IR for store instructions
// see generate_load
pub fn generate_store<'a>(
    memarg: MemArg,
    store_type: inkwell::types::BasicTypeEnum<'a>,
    require_narrow: bool,
    environment: &mut Environment<'a, '_>,
) -> Result<()> {
    // value
    let value = environment.stack.pop().expect("stack empty");

    // offset
    let address_operand = environment
        .stack
        .pop()
        .expect("stack empty")
        .into_int_value();
    let address_operand_ex = environment.builder.build_int_z_extend(
        address_operand,
        environment.inkwell_types.i64_type,
        "",
    );
    let memarg_offset = environment
        .inkwell_types
        .i64_type
        .const_int(memarg.offset, false);
    let offset = environment
        .builder
        .build_int_add(address_operand_ex, memarg_offset, "offset");

    // get actual virtual address
    let dst_addr = resolve_pointer(
        offset,
        store_type.ptr_type(AddressSpace::default()),
        environment,
    );

    if require_narrow {
        let narrow_value = environment.builder.build_int_truncate(
            value.into_int_value(),
            store_type.into_int_type(),
            "narrow_value",
        );
        environment.builder.build_store(dst_addr, narrow_value);
    } else {
        environment.builder.build_store(dst_addr, value);
    }

    Ok(())
}

fn resolve_pointer<'a>(
    offset: IntValue<'a>,
    ptr_type: PointerType<'a>,
    environment: &mut Environment<'a, '_>,
) -> PointerValue<'a> {
    // get base addr of linear memory from global variable
    let linear_memory_offset_local = environment
        .builder
        .build_load(
            environment.inkwell_types.i8_ptr_type,
            environment
                .linear_memory_offset_global
                .expect("stack empty")
                .as_pointer_value(),
            "linm_local",
        )
        .into_pointer_value();
    // calculate base + offset
    let dst_addr = unsafe {
        environment.builder.build_gep(
            environment.inkwell_types.i8_type,
            linear_memory_offset_local,
            &[offset],
            "resolved_addr",
        )
    };
    // cast pointer value
    environment
        .builder
        .build_bitcast(dst_addr, ptr_type, "bit_casted")
        .into_pointer_value()
}
