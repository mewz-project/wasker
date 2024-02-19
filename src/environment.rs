//! `environment` holds the state of the compiler.

use anyhow::{bail, Result};
use inkwell::{
    basic_block::BasicBlock,
    builder::Builder,
    context::Context,
    module::Module,
    types::{BasicTypeEnum, FunctionType},
    values::{BasicValueEnum, FunctionValue, GlobalValue, IntValue},
};
use std::path::Path;

use crate::inkwell::{InkwellInsts, InkwellTypes};
use crate::insts::control::{ControlFrame, UnreachableReason};

pub enum Global<'a> {
    Mut {
        ptr_to_value: GlobalValue<'a>,
        ty: BasicTypeEnum<'a>,
    },
    Const {
        value: BasicValueEnum<'a>,
    },
}

pub struct Environment<'a, 'b> {
    // Output dir
    pub output_file: &'b Path,

    // Inkwell code generator
    pub context: &'a Context,
    pub module: &'b Module<'a>,
    pub builder: Builder<'a>,

    // Set of primitive types of inkwell
    pub inkwell_types: InkwellTypes<'a>,
    pub inkwell_insts: InkwellInsts<'a>,

    // List of all signatures
    pub function_signature_list: Vec<FunctionType<'a>>,

    // List of functions
    pub function_list: Vec<FunctionValue<'a>>,
    pub function_list_signature: Vec<u32>,
    pub function_list_name: Vec<String>,

    // Stack for Wasm binary
    pub stack: Vec<BasicValueEnum<'a>>,

    // Global variables
    pub global: Vec<Global<'a>>,

    pub import_section_size: u32,
    pub function_section_size: u32,

    pub current_function_idx: u32,

    // ControlFrame
    pub control_frames: Vec<ControlFrame<'a>>,

    pub wasker_init_block: Option<BasicBlock<'a>>,
    pub wasker_main_block: Option<BasicBlock<'a>>,

    pub linear_memory_offset_global: Option<GlobalValue<'a>>,

    // Caution: Can only used in wasker_init
    pub linear_memory_offset_int: Option<IntValue<'a>>,

    pub start_function_idx: Option<u32>,

    pub unreachable_depth: u32,
    pub unreachable_reason: UnreachableReason,

    // Table
    pub global_table: Option<GlobalValue<'a>>,

    // Memory
    pub global_memory_size: Option<GlobalValue<'a>>,
    pub fn_memory_grow: Option<FunctionValue<'a>>,
}

impl<'a, 'b> Environment<'a, 'b> {
    /// Restore the stack to the specified size.
    pub fn reset_stack(&mut self, stack_size: usize) {
        self.stack.truncate(stack_size);
    }

    /// Pop the stack and load the value if it is a pointer.
    pub fn pop_and_load(&mut self) -> BasicValueEnum<'a> {
        let pop = self.stack.pop().expect("stack empty");
        if pop.is_pointer_value() {
            self.builder.build_load(
                self.inkwell_types.i64_type,
                pop.into_pointer_value(),
                "from_stack",
            )
        } else {
            pop
        }
    }

    /// Get the control frame immediately outside the current control frame.
    pub fn ref_outer_frame(&self) -> &ControlFrame<'a> {
        let frame_len = self.control_frames.len();
        assert_ne!(frame_len, 0);
        &self.control_frames[frame_len - 1]
    }

    /// Pop two values from the stack.
    pub fn pop2(&mut self) -> (BasicValueEnum<'a>, BasicValueEnum<'a>) {
        let v2 = self.stack.pop().expect("stack empty");
        let v1 = self.stack.pop().expect("stack empty");
        (v1, v2)
    }

    /// Peek values from the stack.
    pub fn peekn(&self, n: usize) -> Result<&[BasicValueEnum<'a>]> {
        if self.stack.len() < n {
            bail!("stack length too short {} vs {}", self.stack.len(), n);
        }
        let index = self.stack.len() - n;
        Ok(&self.stack[index..])
    }
}
