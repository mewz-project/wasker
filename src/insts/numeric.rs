//! Definition of numeric instructions.

use crate::environment::Environment;
use anyhow::Result;
use inkwell::values::BasicValue;

pub fn helper_code_gen_comparison(
    cond: inkwell::IntPredicate,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    let v2 = environment
        .stack
        .pop()
        .expect("stack empty")
        .into_int_value();
    let v1 = environment
        .stack
        .pop()
        .expect("stack empty")
        .into_int_value();
    let cond = environment.builder.build_int_compare(cond, v1, v2, "");
    let result =
        environment
            .builder
            .build_int_z_extend(cond, environment.inkwell_types.i32_type, "");
    environment.stack.push(result.as_basic_value_enum());

    Ok(())
}

pub fn helper_code_gen_comparison_float(
    cond: inkwell::FloatPredicate,
    environment: &mut Environment<'_, '_>,
) -> Result<()> {
    let v2 = environment
        .stack
        .pop()
        .expect("stack empty")
        .into_float_value();
    let v1 = environment
        .stack
        .pop()
        .expect("stack empty")
        .into_float_value();
    let cond = environment.builder.build_float_compare(cond, v1, v2, "");
    let result =
        environment
            .builder
            .build_int_z_extend(cond, environment.inkwell_types.i32_type, "");
    environment.stack.push(result.as_basic_value_enum());

    Ok(())
}

pub fn gen_and(environment: &mut Environment<'_, '_>) -> Result<()> {
    let (v1, v2) = environment.pop2();
    let res = environment
        .builder
        .build_and(v1.into_int_value(), v2.into_int_value(), "");
    environment.stack.push(res.as_basic_value_enum());
    Ok(())
}

pub fn gen_or(environment: &mut Environment<'_, '_>) -> Result<()> {
    let (v1, v2) = environment.pop2();
    let res = environment
        .builder
        .build_or(v1.into_int_value(), v2.into_int_value(), "");
    environment.stack.push(res.as_basic_value_enum());
    Ok(())
}

pub fn gen_xor(environment: &mut Environment<'_, '_>) -> Result<()> {
    let (v1, v2) = environment.pop2();
    let res = environment
        .builder
        .build_xor(v1.into_int_value(), v2.into_int_value(), "");
    environment.stack.push(res.as_basic_value_enum());
    Ok(())
}

pub fn gen_shl(environment: &mut Environment<'_, '_>) -> Result<()> {
    let (v1, v2) = environment.pop2();
    let res = environment
        .builder
        .build_left_shift(v1.into_int_value(), v2.into_int_value(), "");
    environment.stack.push(res.as_basic_value_enum());
    Ok(())
}

pub fn gen_shr(environment: &mut Environment<'_, '_>, sign_extend: bool) -> Result<()> {
    let (v1, v2) = environment.pop2();
    let res = environment.builder.build_right_shift(
        v1.into_int_value(),
        v2.into_int_value(),
        sign_extend,
        "",
    );
    environment.stack.push(res.as_basic_value_enum());
    Ok(())
}

pub fn gen_rotl(environment: &mut Environment<'_, '_>, if_32bit: bool) -> Result<()> {
    let (v1, v2) = environment.pop2();
    let (v1, v2) = (v1.into_int_value(), v2.into_int_value());
    let mask = if if_32bit {
        environment.inkwell_types.i32_type.const_int(31u64, false)
    } else {
        environment.inkwell_types.i64_type.const_int(63u64, false)
    };
    let v2 = environment.builder.build_and(v2, mask, "");
    let lhs = environment.builder.build_left_shift(v1, v2, "");

    let rhs = {
        let negv2 = environment.builder.build_int_neg(v2, "");
        let rhs = environment.builder.build_and(negv2, mask, "");
        environment.builder.build_right_shift(v1, rhs, false, "")
    };

    let res = environment.builder.build_or(lhs, rhs, "");
    environment.stack.push(res.as_basic_value_enum());
    Ok(())
}

pub fn gen_rotr(environment: &mut Environment<'_, '_>, if_32bit: bool) -> Result<()> {
    let (v1, v2) = environment.pop2();
    let (v1, v2) = (v1.into_int_value(), v2.into_int_value());
    let mask = if if_32bit {
        environment.inkwell_types.i32_type.const_int(31u64, false)
    } else {
        environment.inkwell_types.i64_type.const_int(63u64, false)
    };
    let v2 = environment.builder.build_and(v2, mask, "");
    let lhs = environment.builder.build_right_shift(v1, v2, false, "");

    let rhs = {
        let negv2 = environment.builder.build_int_neg(v2, "");
        let rhs = environment.builder.build_and(negv2, mask, "");
        environment.builder.build_left_shift(v1, rhs, "")
    };

    let res = environment.builder.build_or(lhs, rhs, "");
    environment.stack.push(res.as_basic_value_enum());
    Ok(())
}
