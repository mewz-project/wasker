//! Definition of control instructions.

use crate::environment::Environment;
use crate::section;
use anyhow::{anyhow, Result};
use inkwell::{
    basic_block::BasicBlock,
    values::{BasicMetadataValueEnum, FunctionValue, PhiValue},
};
use wasmparser::{BlockType, BrTable};

/// Holds the state of if-else.
#[derive(Eq, PartialEq, Debug)]
pub enum IfElseState {
    If,
    Else,
}


/// Holds the state of unreachable.
#[derive(Eq, PartialEq, Debug)]
pub enum UnreachableReason {
    Br,
    Return,
    Unreachable,
    Reachable,
}

impl UnreachableReason {
    fn is_jumped(&self) -> bool {
        match self {
            UnreachableReason::Br | UnreachableReason::Unreachable | UnreachableReason::Return => {
                true
            }
            UnreachableReason::Reachable => false,
        }
    }
}

/// Holds the state of control instructions: block, loop, if-else.
#[derive(Debug)]
pub enum ControlFrame<'a> {
    Loop {
        loop_body: BasicBlock<'a>,
        loop_next: BasicBlock<'a>,
        body_phis: Vec<PhiValue<'a>>,
        end_phis: Vec<PhiValue<'a>>,
        stack_size: usize,
    },
    Block {
        next: BasicBlock<'a>,
        end_phis: Vec<PhiValue<'a>>,
        stack_size: usize,
    },
    IfElse {
        if_then: BasicBlock<'a>,
        if_else: BasicBlock<'a>,
        if_end: BasicBlock<'a>,
        ifelse_state: IfElseState,
        end_phis: Vec<PhiValue<'a>>,
        stack_size: usize,
    },
}

impl<'a> ControlFrame<'a> {
    fn br_dest(&self) -> &BasicBlock<'a> {
        match self {
            ControlFrame::Loop { ref loop_body, .. } => loop_body,
            ControlFrame::Block { ref next, .. } => next,
            ControlFrame::IfElse { ref if_end, .. } => if_end,
        }
    }
}

pub fn gen_block(environment: &mut Environment<'_, '_>, blockty: BlockType) -> Result<()> {
    let current_block = environment.builder.get_insert_block().unwrap();
    let next_block = environment.context.append_basic_block(
        environment.function_list[environment.current_function_idx as usize],
        "block_next",
    );

    // Phi
    environment.builder.position_at_end(next_block);
    let mut phis: Vec<PhiValue> = Vec::new();
    match blockty {
        BlockType::Empty => {}
        BlockType::Type(valty) => {
            environment.builder.position_at_end(next_block);
            let phi = environment.builder.build_phi(
                section::wasmparser_to_inkwell(valty, &environment.inkwell_types).unwrap(),
                "end_phi",
            );
            phis.push(phi);
        }
        BlockType::FuncType(..) => {
            unreachable!("Unexpected FuncType");
        }
    }

    environment.builder.position_at_end(current_block);
    environment.control_frames.push(ControlFrame::Block {
        next: next_block,
        end_phis: phis,
        stack_size: environment.stack.len(),
    });
    Ok(())
}

pub fn gen_loop(environment: &mut Environment<'_, '_>, blockty: BlockType) -> Result<()> {
    let current_block = environment.builder.get_insert_block().unwrap();

    // Create blocks
    let body_block = environment.context.append_basic_block(
        environment.function_list[environment.current_function_idx as usize],
        "loop_body",
    );
    let next_block = environment.context.append_basic_block(
        environment.function_list[environment.current_function_idx as usize],
        "loop_next",
    );

    // Phi
    environment.builder.position_at_end(next_block);
    let body_phis: Vec<PhiValue> = Vec::new();
    let mut phis: Vec<PhiValue> = Vec::new();
    match blockty {
        BlockType::Empty => {}
        BlockType::Type(valty) => {
            environment.builder.position_at_end(next_block);
            let phi = environment.builder.build_phi(
                section::wasmparser_to_inkwell(valty, &environment.inkwell_types).unwrap(),
                "end_phi",
            );
            phis.push(phi);
        }
        BlockType::FuncType(..) => {
            unreachable!("Unexpected FuncType");
        }
    }

    environment.control_frames.push(ControlFrame::Loop {
        loop_body: body_block,
        loop_next: next_block,
        body_phis,
        end_phis: phis,
        stack_size: environment.stack.len(),
    });

    // Move to loop_body
    environment.builder.position_at_end(current_block);
    environment.builder.build_unconditional_branch(body_block);
    environment.builder.position_at_end(body_block);
    Ok(())
}

