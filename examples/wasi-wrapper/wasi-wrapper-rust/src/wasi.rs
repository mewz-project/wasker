/// WASI Implementation based on Rust Std Lib
use crate::memory::get_memory_base;
use wasi::{Errno, ERRNO_SUCCESS};

#[repr(C)]
#[derive(Clone, Copy)]
struct IoVec {
    iov_base: i32,
    iov_len: i32,
}

type WasiError = i32;

const fn errno2i32(errno: &Errno) -> WasiError {
    errno.raw() as WasiError
}

#[no_mangle]
pub extern "C" fn fd_write(
    _fd: i32,
    buf_iovec_addr: i32,
    vec_len: i32,
    size_addr: i32,
) -> WasiError {
    let vec_len = vec_len as usize;
    let memory_base = unsafe { get_memory_base() };
    let iovec: *const IoVec = unsafe { memory_base.offset(buf_iovec_addr as isize) } as *const _;

    let mut len = 0;
    for i in 0..vec_len {
        let IoVec { iov_base, iov_len } = unsafe { *iovec.add(i) };
        let buf = unsafe { memory_base.add(iov_base as usize) };
        let slice = unsafe { std::slice::from_raw_parts(buf, iov_len as usize) };

        if slice.is_empty() {
            continue;
        }
        print!("{}", String::from_utf8_lossy(slice));
        len += slice.len();
    }

    unsafe {
        let size_ptr = memory_base.offset(size_addr as isize);
        *(size_ptr as *mut i32) = len as i32;
    }
    errno2i32(&ERRNO_SUCCESS)
}

#[no_mangle]
pub extern "C" fn environ_get(_env_addrs: i32, _env_buf_addr: i32) -> WasiError {
    errno2i32(&ERRNO_SUCCESS)
}

#[no_mangle]
pub extern "C" fn environ_sizes_get(_env_count_addr: i32, _env_buf_size_addr: i32) -> WasiError {
    errno2i32(&ERRNO_SUCCESS)
}

#[no_mangle]
pub extern "C" fn proc_exit(code: i32) -> ! {
    std::process::exit(code);
}
