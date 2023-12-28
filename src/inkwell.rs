//! `inkwell` holds the types and functions of inkwell, which is a Rust-wrapper of LLVM.

use inkwell::{
    context::Context,
    module::Module,
    types::{BasicMetadataTypeEnum, FloatType, IntType, PointerType, VoidType},
    values::FunctionValue,
    AddressSpace,
};

/// Basic types of inkwell.
pub struct InkwellTypes<'ctx> {
    // basic type
    pub void_type: VoidType<'ctx>,
    pub i1_type: IntType<'ctx>,
    pub i8_type: IntType<'ctx>,
    pub i16_type: IntType<'ctx>,
    pub i32_type: IntType<'ctx>,
    pub i64_type: IntType<'ctx>,
    pub f32_type: FloatType<'ctx>,
    pub f64_type: FloatType<'ctx>,

    // basic pointer type
    pub i8_ptr_type: PointerType<'ctx>,
    pub i16_ptr_type: PointerType<'ctx>,
    pub i32_ptr_type: PointerType<'ctx>,
    pub i64_ptr_type: PointerType<'ctx>,
    pub f32_ptr_type: PointerType<'ctx>,
    pub f64_ptr_type: PointerType<'ctx>,
}

/// Basic insts of inkwell.
pub struct InkwellInsts<'ctx> {
    // llvm insts
    pub ctlz_i32: FunctionValue<'ctx>,
    pub ctlz_i64: FunctionValue<'ctx>,
    pub cttz_i32: FunctionValue<'ctx>,
    pub cttz_i64: FunctionValue<'ctx>,
    pub ctpop_i32: FunctionValue<'ctx>,
    pub ctpop_i64: FunctionValue<'ctx>,
    pub fabs_f32: FunctionValue<'ctx>,
    pub fabs_f64: FunctionValue<'ctx>,
    pub ceil_f32: FunctionValue<'ctx>,
    pub ceil_f64: FunctionValue<'ctx>,
    pub floor_f32: FunctionValue<'ctx>,
    pub floor_f64: FunctionValue<'ctx>,
    pub trunc_f32: FunctionValue<'ctx>,
    pub trunc_f64: FunctionValue<'ctx>,
    pub nearbyint_f32: FunctionValue<'ctx>,
    pub nearbyint_f64: FunctionValue<'ctx>,
    pub sqrt_f32: FunctionValue<'ctx>,
    pub sqrt_f64: FunctionValue<'ctx>,
    pub minnum_f32: FunctionValue<'ctx>,
    pub minnum_f64: FunctionValue<'ctx>,
    pub maxnum_f32: FunctionValue<'ctx>,
    pub maxnum_f64: FunctionValue<'ctx>,
    pub copysign_f32: FunctionValue<'ctx>,
    pub copysign_f64: FunctionValue<'ctx>,
}

impl<'ctx> InkwellTypes<'ctx> {
    /// Declare basic types of inkwell.
    pub fn declare(context: &'ctx Context) -> Self {
        // basic type
        let void_type = context.void_type();
        let i1_type = context.bool_type();
        let i8_type = context.i8_type();
        let i16_type = context.i16_type();
        let i32_type = context.i32_type();
        let i64_type = context.i64_type();
        let f32_type = context.f32_type();
        let f64_type = context.f64_type();

        // basic pointer type
        let i8_ptr_type = i8_type.ptr_type(AddressSpace::default());
        let i16_ptr_type = i16_type.ptr_type(AddressSpace::default());
        let i32_ptr_type = i32_type.ptr_type(AddressSpace::default());
        let i64_ptr_type = i64_type.ptr_type(AddressSpace::default());
        let f32_ptr_type = f32_type.ptr_type(AddressSpace::default());
        let f64_ptr_type = f64_type.ptr_type(AddressSpace::default());

        Self {
            void_type,
            i1_type,
            i8_type,
            i16_type,
            i32_type,
            i64_type,
            f32_type,
            f64_type,
            i8_ptr_type,
            i16_ptr_type,
            i32_ptr_type,
            i64_ptr_type,
            f32_ptr_type,
            f64_ptr_type,
        }
    }
}