pub fn gen_if(environment: &mut Environment<'_, '_>, blockty: BlockType) -> Result<()> {
    let current_block = environment
        .builder
        .get_insert_block()
        .expect("fail to get_insert_block");

    // Create blocks
    let then_block = environment.context.append_basic_block(
        environment.function_list[environment.current_function_idx as usize],
        "then",
    );
    let else_block = environment.context.append_basic_block(
        environment.function_list[environment.current_function_idx as usize],
        "else",
    );
    let end_block = environment.context.append_basic_block(
        environment.function_list[environment.current_function_idx as usize],
        "end",
    );

    // Phi
    environment.builder.position_at_end(end_block);
    let mut end_phis: Vec<PhiValue> = Vec::new();
    match blockty {
        BlockType::Empty => {}
        BlockType::Type(valty) => {
            environment.builder.position_at_end(end_block);
            let phi = environment.builder.build_phi(
                section::wasmparser_to_inkwell(valty, &environment.inkwell_types).unwrap(),
                "end_phi",
            );
            end_phis.push(phi);
        }
        BlockType::FuncType(..) => {
            return Err(anyhow!("Unexpected FuncType"));
        }
    }

    // Reserve blocks
    environment.builder.position_at_end(current_block);
    environment.control_frames.push(ControlFrame::IfElse {
        if_then: then_block,
        if_else: else_block,
        if_end: end_block,
        ifelse_state: IfElseState::If,
        end_phis,
        stack_size: environment.stack.len(),
    });

    // Compare stack value vs zero
    let cond_value = environment.builder.build_int_compare(
        inkwell::IntPredicate::NE,
        environment
            .stack
            .pop()
            .expect("stack empty")
            .into_int_value(),
        environment.inkwell_types.i32_type.const_int(0, false),
        "",
    );
    environment
        .builder
        .build_conditional_branch(cond_value, then_block, else_block);

    // Jump to then block
    environment.builder.position_at_end(then_block);
    Ok(())
}

pub fn gen_else(environment: &mut Environment<'_, '_>) -> Result<()> {
    let current_block = environment
        .builder
        .get_insert_block()
        .expect("fail to get_insert_block");

    // Phi
    let framelen = environment.control_frames.len();
    let frame = &mut environment.control_frames[framelen - 1];
    match frame {
        ControlFrame::IfElse {
            if_else,
            if_end,
            ifelse_state,
            end_phis,
            ..
        } => {
            *ifelse_state = IfElseState::Else;

            // Phi
            if environment.unreachable_depth == 0 {
                // Phi
                for phi in end_phis {
                    let value = environment.stack.pop().expect("stack empty");
                    phi.add_incoming(&[(&value, current_block)]);
                }
            }

            // Jump to merge block from current block
            if !environment.unreachable_reason.is_jumped() {
                environment.builder.build_unconditional_branch(*if_end);
            }

            // Define else block
            environment.builder.position_at_end(*if_else);
        }
        _ => {
            unreachable!("Op Else with another ControlFrame");
        }
    }
    Ok(())
}
pub fn gen_br(environment: &mut Environment<'_, '_>, relative_depth: u32) -> Result<()> {
    let current_block = environment
        .builder
        .get_insert_block()
        .expect("error get_insert_block");
    let frame =
        &environment.control_frames[environment.control_frames.len() - 1 - relative_depth as usize];

    let phis = match frame {
        ControlFrame::Block { end_phis, .. } => end_phis,
        ControlFrame::IfElse { end_phis, .. } => end_phis,
        ControlFrame::Loop { body_phis, .. } => body_phis,
    };
    for phi in phis {
        let value = environment.stack.pop().expect("stack empty");
        phi.add_incoming(&[(&value, current_block)]);
    }

    environment
        .builder
        .build_unconditional_branch(*frame.br_dest());
    environment.unreachable_depth += 1;
    environment.unreachable_reason = UnreachableReason::Br;
    Ok(())
}

