//! `insts` is a module that contains the definitions of WebAssembly instructions.

pub(crate) mod control;
mod memory;
mod numeric;

use anyhow::{bail, Context, Ok, Result};
use inkwell::{
    types::{BasicType, BasicTypeEnum},
    values::{BasicMetadataValueEnum, BasicValue, FunctionValue, PointerValue},
};
use wasmparser::Operator;

use crate::environment::{Environment, Global};
use crate::insts::control::UnreachableReason;

pub(super) fn parse_instruction<'a>(
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
            helper_code_gen_llvm_insts(
                environment,
                environment.inkwell_insts.ctlz_i64,
                &[
                    v1.into(),
                    environment.inkwell_types.i1_type.const_zero().into(),
                ],
            )
            .context("error gen I64Clz")?;
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

            // Since srem is implemented using sdiv in LLVM, we need to avoid
            // Undefined Behavior of INT_MIN % -1
            let (min_value, neg_one_value) = if matches!(op, Operator::I32RemS) {
                let min = environment
                    .inkwell_types
                    .i32_type
                    .const_int(i32::MIN as u64, false);
                let neg_one = environment
                    .inkwell_types
                    .i32_type
                    .const_int(u64::MAX, false);
                (min, neg_one)
            } else {
                let min = environment
                    .inkwell_types
                    .i64_type
                    .const_int(i64::MIN as u64, false);
                let neg_one = environment
                    .inkwell_types
                    .i64_type
                    .const_int(u64::MAX, false);
                (min, neg_one)
            };

            // If the dividend is INT_MIN and the divisor is -1, we replace v1 with 0
            // to avoid Undefined Behavior. i.e.
            //  %overflow = (%v1 == min_value) && (%v2 == neg_one_value)
            //  %v1_new = if %overflow then 0 else %v1
            //  %res = srem %v1_new, %v2
            let overflow = environment.builder.build_and(
                environment.builder.build_int_compare(
                    inkwell::IntPredicate::EQ,
                    v1.into_int_value(),
                    min_value,
                    "",
                ),
                environment.builder.build_int_compare(
                    inkwell::IntPredicate::EQ,
                    v2.into_int_value(),
                    neg_one_value,
                    "",
                ),
                "overflow",
            );
            let v1_new = environment.builder.build_select(
                overflow,
                if matches!(op, Operator::I32RemS) {
                    environment.inkwell_types.i32_type.const_zero()
                } else {
                    environment.inkwell_types.i64_type.const_zero()
                },
                v1.into_int_value(),
                "v1_new",
            );
            let res = environment.builder.build_int_signed_rem(
                v1_new.into_int_value(),
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
            log::error!("Unimplemented Inst {op:?}");
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