/// Declare basic insts and types of inkwell.
pub fn init_inkwell<'a>(
    context: &'a Context,
    module: &Module<'a>,
) -> (InkwellTypes<'a>, InkwellInsts<'a>) {
    // basic type
    let void_type = context.void_type();
    let i1_type = context.bool_type();
    let i8_type = context.i8_type();
    let i16_type = context.i16_type();
    let i32_type = context.i32_type();
    let i64_type = context.i64_type();
    let f32_type = context.f32_type();
    let f64_type = context.f64_type();

    // basic pointer type
    let i8_ptr_type = i8_type.ptr_type(AddressSpace::default());
    let i16_ptr_type = i16_type.ptr_type(AddressSpace::default());
    let i32_ptr_type = i32_type.ptr_type(AddressSpace::default());
    let i64_ptr_type = i64_type.ptr_type(AddressSpace::default());
    let f32_ptr_type = f32_type.ptr_type(AddressSpace::default());
    let f64_ptr_type = f64_type.ptr_type(AddressSpace::default());

    // basic metadata type
    let i1_ty_basic_md: BasicMetadataTypeEnum = i1_type.into();
    let i32_ty_basic_md: BasicMetadataTypeEnum = i32_type.into();
    let i64_ty_basic_md: BasicMetadataTypeEnum = i64_type.into();
    let f32_ty_basic_md: BasicMetadataTypeEnum = f32_type.into();
    let f64_ty_basic_md: BasicMetadataTypeEnum = f64_type.into();

    // function type
    let ret_i32_take_i32_i1 = i32_type.fn_type(&[i32_ty_basic_md, i1_ty_basic_md], false);
    let ret_i64_take_i64_i1 = i64_type.fn_type(&[i64_ty_basic_md, i1_ty_basic_md], false);
    let ret_i32_take_i32 = i32_type.fn_type(&[i32_ty_basic_md], false);
    let ret_i64_take_i64 = i64_type.fn_type(&[i64_ty_basic_md], false);
    let ret_f64_take_f64 = f64_type.fn_type(&[f64_ty_basic_md], false);
    let ret_f32_take_f32 = f32_type.fn_type(&[f32_ty_basic_md], false);
    let ret_f32_take_f32_f32 = f32_type.fn_type(&[f32_ty_basic_md, f32_ty_basic_md], false);
    let ret_f64_take_f64_f64 = f64_type.fn_type(&[f64_ty_basic_md, f64_ty_basic_md], false);

    // Declare insts
    let ctlz_i32 = module.add_function("llvm.ctlz.i32", ret_i32_take_i32_i1, None);
    let ctlz_i64 = module.add_function("llvm.ctlz.i64", ret_i64_take_i64_i1, None);
    let cttz_i32 = module.add_function("llvm.cttz.i32", ret_i32_take_i32_i1, None);
    let cttz_i64 = module.add_function("llvm.cttz.i64", ret_i64_take_i64_i1, None);
    let ctpop_i32 = module.add_function("llvm.ctpop.i32", ret_i32_take_i32, None);
    let ctpop_i64 = module.add_function("llvm.ctpop.i64", ret_i64_take_i64, None);
    let fabs_f32 = module.add_function("llvm.fabs.f32", ret_f32_take_f32, None);
    let fabs_f64 = module.add_function("llvm.fabs.f64", ret_f64_take_f64, None);
    let ceil_f32 = module.add_function("llvm.ceil.f32", ret_f32_take_f32, None);
    let ceil_f64 = module.add_function("llvm.ceil.f64", ret_f64_take_f64, None);
    let trunc_f32 = module.add_function("llvm.trunc.f32", ret_f32_take_f32, None);
    let trunc_f64 = module.add_function("llvm.trunc.f64", ret_f64_take_f64, None);
    let nearbyint_f32 = module.add_function("llvm.nearbyint.f32", ret_f32_take_f32, None);
    let nearbyint_f64 = module.add_function("llvm.nearbyint.f64", ret_f64_take_f64, None);
    let floor_f32 = module.add_function("llvm.floor.f32", ret_f32_take_f32, None);
    let floor_f64 = module.add_function("llvm.floor.f64", ret_f64_take_f64, None);
    let sqrt_f32 = module.add_function("llvm.sqrt.f32", ret_f32_take_f32, None);
    let sqrt_f64 = module.add_function("llvm.sqrt.f64", ret_f64_take_f64, None);
    let minnum_f32 = module.add_function("llvm.minnum.f32", ret_f32_take_f32_f32, None);
    let minnum_f64 = module.add_function("llvm.minnum.f64", ret_f64_take_f64_f64, None);
    let maxnum_f32 = module.add_function("llvm.maxnum.f32", ret_f32_take_f32_f32, None);
    let maxnum_f64 = module.add_function("llvm.maxnum.f64", ret_f64_take_f64_f64, None);
    let copysign_f32 = module.add_function("llvm.copysign.f32", ret_f32_take_f32_f32, None);
    let copysign_f64 = module.add_function("llvm.copysign.f64", ret_f64_take_f64_f64, None);

    (
        InkwellTypes {
            void_type,
            i1_type,
            i8_type,
            i16_type,
            i32_type,
            i64_type,
            f32_type,
            f64_type,
            i8_ptr_type,
            i16_ptr_type,
            i32_ptr_type,
            i64_ptr_type,
            f32_ptr_type,
            f64_ptr_type,
        },
        InkwellInsts {
            ctlz_i32,
            ctlz_i64,
            cttz_i32,
            cttz_i64,
            ctpop_i32,
            ctpop_i64,
            fabs_f32,
            fabs_f64,
            ceil_f32,
            ceil_f64,
            floor_f32,
            floor_f64,
            trunc_f32,
            trunc_f64,
            nearbyint_f32,
            nearbyint_f64,
            sqrt_f32,
            sqrt_f64,
            minnum_f32,
            minnum_f64,
            maxnum_f32,
            maxnum_f64,
            copysign_f32,
            copysign_f64,
        },
    )
}