pub fn gen_brif(environment: &mut Environment<'_, '_>, relative_depth: u32) -> Result<()> {
    let current_block = environment
        .builder
        .get_insert_block()
        .expect("error get_insert_block");
    let frame =
        &environment.control_frames[environment.control_frames.len() - 1 - relative_depth as usize];

    // Branch condition: whether the top value of stack is not zero
    let cond = environment.stack.pop().expect("stack empty");
    let cond_value = environment.builder.build_int_compare(
        inkwell::IntPredicate::NE,
        cond.into_int_value(),
        environment.inkwell_types.i32_type.const_int(0, false),
        "",
    );

    // Phi
    let phis = match frame {
        ControlFrame::Block { end_phis, .. } => end_phis,
        ControlFrame::IfElse { end_phis, .. } => end_phis,
        ControlFrame::Loop { body_phis, .. } => body_phis,
    };
    let values = environment.peekn(phis.len()).expect("fail stack peekn");
    for (i, phi) in phis.iter().enumerate().rev() {
        let value = values[i];
        phi.add_incoming(&[(&value, current_block)]);
    }

    // Create else block
    let else_block = environment.context.append_basic_block(
        environment.function_list[environment.current_function_idx as usize],
        "brif_else",
    );

    // Branch
    environment
        .builder
        .build_conditional_branch(cond_value, *frame.br_dest(), else_block);
    environment.builder.position_at_end(else_block);
    Ok(())
}

pub fn gen_br_table(environment: &mut Environment<'_, '_>, targets: BrTable) -> Result<()> {
    let current_block = environment
        .builder
        .get_insert_block()
        .expect("error get_insert_block");
    let idx = environment.stack.pop().expect("stack empty");

    // default frame
    let default = targets.default();
    let default_frame =
        &environment.control_frames[environment.control_frames.len() - 1 - default as usize];

    // Phi
    let phis = match default_frame {
        ControlFrame::Block { end_phis, .. } => end_phis,
        ControlFrame::IfElse { end_phis, .. } => end_phis,
        ControlFrame::Loop { body_phis, .. } => body_phis,
    };
    let values = environment.peekn(phis.len()).expect("fail stack peekn");
    for (i, phi) in phis.iter().enumerate().rev() {
        let value = values[i];
        log::debug!("- add_incoming to {:?}", phi);
        phi.add_incoming(&[(&value, current_block)]);
    }

    // cases
    let mut cases: Vec<_> = Vec::new();
    for (i, depth) in targets.targets().enumerate() {
        let depth = depth.expect("fail to get depth");
        let dest =
            &environment.control_frames[environment.control_frames.len() - 1 - depth as usize];
        let intv = environment
            .inkwell_types
            .i32_type
            .const_int(i as u64, false);
        cases.push((intv, *dest.br_dest()));
        let phis = match dest {
            ControlFrame::Block { end_phis, .. } => end_phis,
            ControlFrame::IfElse { end_phis, .. } => end_phis,
            ControlFrame::Loop { body_phis, .. } => body_phis,
        };
        let values = environment.peekn(phis.len()).expect("fail stack peekn");
        for (i, phi) in phis.iter().enumerate().rev() {
            let value = values[i];
            phi.add_incoming(&[(&value, current_block)]);
            log::debug!("- add_incoming to {:?}", phi);
        }
    }
    // switch
    environment
        .builder
        .build_switch(idx.into_int_value(), *default_frame.br_dest(), &cases);
    environment.unreachable_depth += 1;
    environment.unreachable_reason = UnreachableReason::Br;
    Ok(())
}

