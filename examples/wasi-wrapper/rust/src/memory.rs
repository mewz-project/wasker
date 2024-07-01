//! Linear Memory
use std::sync::Mutex;

const LINEAR_MEMORY_BLOCK_SIZE: i32 = 64 * 1024;
const LINEAR_MEMORY_BLOCK_NUM_MAX: i32 = 32;

static mut LINEAR_MEMORY_BASE: *mut u8 = 0 as _;
static LINEAR_MEMORY_BLOCK_NUM: Mutex<i32> = Mutex::new(0);

#[inline]
pub unsafe fn get_memory_base() -> *mut u8 {
    LINEAR_MEMORY_BASE
}

unsafe fn alloc_memory() -> *mut u8 {
    use std::alloc::{alloc, Layout};
    LINEAR_MEMORY_BASE = alloc(
        Layout::from_size_align(
            (LINEAR_MEMORY_BLOCK_SIZE * LINEAR_MEMORY_BLOCK_NUM_MAX) as usize,
            8,
        )
        .unwrap(),
    );
    LINEAR_MEMORY_BASE
}

#[no_mangle]
pub extern "C" fn memory_base() -> usize {
    unsafe { alloc_memory() as usize }
}

#[no_mangle]
pub extern "C" fn memory_grow(block_num: i32) -> i32 {
    assert!(
        block_num >= 0,
        "block_num must be greater than or equal to 0"
    );
    let mut num = LINEAR_MEMORY_BLOCK_NUM.lock().unwrap();
    let old_val = *num;
    if num.checked_add(block_num).unwrap() > LINEAR_MEMORY_BLOCK_NUM_MAX {
        println!("memory_grow: failed to grow memory");
        return -1;
    }
    *num += block_num;
    old_val
}