pub fn gen_end<'a>(
    environment: &mut Environment<'a, '_>,
    current_fn: FunctionValue<'a>,
) -> Result<()> {
    let current_block = environment
        .builder
        .get_insert_block()
        .expect("fail to get_insert_block");

    let frame = environment
        .control_frames
        .pop()
        .expect("control frame empty");

    if environment.control_frames.is_empty() {
        // End of function
        match environment.unreachable_reason {
            UnreachableReason::Unreachable | UnreachableReason::Return => {
                environment.builder.position_at_end(*frame.br_dest());
                if current_fn.get_type().get_return_type().is_none() {
                    environment.builder.build_return(None);
                } else {
                    let ret_ty = current_fn
                        .get_type()
                        .get_return_type()
                        .expect("failed to get ret type");
                    let dummy = ret_ty.const_zero();
                    environment.builder.build_return(Some(&dummy));
                }
            }
            UnreachableReason::Reachable | UnreachableReason::Br => {
                environment
                    .builder
                    .build_unconditional_branch(*frame.br_dest());
                environment.builder.position_at_end(*frame.br_dest());
                if current_fn.get_type().get_return_type().is_none() {
                    environment.builder.build_return(None);
                } else {
                    let phis = match frame {
                        ControlFrame::Block { ref end_phis, .. } => end_phis,
                        _ => {
                            unreachable!("Unexpected ControlFrame")
                        }
                    };
                    assert!(!phis.is_empty());

                    // Collect Phi
                    if environment.unreachable_reason == UnreachableReason::Reachable {
                        for phi in phis {
                            let value = environment.stack.pop().expect("stack empty");
                            phi.add_incoming(&[(&value, current_block)]);
                        }
                    }

                    // Return value
                    // TODO: support multiple phis
                    let value = phis[0].as_basic_value();
                    environment.builder.build_return(Some(&value));
                }
            }
        }
    } else {
        // End of Block/IfElse/Loop
        let (next, end_phis, stack_size) = match frame {
            ControlFrame::Loop {
                loop_next,
                end_phis,
                stack_size,
                ..
            } => (loop_next, end_phis, stack_size),
            ControlFrame::Block {
                next,
                end_phis,
                stack_size,
            } => (next, end_phis, stack_size),
            ControlFrame::IfElse {
                if_else,
                if_end,
                ifelse_state,
                end_phis,
                stack_size,
                ..
            } => {
                // Case Else block doesn't exist
                if ifelse_state == IfElseState::If {
                    environment.builder.position_at_end(if_else);
                    environment.builder.build_unconditional_branch(if_end);
                }
                (if_end, end_phis, stack_size)
            }
        };
        if environment.unreachable_reason == UnreachableReason::Reachable {
            // Collect Phi
            for phi in &end_phis {
                let value = environment.stack.pop().expect("stack empty");
                phi.add_incoming(&[(&value, current_block)]);
            }
            // Jump
            environment.builder.position_at_end(current_block);
            environment.builder.build_unconditional_branch(next);
        }

        environment.builder.position_at_end(next);
        environment.reset_stack(stack_size);

        // Phi
        for phi in &end_phis {
            if phi.count_incoming() == 0 {
                log::debug!("- no phi");
                let basic_ty = phi.as_basic_value().get_type();
                let placeholder_value = basic_ty.const_zero();
                environment.stack.push(placeholder_value);
                phi.as_instruction().erase_from_basic_block();
            } else {
                log::debug!("- phi.incoming = {}", phi.count_incoming());
                let value = phi.as_basic_value();
                environment.stack.push(value);
            }
        }
    }
    Ok(())
}

pub fn gen_call(environment: &mut Environment<'_, '_>, function_index: u32) -> Result<()> {
    let fn_called = environment.function_list[function_index as usize];

    // collect args from stack
    let mut args: Vec<BasicMetadataValueEnum> = Vec::new();

    if fn_called.get_name().to_str() == anyhow::Result::Ok("print") {
        args.push(environment.pop_and_load().into());

        let arg0 = environment.pop_and_load();
        let linear_memory_offset_local = environment.builder.build_load(
            environment.inkwell_types.i8_ptr_type,
            environment
                .linear_memory_offset_global
                .expect("should define linet_memory_offset_global")
                .as_pointer_value(),
            "linm_local",
        );
        let linear_memory_offset_int = environment.builder.build_ptr_to_int(
            linear_memory_offset_local.into_pointer_value(),
            environment.inkwell_types.i64_type,
            "linm_int",
        );
        let offset = arg0.into_int_value();
        let translated_address =
            environment
                .builder
                .build_int_add(linear_memory_offset_int, offset, "transed_addr");
        args.push(translated_address.into());
    } else {
        for _ in 0..fn_called.count_params() {
            args.push(environment.stack.pop().expect("stack empty").into());
        }
    }
    // call
    args.reverse();
    let call_site = environment.builder.build_call(fn_called, &args[..], "");
    if call_site.try_as_basic_value().is_left() {
        environment.stack.push(
            call_site
                .try_as_basic_value()
                .left()
                .expect("fail translate call_site"),
        );
    }
    Ok(())
}

pub fn gen_call_indirect(
    environment: &mut Environment<'_, '_>,
    type_index: u32,
    table_index: u32,
    _table_byte: u8,
) -> Result<()> {
    // TODO: support larger
    assert_eq!(table_index, 0);

    // Load function pointer
    let idx = environment
        .stack
        .pop()
        .expect("stack empty")
        .into_int_value();
    let dst_addr = unsafe {
        environment.builder.build_gep(
            environment.inkwell_types.i8_ptr_type,
            environment
                .global_table
                .expect("should define global_table")
                .as_pointer_value(),
            &[idx],
            "dst_addr",
        )
    };
    let fptr =
        environment
            .builder
            .build_load(environment.inkwell_types.i8_ptr_type, dst_addr, "fptr");

    // args
    let func_type = environment.function_signature_list[type_index as usize];
    let mut args: Vec<BasicMetadataValueEnum> = Vec::new();
    for _ in 0..func_type.get_param_types().len() {
        args.push(environment.stack.pop().expect("stack empty").into());
    }

    // call and push result
    args.reverse();
    let call_site = environment.builder.build_indirect_call(
        func_type,
        fptr.into_pointer_value(),
        &args,
        "call_site",
    );
    if call_site.try_as_basic_value().is_left() {
        environment.stack.push(
            call_site
                .try_as_basic_value()
                .left()
                .expect("fail translate call_site"),
        );
    }
    Ok(())
}

pub fn gen_drop(environment: &mut Environment<'_, '_>) -> Result<()> {
    environment.stack.pop().expect("stack empty");
    Ok(())
}

pub fn gen_return(
    environment: &mut Environment<'_, '_>,
    current_fn: FunctionValue<'_>,
) -> Result<()> {
    // Phi
    environment.unreachable_depth += 1;
    environment.unreachable_reason = UnreachableReason::Return;

    if current_fn.get_type().get_return_type().is_none() {
        environment.builder.build_return(None);
    } else {
        // Return value
        // TODO: support multiple phis
        let ret = environment.stack.pop().expect("stack empty");
        environment.builder.build_return(Some(&ret));
    }

    Ok(())
}

pub fn gen_select(environment: &mut Environment<'_, '_>) -> Result<()> {
    let v3 = environment.stack.pop().expect("stack empty");
    let v2 = environment.stack.pop().expect("stack empty");
    let v1 = environment.stack.pop().expect("stack empty");
    let cond = environment.builder.build_int_compare(
        inkwell::IntPredicate::NE,
        v3.into_int_value(),
        environment.inkwell_types.i32_type.const_zero(),
        "",
    );
    let res = environment.builder.build_select(cond, v1, v2, "");
    environment.stack.push(res);
    Ok(())
}

pub fn gen_unreachable(environment: &mut Environment<'_, '_>) -> Result<()> {
    environment.unreachable_depth += 1;
    environment.unreachable_reason = UnreachableReason::Unreachable;
    environment.builder.build_unreachable();
    Ok(())
}
