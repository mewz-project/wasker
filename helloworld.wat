(module
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32)))
  (type (;6;) (func (param i32 i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;11;) (func (param i32 i32 i32 i32 i32)))
  (type (;12;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i32 i32 i32)))
  (type (;14;) (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;15;) (func (param i64 i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "fd_write" (func $_ZN4wasi13lib_generated22wasi_snapshot_preview18fd_write17h03249cfaa96a4902E (type 7)))
  (import "wasi_snapshot_preview1" "environ_get" (func $__imported_wasi_snapshot_preview1_environ_get (type 4)))
  (import "wasi_snapshot_preview1" "environ_sizes_get" (func $__imported_wasi_snapshot_preview1_environ_sizes_get (type 4)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (type 1)))
  (func $__wasm_call_ctors (type 0))
  (func $_start (type 0)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load offset=1056064
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store offset=1056064
        call $__wasm_call_ctors
        call $__main_void
        local.set 0
        call $__wasm_call_dtors
        local.get 0
        br_if 1 (;@1;)
        return
      end
      unreachable
      unreachable
    end
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17h2ac421486d783348E (type 8) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 0
    i32.const 16
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    drop
    i32.const 0
    local.set 2
    i32.const 1
    local.set 3
    local.get 2
    local.get 3
    i32.and
    local.set 4
    local.get 4
    return)
  (func $_ZN3std2rt10lang_start17h5ef0d9ce5bc2a9a0E (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 32
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 0
    i32.store offset=12
    local.get 6
    local.get 1
    i32.store offset=16
    local.get 6
    local.get 2
    i32.store offset=20
    local.get 6
    local.get 3
    i32.store8 offset=27
    local.get 6
    local.get 0
    i32.store offset=8
    i32.const 8
    local.set 7
    local.get 6
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    i32.const 1048576
    local.set 10
    local.get 9
    local.get 10
    local.get 1
    local.get 2
    local.get 3
    call $_ZN3std2rt19lang_start_internal17hfb027677af674b9fE
    local.set 11
    local.get 6
    local.get 11
    i32.store offset=4
    local.get 6
    i32.load offset=4
    local.set 12
    local.get 6
    local.get 12
    i32.store offset=28
    i32.const 32
    local.set 13
    local.get 6
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h6fef827fcb4e5510E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h3250ddda269fd513E
    call $_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17h2ac421486d783348E
    local.set 5
    i32.const 1
    local.set 6
    local.get 5
    local.get 6
    i32.and
    local.set 7
    local.get 3
    local.get 7
    i32.store8 offset=11
    i32.const 11
    local.set 8
    local.get 3
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.set 10
    local.get 10
    call $_ZN3std3sys4wasi7process8ExitCode6as_i3217had408febceec50a5E
    local.set 11
    i32.const 16
    local.set 12
    local.get 3
    local.get 12
    i32.add
    local.set 13
    local.get 13
    global.set $__stack_pointer
    local.get 11
    return)
  (func $_ZN10hello_rust4main17h6d1faf4eeb560262E (type 0)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 0
    i32.const 32
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    i32.const 8
    local.set 3
    local.get 2
    local.get 3
    i32.add
    local.set 4
    local.get 4
    local.set 5
    i32.const 1048616
    local.set 6
    i32.const 1
    local.set 7
    local.get 5
    local.get 6
    local.get 7
    call $_ZN4core3fmt9Arguments9new_const17had2ab35fd29968efE
    i32.const 8
    local.set 8
    local.get 2
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.set 10
    local.get 10
    call $_ZN3std2io5stdio6_print17h4f358bc8fdb0e8ecE
    i32.const 32
    local.set 11
    local.get 2
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    return)
  (func $__main_void (type 8) (result i32)
    (local i32 i32 i32 i32)
    i32.const 4
    local.set 0
    i32.const 0
    local.set 1
    i32.const 0
    local.set 2
    local.get 0
    local.get 1
    local.get 1
    local.get 2
    call $_ZN3std2rt10lang_start17h5ef0d9ce5bc2a9a0E
    local.set 3
    local.get 3
    return)
  (func $_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h3250ddda269fd513E (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=4
    local.get 0
    call $_ZN4core3ops8function6FnOnce9call_once17hd099b1622fd5c327E
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    global.set $__stack_pointer
    return)
  (func $_ZN4core3fmt9Arguments9new_const17had2ab35fd29968efE (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 48
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=40
    local.get 5
    local.get 2
    i32.store offset=44
    i32.const 1
    local.set 6
    local.get 2
    local.set 7
    local.get 6
    local.set 8
    local.get 7
    local.get 8
    i32.gt_u
    local.set 9
    i32.const 1
    local.set 10
    local.get 9
    local.get 10
    i32.and
    local.set 11
    block  ;; label = @1
      local.get 11
      br_if 0 (;@1;)
      i32.const 0
      local.set 12
      local.get 5
      local.get 12
      i32.store offset=32
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 5
      i32.load offset=32
      local.set 13
      local.get 5
      i32.load offset=36
      local.set 14
      local.get 0
      local.get 13
      i32.store offset=16
      local.get 0
      local.get 14
      i32.store offset=20
      i32.const 1048624
      local.set 15
      local.get 0
      local.get 15
      i32.store offset=8
      i32.const 0
      local.set 16
      local.get 0
      local.get 16
      i32.store offset=12
      i32.const 48
      local.set 17
      local.get 5
      local.get 17
      i32.add
      local.set 18
      local.get 18
      global.set $__stack_pointer
      return
    end
    i32.const 8
    local.set 19
    local.get 5
    local.get 19
    i32.add
    local.set 20
    local.get 20
    local.set 21
    i32.const 1048636
    local.set 22
    i32.const 1
    local.set 23
    local.get 21
    local.get 22
    local.get 23
    call $_ZN4core3fmt9Arguments9new_const17had2ab35fd29968efE
    i32.const 8
    local.set 24
    local.get 5
    local.get 24
    i32.add
    local.set 25
    local.get 25
    local.set 26
    i32.const 1048720
    local.set 27
    local.get 26
    local.get 27
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h51f1d5e4cd316363E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $_ZN4core3ops8function6FnOnce9call_once17h9a90178c3b2123d9E
    local.set 5
    i32.const 16
    local.set 6
    local.get 3
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN4core3ops8function6FnOnce9call_once17h9a90178c3b2123d9E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=4
    i32.const 4
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    local.get 6
    call $_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h6fef827fcb4e5510E
    local.set 7
    i32.const 16
    local.set 8
    local.get 3
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set $__stack_pointer
    local.get 7
    return)
  (func $_ZN4core3ops8function6FnOnce9call_once17hd099b1622fd5c327E (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    call_indirect (type 0)
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    global.set $__stack_pointer
    return)
  (func $_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17had06bfe0e3f694afE (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    return)
  (func $__rust_alloc (type 4) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    call $__rdl_alloc
    local.set 2
    local.get 2
    return)
  (func $__rust_dealloc (type 5) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $__rdl_dealloc
    return)
  (func $__rust_realloc (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__rdl_realloc
    local.set 4
    local.get 4
    return)
  (func $__rust_alloc_error_handler (type 2) (param i32 i32)
    local.get 0
    local.get 1
    call $__rg_oom
    return)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h644e479311ce68f2E (type 2) (param i32 i32)
    local.get 0
    i64.const -163230743173927068
    i64.store offset=8
    local.get 0
    i64.const -4493808902380553279
    i64.store)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hb97b6b38134b6171E (type 2) (param i32 i32)
    local.get 0
    i64.const 7912501143857784762
    i64.store offset=8
    local.get 0
    i64.const 1677015036563326081
    i64.store)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hbee2961531151bddE (type 2) (param i32 i32)
    local.get 0
    i64.const 6146099213658827405
    i64.store offset=8
    local.get 0
    i64.const -3988785156179279576
    i64.store)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0e78180a9f293deeE (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    i32.load
    local.get 1
    call $_ZN64_$LT$alloc..ffi..c_str..NulError$u20$as$u20$core..fmt..Debug$GT$3fmt17ha8a7836e4987d8caE)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h235252d731a920e1E (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.const 1048779
    i32.const 2
    call $_ZN4core3fmt9Formatter3pad17hff4ffeb08667be0eE)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h43b10d22ac27745bE (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17h517c110f608bb8f2E)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6c8cb4c347fceb98E (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN70_$LT$core..panic..location..Location$u20$as$u20$core..fmt..Display$GT$3fmt17h5deda3f3e9eada64E)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hda2d5208ab8b8d7fE (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h8ca672917709e7afE)
  (func $_ZN4core3fmt5Write10write_char17h582fe3f8a927f01aE (type 4) (param i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=6
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=4
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=5
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=4
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=5
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=4
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=7
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=6
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=5
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=4
      i32.const 4
      local.set 1
    end
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    local.get 2
    i32.const 4
    i32.add
    local.get 1
    call $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17h3793cd8c0240d4ddE
    block  ;; label = @1
      local.get 2
      i32.load8_u offset=8
      local.tee 1
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.set 3
      local.get 2
      i64.load offset=8
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 5
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 5
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load
        local.tee 6
        local.get 3
        i32.const 4
        i32.add
        i32.load
        local.tee 5
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 5
          i32.load offset=4
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 7
          local.get 5
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 3
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i64.store align=4
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.ne)
  (func $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17h3793cd8c0240d4ddE (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.tee 1
              i32.load offset=8
              br_if 0 (;@5;)
              local.get 1
              i32.const -1
              i32.store offset=8
              local.get 4
              i32.const 8
              i32.add
              i32.const 10
              local.get 2
              local.get 3
              call $_ZN4core5slice6memchr7memrchr17h53c799eab43a25c3E
              local.get 1
              i32.const 12
              i32.add
              local.set 5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 4
                      i32.load offset=8
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 1
                          i32.const 20
                          i32.add
                          i32.load
                          local.tee 6
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 6
                          br 1 (;@10;)
                        end
                        local.get 6
                        local.get 5
                        i32.load
                        i32.add
                        i32.const -1
                        i32.add
                        i32.load8_u
                        i32.const 10
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const 16
                        i32.add
                        local.get 5
                        call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$9flush_buf17h56a79c2de247dabfE
                        local.get 4
                        i32.load8_u offset=16
                        local.tee 6
                        i32.const 4
                        i32.ne
                        br_if 3 (;@7;)
                        local.get 1
                        i32.const 20
                        i32.add
                        i32.load
                        local.set 6
                      end
                      local.get 1
                      i32.const 16
                      i32.add
                      i32.load
                      local.get 6
                      i32.sub
                      local.get 3
                      i32.gt_u
                      br_if 1 (;@8;)
                      local.get 0
                      local.get 5
                      local.get 2
                      local.get 3
                      call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17hc33b3ad17c6e47b7E
                      br 8 (;@1;)
                    end
                    local.get 4
                    i32.load offset=12
                    i32.const 1
                    i32.add
                    local.tee 6
                    local.get 3
                    i32.gt_u
                    br_if 4 (;@4;)
                    local.get 1
                    i32.const 20
                    i32.add
                    i32.load
                    local.tee 7
                    br_if 2 (;@6;)
                    local.get 4
                    i32.const 16
                    i32.add
                    local.get 1
                    local.get 2
                    local.get 6
                    call $_ZN60_$LT$std..io..stdio..StdoutRaw$u20$as$u20$std..io..Write$GT$9write_all17hff45d126cb4b60b3E
                    local.get 4
                    i32.load8_u offset=16
                    local.tee 7
                    i32.const 4
                    i32.eq
                    br_if 6 (;@2;)
                    local.get 0
                    local.get 4
                    i32.load offset=17 align=1
                    i32.store offset=1 align=1
                    local.get 0
                    i32.const 4
                    i32.add
                    local.get 4
                    i32.load offset=20 align=1
                    i32.store align=1
                    local.get 0
                    local.get 7
                    i32.store8
                    br 7 (;@1;)
                  end
                  local.get 1
                  i32.load offset=12
                  local.get 6
                  i32.add
                  local.get 2
                  local.get 3
                  call $memcpy
                  drop
                  local.get 0
                  i32.const 4
                  i32.store8
                  local.get 1
                  i32.const 20
                  i32.add
                  local.get 6
                  local.get 3
                  i32.add
                  i32.store
                  br 6 (;@1;)
                end
                local.get 0
                local.get 4
                i32.load offset=17 align=1
                i32.store offset=1 align=1
                local.get 0
                i32.const 4
                i32.add
                local.get 4
                i32.load offset=20 align=1
                i32.store align=1
                local.get 0
                local.get 6
                i32.store8
                br 5 (;@1;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.const 16
                  i32.add
                  i32.load
                  local.get 7
                  i32.sub
                  local.get 6
                  i32.le_u
                  br_if 0 (;@7;)
                  local.get 1
                  i32.load offset=12
                  local.get 7
                  i32.add
                  local.get 2
                  local.get 6
                  call $memcpy
                  drop
                  local.get 1
                  i32.const 20
                  i32.add
                  local.get 7
                  local.get 6
                  i32.add
                  i32.store
                  br 1 (;@6;)
                end
                local.get 4
                i32.const 16
                i32.add
                local.get 5
                local.get 2
                local.get 6
                call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17hc33b3ad17c6e47b7E
                local.get 4
                i32.load8_u offset=16
                local.tee 7
                i32.const 4
                i32.ne
                br_if 3 (;@3;)
              end
              local.get 4
              i32.const 16
              i32.add
              local.get 5
              call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$9flush_buf17h56a79c2de247dabfE
              local.get 4
              i32.load8_u offset=16
              local.tee 7
              i32.const 4
              i32.eq
              br_if 3 (;@2;)
              local.get 0
              local.get 4
              i32.load offset=17 align=1
              i32.store offset=1 align=1
              local.get 0
              i32.const 4
              i32.add
              local.get 4
              i32.load offset=20 align=1
              i32.store align=1
              local.get 0
              local.get 7
              i32.store8
              br 4 (;@1;)
            end
            i32.const 1050296
            i32.const 16
            local.get 4
            i32.const 24
            i32.add
            i32.const 1050312
            i32.const 1050372
            call $_ZN4core6result13unwrap_failed17hf48c8310675f070eE
            unreachable
          end
          i32.const 1048881
          i32.const 35
          i32.const 1049492
          call $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E
          unreachable
        end
        local.get 0
        local.get 4
        i32.load offset=17 align=1
        i32.store offset=1 align=1
        local.get 0
        i32.const 4
        i32.add
        local.get 4
        i32.load offset=20 align=1
        i32.store align=1
        local.get 0
        local.get 7
        i32.store8
        br 1 (;@1;)
      end
      local.get 2
      local.get 6
      i32.add
      local.set 7
      block  ;; label = @2
        local.get 1
        i32.const 16
        i32.add
        i32.load
        local.get 1
        i32.const 20
        i32.add
        local.tee 8
        i32.load
        local.tee 2
        i32.sub
        local.get 3
        local.get 6
        i32.sub
        local.tee 3
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 5
        local.get 7
        local.get 3
        call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17hc33b3ad17c6e47b7E
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=12
      local.get 2
      i32.add
      local.get 7
      local.get 3
      call $memcpy
      drop
      local.get 0
      i32.const 4
      i32.store8
      local.get 8
      local.get 2
      local.get 3
      i32.add
      i32.store
    end
    local.get 1
    local.get 1
    i32.load offset=8
    i32.const 1
    i32.add
    i32.store offset=8
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core3fmt5Write10write_char17h64c6c20879db5d63E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 1
    end
    local.get 0
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h96fe6309f626e056E
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h96fe6309f626e056E (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 0
    local.set 4
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 3
            local.get 2
            i32.store offset=12
            local.get 3
            local.get 1
            i32.store offset=8
            local.get 3
            i32.const 16
            i32.add
            i32.const 2
            local.get 3
            i32.const 8
            i32.add
            i32.const 1
            call $_ZN4wasi13lib_generated8fd_write17h644a6b3622a5007dE
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load16_u offset=16
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=20
                  local.tee 5
                  br_if 1 (;@6;)
                  i32.const 2
                  local.set 2
                  i32.const 1050676
                  local.set 5
                  br 5 (;@2;)
                end
                local.get 3
                local.get 3
                i32.load16_u offset=18
                i32.store16 offset=30
                local.get 3
                i32.const 30
                i32.add
                call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
                i32.const 65535
                i32.and
                local.tee 5
                call $_ZN3std3sys4wasi17decode_error_kind17hc2ea97d6c0117270E
                i32.const 255
                i32.and
                i32.const 35
                i32.eq
                br_if 1 (;@5;)
                i32.const 0
                local.set 2
                br 4 (;@2;)
              end
              local.get 2
              local.get 5
              i32.lt_u
              br_if 2 (;@3;)
              local.get 1
              local.get 5
              i32.add
              local.set 1
              local.get 2
              local.get 5
              i32.sub
              local.set 2
            end
            local.get 2
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 5
        local.get 2
        i32.const 1050688
        call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
        unreachable
      end
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 1
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 4
        i32.load
        local.tee 6
        local.get 4
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 7
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 4
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 2
      i32.store
      local.get 0
      i32.const 4
      i32.add
      local.get 5
      i32.store
      i32.const 1
      local.set 4
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $_ZN4core3fmt5Write10write_char17hffc835159d6a6f20E (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 3
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 3
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 1
      i32.load offset=4
      local.get 1
      i32.load offset=8
      local.tee 0
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      local.get 3
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
      local.get 1
      i32.load offset=8
      local.set 0
    end
    local.get 1
    i32.load
    local.get 0
    i32.add
    local.get 2
    i32.const 12
    i32.add
    local.get 3
    call $memcpy
    drop
    local.get 1
    local.get 0
    local.get 3
    i32.add
    i32.store offset=8
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E (type 5) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 2
        i32.add
        local.tee 2
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.const 1
        i32.shl
        local.tee 4
        local.get 2
        local.get 4
        local.get 2
        i32.gt_u
        select
        local.tee 2
        i32.const 8
        local.get 2
        i32.const 8
        i32.gt_u
        select
        local.tee 2
        i32.const -1
        i32.xor
        i32.const 31
        i32.shr_u
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 1
            i32.store offset=24
            local.get 3
            i32.const 1
            i32.store offset=20
            local.get 3
            local.get 0
            i32.load
            i32.store offset=16
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.store offset=20
        end
        local.get 3
        local.get 4
        local.get 2
        local.get 3
        i32.const 16
        i32.add
        call $_ZN5alloc7raw_vec11finish_grow17hefa6f421f56e91e4E
        local.get 3
        i32.load offset=4
        local.set 1
        block  ;; label = @3
          local.get 3
          i32.load
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.get 2
          i32.store
          br 2 (;@1;)
        end
        local.get 1
        i32.const -2147483647
        i32.eq
        br_if 1 (;@1;)
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.const 8
        i32.add
        i32.load
        call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
        unreachable
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17ha2fa7309cb777b97E
      unreachable
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core3fmt5Write9write_fmt17h00b558ecd4608885E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048784
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN4core3fmt5Write9write_fmt17h6b7e3003f3f69473E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048832
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN4core3fmt5Write9write_fmt17h7008031b2f3a175fE (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048856
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN3std9panicking12default_hook17h540665267a76b5f8E (type 1) (param i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 1
    local.set 2
    block  ;; label = @1
      i32.const 0
      i32.load offset=1056152
      i32.const 1
      i32.gt_u
      br_if 0 (;@1;)
      call $_ZN3std5panic19get_backtrace_style17h767795e76de2418cE
      i32.const 255
      i32.and
      local.set 2
    end
    local.get 1
    local.get 2
    i32.store8 offset=51
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            call $_ZN4core5panic10panic_info9PanicInfo8location17h229cda8b7bd8b69eE
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            local.get 2
            i32.store offset=52
            local.get 1
            i32.const 40
            i32.add
            local.get 0
            call $_ZN4core5panic10panic_info9PanicInfo7payload17hf91a0647e61cb947E
            i32.const 12
            local.set 3
            local.get 1
            i32.const 24
            i32.add
            local.get 1
            i32.load offset=40
            local.tee 2
            local.get 1
            i32.load offset=44
            i32.const 12
            i32.add
            i32.load
            call_indirect (type 2)
            block  ;; label = @5
              local.get 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i64.load offset=24
              i64.const -4493808902380553279
              i64.xor
              local.get 1
              i32.const 24
              i32.add
              i32.const 8
              i32.add
              i64.load
              i64.const -163230743173927068
              i64.xor
              i64.or
              i64.eqz
              br_if 2 (;@3;)
            end
            local.get 1
            i32.const 16
            i32.add
            local.get 0
            call $_ZN4core5panic10panic_info9PanicInfo7payload17hf91a0647e61cb947E
            local.get 1
            local.get 1
            i32.load offset=16
            local.tee 2
            local.get 1
            i32.load offset=20
            i32.const 12
            i32.add
            i32.load
            call_indirect (type 2)
            i32.const 1051512
            local.set 0
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            local.get 1
            i64.load
            i64.const -3988785156179279576
            i64.xor
            local.get 1
            i32.const 8
            i32.add
            i64.load
            i64.const 6146099213658827405
            i64.xor
            i64.or
            i64.const 0
            i64.ne
            br_if 3 (;@1;)
            local.get 2
            i32.const 8
            i32.add
            local.set 0
            br 2 (;@2;)
          end
          i32.const 1048736
          i32.const 43
          i32.const 1051496
          call $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E
          unreachable
        end
        local.get 2
        i32.const 4
        i32.add
        local.set 0
      end
      local.get 0
      i32.load
      local.set 3
      local.get 2
      i32.load
      local.set 0
    end
    local.get 1
    local.get 3
    i32.store offset=60
    local.get 1
    local.get 0
    i32.store offset=56
    i32.const 9
    local.set 0
    i32.const 1051524
    local.set 3
    block  ;; label = @1
      call $_ZN3std10sys_common11thread_info14current_thread17h83a3cdf5c5179a6aE
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 16
      i32.add
      i32.load
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 20
      i32.add
      i32.load
      i32.const -1
      i32.add
      local.set 0
      local.get 4
      local.set 3
    end
    local.get 1
    local.get 0
    i32.store offset=68
    local.get 1
    local.get 3
    i32.store offset=64
    local.get 1
    local.get 1
    i32.const 51
    i32.add
    i32.store offset=84
    local.get 1
    local.get 1
    i32.const 52
    i32.add
    i32.store offset=80
    local.get 1
    local.get 1
    i32.const 56
    i32.add
    i32.store offset=76
    local.get 1
    local.get 1
    i32.const 64
    i32.add
    i32.store offset=72
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=1056071
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store8 offset=1056071
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=1056172
          br_if 0 (;@3;)
          i32.const 0
          i32.const 1
          i32.store8 offset=1056172
          i32.const 0
          i32.const 0
          i32.store offset=1056176
          br 1 (;@2;)
        end
        i32.const 0
        i32.load offset=1056176
        local.set 0
        i32.const 0
        i32.const 0
        i32.store offset=1056176
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load8_u offset=8
        local.set 3
        local.get 0
        i32.const 1
        i32.store8 offset=8
        local.get 1
        local.get 3
        i32.store8 offset=95
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1056136
                i32.const 2147483647
                i32.and
                i32.eqz
                br_if 0 (;@6;)
                call $_ZN3std9panicking11panic_count17is_zero_slow_path17h88f026da919a15b3E
                local.set 3
                local.get 1
                i32.const 72
                i32.add
                local.get 0
                i32.const 12
                i32.add
                i32.const 1051536
                call $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h85c38d52f5cb3588E
                local.get 3
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              local.get 1
              i32.const 72
              i32.add
              local.get 0
              i32.const 12
              i32.add
              i32.const 1051536
              call $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h85c38d52f5cb3588E
            end
            i32.const 0
            i32.load offset=1056136
            i32.const 2147483647
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            call $_ZN3std9panicking11panic_count17is_zero_slow_path17h88f026da919a15b3E
            br_if 0 (;@4;)
            local.get 0
            i32.const 1
            i32.store8 offset=9
          end
          i32.const 0
          i32.const 1
          i32.store8 offset=1056071
          local.get 0
          i32.const 0
          i32.store8 offset=8
          block  ;; label = @4
            i32.const 0
            i32.load8_u offset=1056172
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.store offset=1056176
            i32.const 0
            i32.const 1
            i32.store8 offset=1056172
            br 3 (;@1;)
          end
          i32.const 0
          i32.load offset=1056176
          local.set 3
          i32.const 0
          local.get 0
          i32.store offset=1056176
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          local.get 3
          i32.load
          local.tee 0
          i32.const -1
          i32.add
          i32.store
          local.get 0
          i32.const 1
          i32.ne
          br_if 2 (;@1;)
          local.get 3
          call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h86e87e195cb55bd3E
          br 2 (;@1;)
        end
        local.get 1
        i64.const 0
        i64.store offset=108 align=4
        local.get 1
        i32.const 1048880
        i32.store offset=104
        local.get 1
        i32.const 1
        i32.store offset=100
        local.get 1
        i32.const 1052172
        i32.store offset=96
        local.get 1
        i32.const 95
        i32.add
        local.get 1
        i32.const 96
        i32.add
        call $_ZN4core9panicking13assert_failed17h88aeb5e475543e29E
        unreachable
      end
      local.get 1
      i32.const 72
      i32.add
      local.get 1
      i32.const 120
      i32.add
      i32.const 1051576
      call $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h85c38d52f5cb3588E
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 2
      i32.load
      local.tee 0
      i32.const -1
      i32.add
      i32.store
      local.get 0
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h247e604f5584e6abE
    end
    local.get 1
    i32.const 128
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core3ptr100drop_in_place$LT$$RF$mut$u20$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17hc678b1c1755486caE (type 1) (param i32))
  (func $_ZN3std9panicking11panic_count17is_zero_slow_path17h88f026da919a15b3E (type 8) (result i32)
    i32.const 0
    i32.load offset=1056152
    i32.eqz)
  (func $_ZN4core3ptr29drop_in_place$LT$$LP$$RP$$GT$17hb98729e73ea57a1cE (type 1) (param i32))
  (func $_ZN4core3ptr39drop_in_place$LT$std..path..PathBuf$GT$17hcd41e3e78ccde51eE (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h247e604f5584e6abE (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 20
      i32.add
      i32.load
      local.set 2
      local.get 1
      i32.const 0
      i32.store8
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      i32.const 1
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.const -1
      i32.add
      i32.store offset=4
      local.get 1
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 24
      i32.const 8
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h472112f9865843b5E (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr70drop_in_place$LT$std..panicking..begin_panic_handler..PanicPayload$GT$17hd62d624acfbbc3d7E (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 8
      i32.add
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17h90619d11b6168bf9E (type 2) (param i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.and
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17he92acc4b62fae97eE (type 1) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.const 4
    i32.add
    i32.load
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN4core9panicking13assert_failed17h88aeb5e475543e29E (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1048880
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    i32.const 0
    local.get 2
    i32.const 1048916
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048916
    local.get 2
    i32.const 8
    i32.add
    i32.const 1052236
    call $_ZN4core9panicking19assert_failed_inner17he4b24762864588bfE
    unreachable)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2301b060ccf78942E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 1
    end
    local.get 0
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h96fe6309f626e056E
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h58c44d9bb0977d8eE (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN4core3fmt5Write10write_char17h582fe3f8a927f01aE)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hc4e8266d1f346c62E (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN4core3fmt5Write10write_char17hffc835159d6a6f20E)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hf1f0c648386167e3E (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=14
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 1
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=15
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 1
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load offset=4
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h6d14ba36063c726fE
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          local.get 3
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 0
          i32.load
          local.get 3
          i32.add
          local.get 1
          i32.store8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        local.get 1
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
        local.get 0
        i32.load offset=8
        local.set 3
      end
      local.get 0
      i32.load
      local.get 3
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 1
      call $memcpy
      drop
      local.get 0
      local.get 3
      local.get 1
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h6d14ba36063c726fE (type 2) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 4
        i32.add
        i32.load
        local.tee 3
        i32.const 1
        i32.shl
        local.tee 4
        local.get 1
        local.get 4
        local.get 1
        i32.gt_u
        select
        local.tee 1
        i32.const 8
        local.get 1
        i32.const 8
        i32.gt_u
        select
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 31
        i32.shr_u
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.store offset=24
            local.get 2
            i32.const 1
            i32.store offset=20
            local.get 2
            local.get 0
            i32.load
            i32.store offset=16
            br 1 (;@3;)
          end
          local.get 2
          i32.const 0
          i32.store offset=20
        end
        local.get 2
        local.get 4
        local.get 1
        local.get 2
        i32.const 16
        i32.add
        call $_ZN5alloc7raw_vec11finish_grow17hefa6f421f56e91e4E
        local.get 2
        i32.load offset=4
        local.set 3
        block  ;; label = @3
          local.get 2
          i32.load
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.get 1
          i32.store
          br 2 (;@1;)
        end
        local.get 3
        i32.const -2147483647
        i32.eq
        br_if 1 (;@1;)
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.const 8
        i32.add
        i32.load
        call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
        unreachable
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17ha2fa7309cb777b97E
      unreachable
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h5b77f01b163e69a3E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048784
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h751c0741d29bc5ffE (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048808
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h7c22f686d2d0e8d8E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048856
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h8a4739c93ba0b641E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048832
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h3726bedafbdb8637E (type 6) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h3fc94b77ededba77E (type 6) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 2
    call $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h96fe6309f626e056E)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h631352d3d575f296E (type 6) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.load offset=8
      local.tee 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h9de6b261f02e625bE (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load
    local.tee 0
    i32.load offset=8
    local.get 1
    local.get 2
    call $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17h3793cd8c0240d4ddE
    block  ;; label = @1
      local.get 3
      i32.load8_u offset=8
      local.tee 2
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.set 4
      local.get 3
      i64.load offset=8
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 1
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 4
        i32.load
        local.tee 6
        local.get 4
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 7
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 4
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 5
      i64.store align=4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    i32.const 4
    i32.ne)
  (func $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h86e87e195cb55bd3E (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 12
      i32.add
      i32.load
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.const -1
      i32.add
      i32.store offset=4
      local.get 1
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 24
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN5alloc7raw_vec11finish_grow17hefa6f421f56e91e4E (type 9) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const -1
          i32.le_s
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.const 8
                  i32.add
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    local.get 1
                    local.set 3
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1056069
                  drop
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                local.get 1
                local.get 2
                call $__rust_realloc
                local.set 3
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                local.get 1
                local.set 3
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1056069
              drop
            end
            local.get 2
            local.get 1
            call $__rust_alloc
            local.set 3
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            i32.store offset=4
            local.get 0
            i32.const 8
            i32.add
            local.get 2
            i32.store
            local.get 0
            i32.const 0
            i32.store
            return
          end
          local.get 0
          local.get 1
          i32.store offset=4
          local.get 0
          i32.const 8
          i32.add
          local.get 2
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        i32.const 0
        i32.store offset=4
        local.get 0
        i32.const 8
        i32.add
        local.get 2
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=4
    end
    local.get 0
    i32.const 1
    i32.store)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17h3effdd62e9553808E (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h8ca672917709e7afE)
  (func $_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hcd17213d8f130a4eE (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        i32.store offset=8
        local.get 1
        i32.const 1049064
        i32.const 2
        local.get 2
        i32.const 8
        i32.add
        i32.const 1049072
        call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h3052256a61e44907E
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      local.get 0
      i32.store offset=12
      local.get 1
      i32.const 1049066
      i32.const 3
      local.get 2
      i32.const 12
      i32.add
      i32.const 1049088
      call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h3052256a61e44907E
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN3std3sys4wasi4once4Once4call17hee18ac680eb799ccE (type 1) (param i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load8_u offset=1056070
                  br_table 0 (;@7;) 2 (;@5;) 6 (;@1;) 1 (;@6;) 0 (;@7;)
                end
                i32.const 0
                i32.const 2
                i32.store8 offset=1056070
                local.get 0
                i32.load8_u
                local.set 2
                local.get 0
                i32.const 0
                i32.store8
                local.get 2
                i32.eqz
                br_if 2 (;@4;)
                local.get 1
                i32.const 0
                i32.store8 offset=31
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load8_u offset=1056104
                    i32.const 3
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 31
                    i32.add
                    call $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17h4cdc754394f10ad2E
                    local.get 1
                    i32.load8_u offset=31
                    br_if 1 (;@7;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1056072
                      i32.const 1056168
                      i32.eq
                      br_if 0 (;@9;)
                      i32.const 0
                      i32.load8_u offset=1056100
                      local.set 2
                      i32.const 1
                      local.set 0
                      i32.const 0
                      i32.const 1
                      i32.store8 offset=1056100
                      local.get 2
                      br_if 2 (;@7;)
                      i32.const 0
                      i32.const 1056168
                      i32.store offset=1056072
                      br 1 (;@8;)
                    end
                    i32.const 0
                    i32.load offset=1056076
                    i32.const 1
                    i32.add
                    local.tee 0
                    i32.eqz
                    br_if 5 (;@3;)
                  end
                  i32.const 0
                  local.get 0
                  i32.store offset=1056076
                  i32.const 0
                  i32.load offset=1056080
                  br_if 5 (;@2;)
                  i32.const 0
                  i32.const -1
                  i32.store offset=1056080
                  block  ;; label = @8
                    i32.const 0
                    i32.load8_u offset=1056096
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 1056084
                    call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$9flush_buf17h56a79c2de247dabfE
                    local.get 1
                    i32.load offset=4
                    local.set 2
                    block  ;; label = @9
                      local.get 1
                      i32.load8_u
                      local.tee 0
                      i32.const 4
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 3
                      i32.ne
                      br_if 1 (;@8;)
                    end
                    local.get 2
                    i32.load
                    local.tee 3
                    local.get 2
                    i32.const 4
                    i32.add
                    i32.load
                    local.tee 0
                    i32.load
                    call_indirect (type 1)
                    block  ;; label = @9
                      local.get 0
                      i32.load offset=4
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 3
                      local.get 4
                      local.get 0
                      i32.load offset=8
                      call $__rust_dealloc
                    end
                    local.get 2
                    i32.const 12
                    i32.const 4
                    call $__rust_dealloc
                  end
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1056088
                    local.tee 0
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.load offset=1056084
                    local.get 0
                    i32.const 1
                    call $__rust_dealloc
                  end
                  i32.const 0
                  i64.const 0
                  i64.store offset=1056088 align=4
                  i32.const 0
                  i32.const 1
                  i32.store offset=1056084
                  i32.const 0
                  i32.const 0
                  i32.load offset=1056080
                  i32.const 1
                  i32.add
                  i32.store offset=1056080
                  i32.const 0
                  i32.const 0
                  i32.load offset=1056076
                  i32.const -1
                  i32.add
                  local.tee 0
                  i32.store offset=1056076
                  i32.const 0
                  i32.const 0
                  i32.store8 offset=1056096
                  local.get 0
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 0
                  i32.store8 offset=1056100
                  i32.const 0
                  i32.const 0
                  i32.store offset=1056072
                end
                i32.const 0
                i32.const 3
                i32.store8 offset=1056070
              end
              local.get 1
              i32.const 32
              i32.add
              global.set $__stack_pointer
              return
            end
            local.get 1
            i32.const 12
            i32.add
            i64.const 0
            i64.store align=4
            local.get 1
            i32.const 1
            i32.store offset=4
            local.get 1
            i32.const 1052496
            i32.store
            local.get 1
            i32.const 1048880
            i32.store offset=8
            local.get 1
            i32.const 1049208
            call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
            unreachable
          end
          i32.const 1048736
          i32.const 43
          i32.const 1050872
          call $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E
          unreachable
        end
        i32.const 1050920
        i32.const 38
        i32.const 1050992
        call $_ZN4core6option13expect_failed17h8f72e66e0b3163c7E
        unreachable
      end
      i32.const 1050296
      i32.const 16
      local.get 1
      i32.const 1050312
      i32.const 1050356
      call $_ZN4core6result13unwrap_failed17hf48c8310675f070eE
      unreachable
    end
    local.get 1
    i32.const 12
    i32.add
    i64.const 0
    i64.store align=4
    local.get 1
    i32.const 1
    i32.store offset=4
    local.get 1
    i32.const 1052560
    i32.store
    local.get 1
    i32.const 1048880
    i32.store offset=8
    local.get 1
    i32.const 1049208
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN3std2rt19lang_start_internal17hfb027677af674b9fE (type 10) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i32.const 16
    i32.add
    i32.const 1049104
    i32.const 4
    call $_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17heacf9a7d517be95cE
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 5
            i32.load offset=16
            br_if 0 (;@4;)
            local.get 5
            i32.const 16
            i32.add
            i32.const 8
            i32.add
            i32.load
            local.set 6
            local.get 5
            i32.load offset=20
            local.set 7
            local.get 5
            i32.const 8
            i32.add
            i32.const 8
            i32.const 16
            call $_ZN5alloc4sync32arcinner_layout_for_value_layout17h789f4a8a8dd91a05E
            local.get 5
            i32.load offset=8
            local.set 8
            block  ;; label = @5
              block  ;; label = @6
                local.get 5
                i32.load offset=12
                local.tee 9
                br_if 0 (;@6;)
                local.get 8
                local.set 10
                br 1 (;@5;)
              end
              i32.const 0
              i32.load8_u offset=1056069
              drop
              local.get 9
              local.get 8
              call $__rust_alloc
              local.set 10
            end
            local.get 10
            i32.eqz
            br_if 1 (;@3;)
            local.get 10
            i64.const 4294967297
            i64.store align=4
            local.get 10
            local.get 6
            i32.store offset=20
            local.get 10
            i32.const 16
            i32.add
            local.get 7
            i32.store
            i32.const 0
            i64.load offset=1056144
            local.set 11
            loop  ;; label = @5
              local.get 11
              i64.const 1
              i64.add
              local.tee 12
              i64.eqz
              br_if 3 (;@2;)
              i32.const 0
              local.get 12
              i32.const 0
              i64.load offset=1056144
              local.tee 13
              local.get 13
              local.get 11
              i64.eq
              local.tee 8
              select
              i64.store offset=1056144
              local.get 13
              local.set 11
              local.get 8
              i32.eqz
              br_if 0 (;@5;)
            end
            local.get 10
            local.get 12
            i64.store offset=8
            local.get 5
            i32.load offset=16
            local.tee 8
            i32.eqz
            br_if 3 (;@1;)
            local.get 5
            i32.load offset=20
            local.tee 6
            i32.eqz
            br_if 3 (;@1;)
            local.get 8
            local.get 6
            i32.const 1
            call $__rust_dealloc
            br 3 (;@1;)
          end
          local.get 5
          local.get 5
          i32.const 16
          i32.add
          i32.store offset=36
          local.get 5
          i32.const 68
          i32.add
          i64.const 1
          i64.store align=4
          local.get 5
          i32.const 2
          i32.store offset=60
          local.get 5
          i32.const 1049168
          i32.store offset=56
          local.get 5
          i32.const 5
          i32.store offset=52
          local.get 5
          local.get 5
          i32.const 48
          i32.add
          i32.store offset=64
          local.get 5
          local.get 5
          i32.const 36
          i32.add
          i32.store offset=48
          local.get 5
          i32.const 40
          i32.add
          local.get 5
          i32.const 48
          i32.add
          local.get 5
          i32.const 56
          i32.add
          call $_ZN3std2io5Write9write_fmt17he644c9ec16dca596E
          local.get 5
          i32.load8_u offset=40
          local.get 5
          i32.load offset=44
          call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17h90619d11b6168bf9E
          call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
          unreachable
        end
        local.get 8
        local.get 9
        call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
        unreachable
      end
      call $_ZN3std6thread8ThreadId3new9exhausted17h35806fdda5b22e83E
      unreachable
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=1056160
      br_if 0 (;@1;)
      i32.const 0
      i32.const -1
      i32.store offset=1056160
      block  ;; label = @2
        i32.const 0
        i32.load offset=1056164
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.const 68
        i32.add
        i64.const 0
        i64.store align=4
        local.get 5
        i32.const 1
        i32.store offset=60
        local.get 5
        i32.const 1051320
        i32.store offset=56
        local.get 5
        local.get 5
        i32.const 48
        i32.add
        i32.store offset=64
        local.get 5
        i32.const 16
        i32.add
        local.get 5
        i32.const 48
        i32.add
        local.get 5
        i32.const 56
        i32.add
        call $_ZN3std2io5Write9write_fmt17he644c9ec16dca596E
        local.get 5
        i32.load8_u offset=16
        local.get 5
        i32.load offset=20
        call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17h90619d11b6168bf9E
        call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
        unreachable
      end
      i32.const 0
      local.get 10
      i32.store offset=1056164
      i32.const 0
      i32.const 0
      i32.store offset=1056160
      local.get 0
      local.get 1
      i32.const 20
      i32.add
      i32.load
      call_indirect (type 3)
      local.set 8
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=1056070
        i32.const 3
        i32.eq
        br_if 0 (;@2;)
        local.get 5
        i32.const 1
        i32.store8 offset=56
        local.get 5
        i32.const 56
        i32.add
        call $_ZN3std3sys4wasi4once4Once4call17hee18ac680eb799ccE
      end
      local.get 5
      i32.const 80
      i32.add
      global.set $__stack_pointer
      local.get 8
      return
    end
    i32.const 1050296
    i32.const 16
    local.get 5
    i32.const 48
    i32.add
    i32.const 1050312
    i32.const 1051328
    call $_ZN4core6result13unwrap_failed17hf48c8310675f070eE
    unreachable)
  (func $_ZN3std2io5Write9write_fmt17he644c9ec16dca596E (type 5) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 4
    i32.store8 offset=8
    local.get 3
    local.get 1
    i32.store offset=16
    local.get 3
    i32.const 24
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    local.get 2
    i64.load align=4
    i64.store offset=24
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const 8
        i32.add
        i32.const 1050780
        local.get 3
        i32.const 24
        i32.add
        call $_ZN4core3fmt5write17h80c8117f546444b5E
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.load8_u offset=8
          i32.const 4
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.const 1050744
          i32.store offset=4
          local.get 0
          i32.const 2
          i32.store8
          br 2 (;@1;)
        end
        local.get 0
        local.get 3
        i64.load offset=8
        i64.store align=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 4
      i32.store8
      local.get 3
      i32.load offset=12
      local.set 0
      block  ;; label = @2
        local.get 3
        i32.load8_u offset=8
        local.tee 2
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 0
      i32.load
      local.tee 1
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.tee 2
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 2
        i32.load offset=4
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 4
        local.get 2
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 0
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE (type 0)
    call $abort
    unreachable)
  (func $_ZN3std6thread8ThreadId3new9exhausted17h35806fdda5b22e83E (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 20
    i32.add
    i64.const 0
    i64.store align=4
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1049308
    i32.store offset=8
    local.get 0
    i32.const 1048880
    i32.store offset=16
    local.get 0
    i32.const 8
    i32.add
    i32.const 1049316
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN3std10sys_common11thread_info14current_thread17h83a3cdf5c5179a6aE (type 8) (result i32)
    (local i32 i32 i32 i32 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1056160
            br_if 0 (;@4;)
            i32.const 0
            i32.const -1
            i32.store offset=1056160
            block  ;; label = @5
              i32.const 0
              i32.load offset=1056164
              local.tee 1
              br_if 0 (;@5;)
              local.get 0
              i32.const 8
              i32.const 16
              call $_ZN5alloc4sync32arcinner_layout_for_value_layout17h789f4a8a8dd91a05E
              local.get 0
              i32.load
              local.set 2
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load offset=4
                  local.tee 3
                  br_if 0 (;@7;)
                  local.get 2
                  local.set 1
                  br 1 (;@6;)
                end
                i32.const 0
                i32.load8_u offset=1056069
                drop
                local.get 3
                local.get 2
                call $__rust_alloc
                local.set 1
              end
              local.get 1
              i32.eqz
              br_if 3 (;@2;)
              local.get 1
              i64.const 4294967297
              i64.store align=4
              local.get 1
              i32.const 16
              i32.add
              i32.const 0
              i32.store
              i32.const 0
              i64.load offset=1056144
              local.set 4
              loop  ;; label = @6
                local.get 4
                i64.const 1
                i64.add
                local.tee 5
                i64.eqz
                br_if 5 (;@1;)
                i32.const 0
                local.get 5
                i32.const 0
                i64.load offset=1056144
                local.tee 6
                local.get 6
                local.get 4
                i64.eq
                local.tee 2
                select
                i64.store offset=1056144
                local.get 6
                local.set 4
                local.get 2
                i32.eqz
                br_if 0 (;@6;)
              end
              i32.const 0
              local.get 1
              i32.store offset=1056164
              local.get 1
              local.get 5
              i64.store offset=8
            end
            local.get 1
            local.get 1
            i32.load
            local.tee 2
            i32.const 1
            i32.add
            i32.store
            local.get 2
            i32.const -1
            i32.gt_s
            br_if 1 (;@3;)
            unreachable
            unreachable
          end
          i32.const 1050296
          i32.const 16
          local.get 0
          i32.const 8
          i32.add
          i32.const 1050312
          i32.const 1051240
          call $_ZN4core6result13unwrap_failed17hf48c8310675f070eE
          unreachable
        end
        i32.const 0
        i32.const 0
        i32.load offset=1056160
        i32.const 1
        i32.add
        i32.store offset=1056160
        local.get 0
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 1
        return
      end
      local.get 2
      local.get 3
      call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
      unreachable
    end
    call $_ZN3std6thread8ThreadId3new9exhausted17h35806fdda5b22e83E
    unreachable)
  (func $_ZN3std3env11current_dir17hce9f0b0936a648a9E (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    i32.load8_u offset=1056069
    drop
    i32.const 512
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 512
            i32.const 1
            call $__rust_alloc
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 512
            i32.store offset=4
            local.get 1
            local.get 3
            i32.store
            local.get 3
            i32.const 512
            call $getcwd
            br_if 1 (;@3;)
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1056676
                  local.tee 2
                  i32.const 68
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 512
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 0
                i64.const 0
                i64.store align=4
                local.get 0
                i32.const 8
                i32.add
                local.get 2
                i32.store
                i32.const 512
                local.set 2
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 1
                local.get 2
                i32.store offset=8
                local.get 1
                local.get 2
                i32.const 1
                call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
                local.get 1
                i32.load
                local.tee 3
                local.get 1
                i32.load offset=4
                local.tee 2
                call $getcwd
                br_if 3 (;@3;)
                i32.const 0
                i32.load offset=1056676
                local.tee 4
                i32.const 68
                i32.eq
                br_if 0 (;@6;)
              end
              local.get 0
              i64.const 0
              i64.store align=4
              local.get 0
              i32.const 8
              i32.add
              local.get 4
              i32.store
              local.get 2
              i32.eqz
              br_if 3 (;@2;)
            end
            local.get 3
            local.get 2
            i32.const 1
            call $__rust_dealloc
            br 2 (;@2;)
          end
          i32.const 1
          i32.const 512
          call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
          unreachable
        end
        local.get 1
        local.get 3
        call $_ZN4core3ffi5c_str4CStr8from_ptr9strlen_rt17he94c37781a91fb2eE
        local.tee 4
        i32.store offset=8
        block  ;; label = @3
          local.get 2
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              i32.const 1
              local.set 5
              local.get 3
              local.get 2
              i32.const 1
              call $__rust_dealloc
              br 1 (;@4;)
            end
            local.get 3
            local.get 2
            i32.const 1
            local.get 4
            call $__rust_realloc
            local.tee 5
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 1
          local.get 4
          i32.store offset=4
          local.get 1
          local.get 5
          i32.store
        end
        local.get 0
        local.get 1
        i64.load
        i64.store align=4
        local.get 0
        i32.const 8
        i32.add
        local.get 1
        i32.const 8
        i32.add
        i32.load
        i32.store
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1
    local.get 4
    call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
    unreachable)
  (func $_ZN3std3env7_var_os17h4c5665f691f15443E (type 5) (param i32 i32 i32)
    (local i32 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 416
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 383
        i32.gt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 16
        i32.add
        local.get 1
        local.get 2
        call $memcpy
        drop
        local.get 3
        i32.const 16
        i32.add
        local.get 2
        i32.add
        i32.const 0
        i32.store8
        local.get 3
        i32.const 400
        i32.add
        local.get 3
        i32.const 16
        i32.add
        local.get 2
        i32.const 1
        i32.add
        call $_ZN4core3ffi5c_str4CStr19from_bytes_with_nul17h0f81087cbdb306deE
        block  ;; label = @3
          local.get 3
          i32.load offset=400
          br_if 0 (;@3;)
          i32.const 4
          local.set 1
          local.get 3
          i32.load offset=404
          call $getenv
          local.set 2
          local.get 3
          i32.const 4
          i32.store8 offset=8
          local.get 3
          local.get 2
          i32.store offset=12
          br 2 (;@1;)
        end
        local.get 3
        i32.const 0
        i64.load offset=1051064
        local.tee 4
        i64.store offset=8
        local.get 4
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        local.set 2
        local.get 4
        i32.wrap_i64
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      call $_ZN3std3sys6common14small_c_string24run_with_cstr_allocating17h9f8ce116bb1abf27E
      local.get 3
      i32.load offset=12
      local.set 2
      local.get 3
      i32.load8_u offset=8
      local.set 1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 255
        i32.and
        local.tee 1
        i32.const 4
        i32.eq
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 1
          i32.const 3
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          i32.load
          local.tee 5
          local.get 2
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            local.get 6
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 2
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 0
        i32.const 0
        i32.store
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                call $_ZN4core3ffi5c_str4CStr8from_ptr9strlen_rt17he94c37781a91fb2eE
                local.tee 1
                br_if 0 (;@6;)
                i32.const 1
                local.set 5
                br 1 (;@5;)
              end
              local.get 1
              i32.const -1
              i32.gt_s
              local.tee 6
              i32.eqz
              br_if 1 (;@4;)
              i32.const 0
              i32.load8_u offset=1056069
              drop
              local.get 1
              local.get 6
              call $__rust_alloc
              local.tee 5
              i32.eqz
              br_if 2 (;@3;)
            end
            local.get 5
            local.get 2
            local.get 1
            call $memcpy
            local.set 2
            local.get 0
            local.get 1
            i32.store offset=8
            local.get 0
            local.get 1
            i32.store offset=4
            local.get 0
            local.get 2
            i32.store
            br 3 (;@1;)
          end
          call $_ZN5alloc7raw_vec17capacity_overflow17ha2fa7309cb777b97E
          unreachable
        end
        local.get 6
        local.get 1
        call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
        unreachable
      end
      local.get 0
      i32.const 0
      i32.store
    end
    local.get 3
    i32.const 416
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std3sys6common14small_c_string24run_with_cstr_allocating17h9f8ce116bb1abf27E (type 5) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    local.get 2
    call $_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17heacf9a7d517be95cE
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load
        local.tee 2
        br_if 0 (;@2;)
        local.get 3
        i32.const 8
        i32.add
        i32.load
        local.set 2
        local.get 3
        i32.load offset=4
        local.tee 1
        call $getenv
        local.set 4
        local.get 0
        i32.const 4
        i32.store8
        local.get 0
        local.get 4
        i32.store offset=4
        local.get 1
        i32.const 0
        i32.store8
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 2
        i32.const 1
        call $__rust_dealloc
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i64.load offset=1051064
      i64.store align=4
      local.get 3
      i32.load offset=4
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17h2e67c29fe94fefb3E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load8_u
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;) 0 (;@5;)
            end
            local.get 2
            local.get 0
            i32.load offset=4
            local.tee 0
            i32.store offset=4
            local.get 2
            i32.const 8
            i32.add
            local.get 0
            call $_ZN3std3sys4wasi2os12error_string17h72b4f12929f7f51dE
            local.get 2
            i32.const 40
            i32.add
            i32.const 12
            i32.add
            i64.const 2
            i64.store align=4
            local.get 2
            i32.const 24
            i32.add
            i32.const 12
            i32.add
            i32.const 6
            i32.store
            local.get 2
            i32.const 3
            i32.store offset=44
            local.get 2
            i32.const 1050272
            i32.store offset=40
            local.get 2
            i32.const 7
            i32.store offset=28
            local.get 2
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=48
            local.get 2
            local.get 2
            i32.const 4
            i32.add
            i32.store offset=32
            local.get 2
            local.get 2
            i32.const 8
            i32.add
            i32.store offset=24
            local.get 1
            local.get 2
            i32.const 40
            i32.add
            call $_ZN4core3fmt9Formatter9write_fmt17h8b1fb458f4c75394E
            local.set 0
            local.get 2
            i32.load offset=12
            local.tee 1
            i32.eqz
            br_if 3 (;@1;)
            local.get 2
            i32.load offset=8
            local.get 1
            i32.const 1
            call $__rust_dealloc
            br 3 (;@1;)
          end
          local.get 0
          i32.load8_u offset=1
          local.set 0
          local.get 2
          i32.const 52
          i32.add
          i64.const 1
          i64.store align=4
          local.get 2
          i32.const 1
          i32.store offset=44
          local.get 2
          i32.const 1049436
          i32.store offset=40
          local.get 2
          i32.const 8
          i32.store offset=12
          local.get 2
          local.get 0
          i32.const 2
          i32.shl
          local.tee 0
          i32.const 1052568
          i32.add
          i32.load
          i32.store offset=28
          local.get 2
          local.get 0
          i32.const 1052732
          i32.add
          i32.load
          i32.store offset=24
          local.get 2
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=48
          local.get 2
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=8
          local.get 1
          local.get 2
          i32.const 40
          i32.add
          call $_ZN4core3fmt9Formatter9write_fmt17h8b1fb458f4c75394E
          local.set 0
          br 2 (;@1;)
        end
        local.get 0
        i32.load offset=4
        local.tee 0
        i32.load
        local.get 0
        i32.load offset=4
        local.get 1
        call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h8ca672917709e7afE
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=4
      local.tee 0
      i32.load
      local.get 1
      local.get 0
      i32.load offset=4
      i32.load offset=16
      call_indirect (type 4)
      local.set 0
    end
    local.get 2
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN3std3sys4wasi17decode_error_kind17hc2ea97d6c0117270E (type 3) (param i32) (result i32)
    (local i32)
    i32.const 40
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.gt_u
      br_if 0 (;@1;)
      i32.const 2
      local.set 1
      i32.const 1052418
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 3
      local.set 1
      i32.const 1052420
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 1
      local.set 1
      i32.const 1052422
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 1052424
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 11
      local.set 1
      i32.const 1052426
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 7
      local.set 1
      i32.const 1052428
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 6
      local.set 1
      i32.const 1052430
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 9
      local.set 1
      i32.const 1052432
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 8
      local.set 1
      i32.const 1052434
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      i32.const 1052436
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 35
      local.set 1
      i32.const 1052438
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 20
      local.set 1
      i32.const 1052440
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 22
      local.set 1
      i32.const 1052442
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 12
      local.set 1
      i32.const 1052444
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 13
      local.set 1
      i32.const 1052446
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 36
      local.set 1
      i32.const 1052448
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const 38
      i32.const 40
      i32.const 1052450
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i32.const 65535
      i32.and
      local.get 0
      i32.eq
      select
      local.set 1
    end
    local.get 1)
  (func $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$9flush_buf17h56a79c2de247dabfE (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=8
          local.tee 3
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.store8
          br 1 (;@2;)
        end
        local.get 1
        i32.load
        local.set 4
        i32.const 0
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              local.get 2
              local.get 3
              local.get 5
              i32.sub
              local.tee 6
              i32.store offset=12
              local.get 2
              local.get 4
              local.get 5
              i32.add
              local.tee 7
              i32.store offset=8
              local.get 2
              i32.const 16
              i32.add
              i32.const 1
              local.get 2
              i32.const 8
              i32.add
              i32.const 1
              call $_ZN4wasi13lib_generated8fd_write17h644a6b3622a5007dE
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 2
                        i32.load16_u offset=16
                        br_if 0 (;@10;)
                        local.get 2
                        i32.load offset=20
                        local.set 8
                        local.get 1
                        i32.const 0
                        i32.store8 offset=12
                        br 1 (;@9;)
                      end
                      local.get 2
                      local.get 2
                      i32.load16_u offset=18
                      i32.store16 offset=30
                      local.get 2
                      i32.const 30
                      i32.add
                      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
                      local.set 9
                      i32.const 1052416
                      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
                      local.set 10
                      local.get 1
                      i32.const 0
                      i32.store8 offset=12
                      local.get 6
                      local.set 8
                      local.get 9
                      i32.const 65535
                      i32.and
                      local.tee 9
                      local.get 10
                      i32.const 65535
                      i32.and
                      i32.ne
                      br_if 1 (;@8;)
                    end
                    local.get 8
                    br_if 1 (;@7;)
                    local.get 0
                    i32.const 1049424
                    i32.store offset=4
                    local.get 0
                    i32.const 2
                    i32.store8
                    br 4 (;@4;)
                  end
                  local.get 9
                  call $_ZN3std3sys4wasi17decode_error_kind17hc2ea97d6c0117270E
                  i32.const 255
                  i32.and
                  i32.const 35
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 0
                  local.get 9
                  i32.store offset=4
                  local.get 0
                  i32.const 0
                  i32.store
                  br 3 (;@4;)
                end
                local.get 8
                local.get 5
                i32.add
                local.set 5
              end
              local.get 3
              local.get 5
              i32.le_u
              br_if 2 (;@3;)
              br 0 (;@5;)
            end
          end
          local.get 5
          i32.eqz
          br_if 1 (;@2;)
          block  ;; label = @4
            local.get 3
            local.get 5
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 0
            i32.store offset=8
            local.get 3
            local.get 5
            i32.eq
            br_if 2 (;@2;)
            local.get 4
            local.get 7
            local.get 6
            call $memmove
            drop
            local.get 1
            local.get 6
            i32.store offset=8
            br 2 (;@2;)
          end
          local.get 5
          local.get 3
          i32.const 1049048
          call $_ZN4core5slice5index24slice_end_index_len_fail17h392bb1693dec020aE
          unreachable
        end
        local.get 0
        i32.const 4
        i32.store8
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 5
        i32.lt_u
        br_if 1 (;@1;)
        local.get 1
        i32.const 0
        i32.store offset=8
        local.get 3
        local.get 5
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        i32.load
        local.tee 8
        local.get 8
        local.get 5
        i32.add
        local.get 3
        local.get 5
        i32.sub
        local.tee 5
        call $memmove
        drop
        local.get 1
        local.get 5
        i32.store offset=8
      end
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 5
    local.get 3
    i32.const 1049048
    call $_ZN4core5slice5index24slice_end_index_len_fail17h392bb1693dec020aE
    unreachable)
  (func $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17hc33b3ad17c6e47b7E (type 9) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.tee 5
        local.get 1
        i32.load offset=8
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 8
        i32.add
        local.get 1
        call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$9flush_buf17h56a79c2de247dabfE
        block  ;; label = @3
          local.get 4
          i32.load8_u offset=8
          local.tee 5
          i32.const 4
          i32.ne
          br_if 0 (;@3;)
          local.get 1
          i32.load offset=4
          local.set 5
          br 1 (;@2;)
        end
        local.get 0
        local.get 4
        i32.load offset=9 align=1
        i32.store offset=1 align=1
        local.get 0
        i32.const 4
        i32.add
        local.get 4
        i32.load offset=12 align=1
        i32.store align=1
        local.get 0
        local.get 5
        i32.store8
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 5
        local.get 3
        i32.le_u
        br_if 0 (;@2;)
        local.get 1
        i32.load
        local.get 1
        i32.load offset=8
        local.tee 5
        i32.add
        local.get 2
        local.get 3
        call $memcpy
        drop
        local.get 0
        i32.const 4
        i32.store8
        local.get 1
        local.get 5
        local.get 3
        i32.add
        i32.store offset=8
        br 1 (;@1;)
      end
      local.get 1
      i32.const 1
      i32.store8 offset=12
      local.get 4
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      local.get 3
      call $_ZN60_$LT$std..io..stdio..StdoutRaw$u20$as$u20$std..io..Write$GT$9write_all17hff45d126cb4b60b3E
      local.get 1
      i32.const 0
      i32.store8 offset=12
      local.get 0
      local.get 4
      i64.load offset=8
      i64.store align=4
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN60_$LT$std..io..stdio..StdoutRaw$u20$as$u20$std..io..Write$GT$9write_all17hff45d126cb4b60b3E (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    i32.const 4
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        loop  ;; label = @3
          local.get 4
          local.get 3
          i32.store offset=12
          local.get 4
          local.get 2
          i32.store offset=8
          local.get 4
          i32.const 16
          i32.add
          i32.const 1
          local.get 4
          i32.const 8
          i32.add
          i32.const 1
          call $_ZN4wasi13lib_generated8fd_write17h644a6b3622a5007dE
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.load16_u offset=16
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 4
                  i32.load offset=20
                  local.tee 6
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  local.get 6
                  i32.lt_u
                  br_if 2 (;@5;)
                  local.get 2
                  local.get 6
                  i32.add
                  local.set 2
                  local.get 3
                  local.get 6
                  i32.sub
                  local.set 3
                  br 3 (;@4;)
                end
                i32.const 1052416
                call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
                drop
                i32.const 1050676
                local.set 6
                i32.const 2
                local.set 5
                br 4 (;@2;)
              end
              local.get 4
              local.get 4
              i32.load16_u offset=18
              i32.store16 offset=30
              local.get 4
              i32.const 30
              i32.add
              call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
              local.tee 7
              i32.const 65535
              i32.and
              local.tee 6
              call $_ZN3std3sys4wasi17decode_error_kind17hc2ea97d6c0117270E
              i32.const 255
              i32.and
              i32.const 35
              i32.eq
              br_if 1 (;@4;)
              i32.const 0
              local.set 5
              local.get 7
              i32.const 65535
              i32.and
              i32.const 1052416
              call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
              i32.const 65535
              i32.and
              i32.ne
              br_if 3 (;@2;)
              local.get 0
              i32.const 4
              i32.store8
              br 4 (;@1;)
            end
            local.get 6
            local.get 3
            i32.const 1050688
            call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
            unreachable
          end
          local.get 3
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 6
      i32.store offset=4
      local.get 0
      local.get 5
      i32.store
    end
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std3sys4wasi2os12error_string17h72b4f12929f7f51dE (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 1056
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 2
          i32.const 0
          i32.const 1024
          call $memset
          local.tee 2
          i32.const 1024
          call $strerror_r
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 2
          i32.const 1024
          i32.add
          local.get 2
          local.get 2
          call $_ZN4core3ffi5c_str4CStr8from_ptr9strlen_rt17he94c37781a91fb2eE
          call $_ZN4core3str8converts9from_utf817h0c702c416c8bc7f4E
          block  ;; label = @4
            local.get 2
            i32.load offset=1024
            br_if 0 (;@4;)
            local.get 2
            i32.load offset=1028
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.const 1032
                i32.add
                i32.load
                local.tee 1
                br_if 0 (;@6;)
                i32.const 1
                local.set 4
                br 1 (;@5;)
              end
              local.get 1
              i32.const -1
              i32.gt_s
              local.tee 5
              i32.eqz
              br_if 3 (;@2;)
              i32.const 0
              i32.load8_u offset=1056069
              drop
              local.get 1
              local.get 5
              call $__rust_alloc
              local.tee 4
              i32.eqz
              br_if 4 (;@1;)
            end
            local.get 4
            local.get 3
            local.get 1
            call $memcpy
            local.set 3
            local.get 0
            local.get 1
            i32.store offset=8
            local.get 0
            local.get 1
            i32.store offset=4
            local.get 0
            local.get 3
            i32.store
            local.get 2
            i32.const 1056
            i32.add
            global.set $__stack_pointer
            return
          end
          local.get 2
          local.get 2
          i64.load offset=1028 align=4
          i64.store offset=1048
          i32.const 1049346
          i32.const 43
          local.get 2
          i32.const 1048
          i32.add
          i32.const 1052308
          i32.const 1052356
          call $_ZN4core6result13unwrap_failed17hf48c8310675f070eE
          unreachable
        end
        local.get 2
        i32.const 1036
        i32.add
        i64.const 0
        i64.store align=4
        local.get 2
        i32.const 1
        i32.store offset=1028
        local.get 2
        i32.const 1052392
        i32.store offset=1024
        local.get 2
        i32.const 1048880
        i32.store offset=1032
        local.get 2
        i32.const 1024
        i32.add
        i32.const 1052400
        call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
        unreachable
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17ha2fa7309cb777b97E
      unreachable
    end
    local.get 5
    local.get 1
    call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
    unreachable)
  (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5write17hdf498821c4941d50E (type 9) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.get 1
      i32.load offset=8
      local.tee 4
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 4
      local.get 3
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
      local.get 1
      i32.load offset=8
      local.set 4
    end
    local.get 1
    i32.load
    local.get 4
    i32.add
    local.get 2
    local.get 3
    call $memcpy
    drop
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 4
    local.get 3
    i32.add
    i32.store offset=8
    local.get 0
    i32.const 4
    i32.store8)
  (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$14write_vectored17h48e268dc6dc740c0E (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.const 3
      i32.and
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 4
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          i32.const 0
          local.set 6
          br 1 (;@2;)
        end
        local.get 2
        i32.const 20
        i32.add
        local.set 7
        local.get 3
        i32.const -4
        i32.and
        local.set 8
        i32.const 0
        local.set 4
        i32.const 0
        local.set 6
        loop  ;; label = @3
          local.get 7
          i32.const 8
          i32.add
          i32.load
          local.get 7
          i32.load
          local.get 7
          i32.const -8
          i32.add
          i32.load
          local.get 7
          i32.const -16
          i32.add
          i32.load
          local.get 4
          i32.add
          i32.add
          i32.add
          i32.add
          local.set 4
          local.get 7
          i32.const 32
          i32.add
          local.set 7
          local.get 8
          local.get 6
          i32.const 4
          i32.add
          local.tee 6
          i32.ne
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const 3
        i32.shl
        local.get 2
        i32.add
        i32.const 4
        i32.add
        local.set 7
        loop  ;; label = @3
          local.get 7
          i32.load
          local.get 4
          i32.add
          local.set 4
          local.get 7
          i32.const 8
          i32.add
          local.set 7
          local.get 5
          i32.const -1
          i32.add
          local.tee 5
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.get 1
        i32.load offset=8
        local.tee 7
        i32.sub
        local.get 4
        i32.ge_u
        br_if 0 (;@2;)
        local.get 1
        local.get 7
        local.get 4
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
      end
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 3
      i32.const 3
      i32.shl
      i32.add
      local.set 8
      local.get 1
      i32.load offset=8
      local.set 7
      loop  ;; label = @2
        local.get 2
        i32.load
        local.set 6
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.get 7
          i32.sub
          local.get 2
          i32.const 4
          i32.add
          i32.load
          local.tee 5
          i32.ge_u
          br_if 0 (;@3;)
          local.get 1
          local.get 7
          local.get 5
          call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
          local.get 1
          i32.load offset=8
          local.set 7
        end
        local.get 1
        i32.load
        local.get 7
        i32.add
        local.get 6
        local.get 5
        call $memcpy
        drop
        local.get 1
        local.get 7
        local.get 5
        i32.add
        local.tee 7
        i32.store offset=8
        local.get 2
        i32.const 8
        i32.add
        local.tee 2
        local.get 8
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
    i32.const 4
    i32.store8
    local.get 0
    local.get 4
    i32.store offset=4)
  (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$17is_write_vectored17h985944220e07e3e0E (type 3) (param i32) (result i32)
    i32.const 1)
  (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$9write_all17h073245eeb5f3a97dE (type 9) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.get 1
      i32.load offset=8
      local.tee 4
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 4
      local.get 3
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
      local.get 1
      i32.load offset=8
      local.set 4
    end
    local.get 1
    i32.load
    local.get 4
    i32.add
    local.get 2
    local.get 3
    call $memcpy
    drop
    local.get 0
    i32.const 4
    i32.store8
    local.get 1
    local.get 4
    local.get 3
    i32.add
    i32.store offset=8)
  (func $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5flush17h6e162bd2eab0ec7cE (type 2) (param i32 i32)
    local.get 0
    i32.const 4
    i32.store8)
  (func $_ZN3std2io5Write18write_all_vectored17h496869c8cdf17aadE (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 4
          i32.add
          local.set 5
          local.get 3
          i32.const 3
          i32.shl
          local.set 6
          local.get 3
          i32.const -1
          i32.add
          i32.const 536870911
          i32.and
          i32.const 1
          i32.add
          local.set 7
          i32.const 0
          local.set 8
          block  ;; label = @4
            loop  ;; label = @5
              local.get 5
              i32.load
              br_if 1 (;@4;)
              local.get 5
              i32.const 8
              i32.add
              local.set 5
              local.get 8
              i32.const 1
              i32.add
              local.set 8
              local.get 6
              i32.const -8
              i32.add
              local.tee 6
              br_if 0 (;@5;)
            end
            local.get 7
            local.set 8
          end
          block  ;; label = @4
            local.get 8
            local.get 3
            i32.le_u
            br_if 0 (;@4;)
            local.get 8
            local.get 3
            i32.const 1050476
            call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
            unreachable
          end
          local.get 3
          local.get 8
          i32.sub
          local.tee 9
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 8
          i32.const 3
          i32.shl
          i32.add
          local.set 10
          loop  ;; label = @4
            local.get 4
            i32.const 8
            i32.add
            i32.const 2
            local.get 10
            local.get 9
            call $_ZN4wasi13lib_generated8fd_write17h644a6b3622a5007dE
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.load16_u offset=8
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 4
                    i32.load offset=12
                    local.tee 7
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 1050676
                    i32.store offset=4
                    local.get 0
                    i32.const 2
                    i32.store8
                    br 7 (;@1;)
                  end
                  local.get 10
                  i32.const 4
                  i32.add
                  local.set 5
                  local.get 9
                  i32.const 3
                  i32.shl
                  local.set 2
                  local.get 9
                  i32.const -1
                  i32.add
                  i32.const 536870911
                  i32.and
                  i32.const 1
                  i32.add
                  local.set 11
                  i32.const 0
                  local.set 8
                  i32.const 0
                  local.set 6
                  loop  ;; label = @8
                    local.get 5
                    i32.load
                    local.get 6
                    i32.add
                    local.tee 3
                    local.get 7
                    i32.gt_u
                    br_if 2 (;@6;)
                    local.get 5
                    i32.const 8
                    i32.add
                    local.set 5
                    local.get 8
                    i32.const 1
                    i32.add
                    local.set 8
                    local.get 3
                    local.set 6
                    local.get 2
                    i32.const -8
                    i32.add
                    local.tee 2
                    br_if 0 (;@8;)
                  end
                  local.get 3
                  local.set 6
                  local.get 11
                  local.set 8
                  br 1 (;@6;)
                end
                local.get 4
                local.get 4
                i32.load16_u offset=10
                i32.store16 offset=6
                local.get 4
                i32.const 6
                i32.add
                call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
                i32.const 65535
                i32.and
                local.tee 5
                call $_ZN3std3sys4wasi17decode_error_kind17hc2ea97d6c0117270E
                i32.const 255
                i32.and
                i32.const 35
                i32.eq
                br_if 1 (;@5;)
                local.get 0
                local.get 5
                i32.store offset=4
                local.get 0
                i32.const 0
                i32.store
                br 5 (;@1;)
              end
              local.get 9
              local.get 8
              i32.lt_u
              br_if 3 (;@2;)
              local.get 9
              local.get 8
              i32.sub
              local.set 3
              local.get 10
              local.get 8
              i32.const 3
              i32.shl
              local.tee 2
              i32.add
              local.set 5
              block  ;; label = @6
                local.get 9
                local.get 8
                i32.ne
                br_if 0 (;@6;)
                local.get 5
                local.set 10
                local.get 3
                local.set 9
                local.get 7
                local.get 6
                i32.eq
                br_if 1 (;@5;)
                local.get 4
                i32.const 20
                i32.add
                i64.const 0
                i64.store align=4
                local.get 4
                i32.const 1
                i32.store offset=12
                local.get 4
                i32.const 1050532
                i32.store offset=8
                local.get 4
                i32.const 1048880
                i32.store offset=16
                local.get 4
                i32.const 8
                i32.add
                i32.const 1050540
                call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
                unreachable
              end
              block  ;; label = @6
                local.get 10
                local.get 2
                i32.add
                local.tee 2
                i32.load offset=4
                local.tee 9
                local.get 7
                local.get 6
                i32.sub
                local.tee 8
                i32.lt_u
                br_if 0 (;@6;)
                local.get 2
                i32.const 4
                i32.add
                local.get 9
                local.get 8
                i32.sub
                i32.store
                local.get 5
                local.get 5
                i32.load
                local.get 8
                i32.add
                i32.store
                local.get 5
                local.set 10
                local.get 3
                local.set 9
                br 1 (;@5;)
              end
              local.get 4
              i32.const 20
              i32.add
              i64.const 0
              i64.store align=4
              local.get 4
              i32.const 1
              i32.store offset=12
              local.get 4
              i32.const 1050592
              i32.store offset=8
              local.get 4
              i32.const 1048880
              i32.store offset=16
              local.get 4
              i32.const 8
              i32.add
              i32.const 1050632
              call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
              unreachable
            end
            local.get 9
            br_if 0 (;@4;)
          end
        end
        local.get 0
        i32.const 4
        i32.store8
        br 1 (;@1;)
      end
      local.get 8
      local.get 9
      i32.const 1050476
      call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
      unreachable
    end
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17hc3e9589307757b9dE (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1056104
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 1056072
      i32.store
      local.get 0
      local.get 0
      i32.const 8
      i32.add
      i32.store offset=4
      local.get 0
      call $_ZN3std3sys4wasi4once4Once4call17hbd51488539e7eb57E
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN61_$LT$$RF$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17hdc1175348761bc2dE (type 5) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            i32.load
            local.tee 1
            i32.load
            i32.const 1056168
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.load8_u offset=28
            local.set 4
            local.get 1
            i32.const 1
            i32.store8 offset=28
            local.get 3
            local.get 4
            i32.store8 offset=8
            local.get 4
            br_if 2 (;@2;)
            local.get 1
            i32.const 1
            i32.store offset=4
            local.get 1
            i32.const 1056168
            i32.store
            br 1 (;@3;)
          end
          local.get 1
          i32.load offset=4
          i32.const 1
          i32.add
          local.tee 4
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          local.get 4
          i32.store offset=4
        end
        local.get 3
        local.get 1
        i32.store offset=4
        local.get 3
        i32.const 24
        i32.add
        i32.const 16
        i32.add
        local.get 2
        i32.const 16
        i32.add
        i64.load align=4
        i64.store
        local.get 3
        i32.const 24
        i32.add
        i32.const 8
        i32.add
        local.get 2
        i32.const 8
        i32.add
        i64.load align=4
        i64.store
        local.get 3
        local.get 2
        i64.load align=4
        i64.store offset=24
        local.get 3
        i32.const 4
        i32.store8 offset=8
        local.get 3
        local.get 3
        i32.const 4
        i32.add
        i32.store offset=16
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 8
            i32.add
            i32.const 1050756
            local.get 3
            i32.const 24
            i32.add
            call $_ZN4core3fmt5write17h80c8117f546444b5E
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.load8_u offset=8
              i32.const 4
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              i32.const 1050744
              i32.store offset=4
              local.get 0
              i32.const 2
              i32.store8
              br 2 (;@3;)
            end
            local.get 0
            local.get 3
            i64.load offset=8
            i64.store align=4
            br 1 (;@3;)
          end
          local.get 0
          i32.const 4
          i32.store8
          local.get 3
          i32.load offset=12
          local.set 2
          block  ;; label = @4
            local.get 3
            i32.load8_u offset=8
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 2
          i32.load
          local.tee 0
          local.get 2
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 2
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 3
        i32.load offset=4
        local.tee 1
        local.get 1
        i32.load offset=4
        i32.const -1
        i32.add
        local.tee 2
        i32.store offset=4
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store8 offset=28
          local.get 1
          i32.const 0
          i32.store
        end
        local.get 3
        i32.const 48
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 3
      i64.const 0
      i64.store offset=36 align=4
      local.get 3
      i32.const 1048880
      i32.store offset=32
      local.get 3
      i32.const 1
      i32.store offset=28
      local.get 3
      i32.const 1052172
      i32.store offset=24
      local.get 3
      i32.const 8
      i32.add
      local.get 3
      i32.const 24
      i32.add
      call $_ZN4core9panicking13assert_failed17h88aeb5e475543e29E
      unreachable
    end
    i32.const 1050920
    i32.const 38
    i32.const 1050992
    call $_ZN4core6option13expect_failed17h8f72e66e0b3163c7E
    unreachable)
  (func $_ZN3std2io5stdio31print_to_buffer_if_capture_used17he94bdc852c298032E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=1056071
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=1056172
          br_if 0 (;@3;)
          i32.const 0
          i32.const 1
          i32.store8 offset=1056172
          i32.const 0
          i32.const 0
          i32.store offset=1056176
          br 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        i32.load offset=1056176
        local.set 3
        i32.const 0
        i32.const 0
        i32.store offset=1056176
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load8_u offset=8
        local.set 2
        i32.const 1
        local.set 4
        local.get 3
        i32.const 1
        i32.store8 offset=8
        local.get 1
        local.get 2
        i32.store8 offset=7
        local.get 2
        br_if 1 (;@1;)
        block  ;; label = @3
          i32.const 0
          i32.load offset=1056136
          i32.const 2147483647
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          call $_ZN3std9panicking11panic_count17is_zero_slow_path17h88f026da919a15b3E
          local.set 4
        end
        local.get 1
        i32.const 4
        i32.store8 offset=8
        local.get 1
        local.get 3
        i32.const 12
        i32.add
        i32.store offset=16
        local.get 1
        i32.const 8
        i32.add
        i32.const 1050704
        local.get 0
        call $_ZN4core3fmt5write17h80c8117f546444b5E
        local.set 0
        local.get 1
        i32.load8_u offset=8
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.const 4
            i32.eq
            br_if 1 (;@3;)
            local.get 1
            i32.load offset=12
            local.set 0
            block  ;; label = @5
              local.get 1
              i32.load8_u offset=8
              local.tee 2
              i32.const 4
              i32.gt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const 3
              i32.ne
              br_if 2 (;@3;)
            end
            local.get 0
            i32.load
            local.tee 5
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.tee 2
            i32.load
            call_indirect (type 1)
            block  ;; label = @5
              local.get 2
              i32.load offset=4
              local.tee 6
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              local.get 6
              local.get 2
              i32.load offset=8
              call $__rust_dealloc
            end
            local.get 0
            i32.const 12
            i32.const 4
            call $__rust_dealloc
            br 1 (;@3;)
          end
          local.get 1
          i32.load offset=12
          local.set 0
          block  ;; label = @4
            local.get 2
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 0
          i32.load
          local.tee 5
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 2
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            local.tee 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            local.get 6
            local.get 2
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        block  ;; label = @3
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1056136
          i32.const 2147483647
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          call $_ZN3std9panicking11panic_count17is_zero_slow_path17h88f026da919a15b3E
          br_if 0 (;@3;)
          local.get 3
          i32.const 1
          i32.store8 offset=9
        end
        local.get 3
        i32.const 0
        i32.store8 offset=8
        i32.const 0
        i32.load offset=1056176
        local.set 0
        i32.const 0
        local.get 3
        i32.store offset=1056176
        block  ;; label = @3
          local.get 0
          br_if 0 (;@3;)
          i32.const 1
          local.set 2
          br 1 (;@2;)
        end
        local.get 0
        local.get 0
        i32.load
        local.tee 3
        i32.const -1
        i32.add
        i32.store
        i32.const 1
        local.set 2
        local.get 3
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 0
        call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h86e87e195cb55bd3E
      end
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 2
      return
    end
    local.get 1
    i64.const 0
    i64.store offset=20 align=4
    local.get 1
    i32.const 1048880
    i32.store offset=16
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1052172
    i32.store offset=8
    local.get 1
    i32.const 7
    i32.add
    local.get 1
    i32.const 8
    i32.add
    call $_ZN4core9panicking13assert_failed17h88aeb5e475543e29E
    unreachable)
  (func $_ZN3std2io5stdio6_print17h4f358bc8fdb0e8ecE (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 6
    i32.store offset=12
    local.get 1
    i32.const 1050444
    i32.store offset=8
    local.get 1
    i32.const 56
    i32.add
    i32.const 16
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 1
    i32.const 56
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 1
    local.get 0
    i64.load align=4
    i64.store offset=56
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 56
        i32.add
        call $_ZN3std2io5stdio31print_to_buffer_if_capture_used17he94bdc852c298032E
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=1056104
          i32.const 3
          i32.eq
          br_if 0 (;@3;)
          call $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17hc3e9589307757b9dE
        end
        local.get 1
        i32.const 1056072
        i32.store offset=28
        local.get 1
        i32.const 56
        i32.add
        i32.const 16
        i32.add
        local.get 0
        i32.const 16
        i32.add
        i64.load align=4
        i64.store
        local.get 1
        i32.const 56
        i32.add
        i32.const 8
        i32.add
        local.get 0
        i32.const 8
        i32.add
        i64.load align=4
        i64.store
        local.get 1
        local.get 0
        i64.load align=4
        i64.store offset=56
        local.get 1
        local.get 1
        i32.const 28
        i32.add
        i32.store offset=40
        local.get 1
        i32.const 16
        i32.add
        local.get 1
        i32.const 40
        i32.add
        local.get 1
        i32.const 56
        i32.add
        call $_ZN61_$LT$$RF$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17hdc1175348761bc2dE
        local.get 1
        i32.load8_u offset=16
        i32.const 4
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 80
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 1
    local.get 1
    i64.load offset=16
    i64.store offset=32
    local.get 1
    i32.const 56
    i32.add
    i32.const 12
    i32.add
    i64.const 2
    i64.store align=4
    local.get 1
    i32.const 40
    i32.add
    i32.const 12
    i32.add
    i32.const 9
    i32.store
    local.get 1
    i32.const 2
    i32.store offset=60
    local.get 1
    i32.const 1050412
    i32.store offset=56
    local.get 1
    i32.const 8
    i32.store offset=44
    local.get 1
    local.get 1
    i32.const 40
    i32.add
    i32.store offset=64
    local.get 1
    local.get 1
    i32.const 32
    i32.add
    i32.store offset=48
    local.get 1
    local.get 1
    i32.const 8
    i32.add
    i32.store offset=40
    local.get 1
    i32.const 56
    i32.add
    i32.const 1050428
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN3std2io5Write9write_all17hdd8f2f9fc62d1156E (type 9) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 4
              local.get 3
              i32.store offset=12
              local.get 4
              local.get 2
              i32.store offset=8
              local.get 4
              i32.const 16
              i32.add
              i32.const 2
              local.get 4
              i32.const 8
              i32.add
              i32.const 1
              call $_ZN4wasi13lib_generated8fd_write17h644a6b3622a5007dE
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.load16_u offset=16
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 4
                    i32.load offset=20
                    local.tee 5
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 1050676
                    i32.store offset=4
                    local.get 0
                    i32.const 2
                    i32.store8
                    br 7 (;@1;)
                  end
                  local.get 3
                  local.get 5
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 2
                  local.get 5
                  i32.add
                  local.set 2
                  local.get 3
                  local.get 5
                  i32.sub
                  local.set 3
                  br 1 (;@6;)
                end
                local.get 4
                local.get 4
                i32.load16_u offset=18
                i32.store16 offset=30
                local.get 4
                i32.const 30
                i32.add
                call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
                i32.const 65535
                i32.and
                local.tee 5
                call $_ZN3std3sys4wasi17decode_error_kind17hc2ea97d6c0117270E
                i32.const 255
                i32.and
                i32.const 35
                i32.ne
                br_if 4 (;@2;)
              end
              local.get 3
              br_if 0 (;@5;)
            end
          end
          local.get 0
          i32.const 4
          i32.store8
          br 2 (;@1;)
        end
        local.get 5
        local.get 3
        i32.const 1050688
        call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
        unreachable
      end
      local.get 0
      local.get 5
      i32.store offset=4
      local.get 0
      i32.const 0
      i32.store
    end
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std2io5Write18write_all_vectored17he6289fffadcea60eE (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.const 4
            i32.add
            local.set 5
            local.get 3
            i32.const 3
            i32.shl
            local.set 6
            local.get 3
            i32.const -1
            i32.add
            i32.const 536870911
            i32.and
            i32.const 1
            i32.add
            local.set 7
            i32.const 0
            local.set 8
            block  ;; label = @5
              loop  ;; label = @6
                local.get 5
                i32.load
                br_if 1 (;@5;)
                local.get 5
                i32.const 8
                i32.add
                local.set 5
                local.get 8
                i32.const 1
                i32.add
                local.set 8
                local.get 6
                i32.const -8
                i32.add
                local.tee 6
                br_if 0 (;@6;)
              end
              local.get 7
              local.set 8
            end
            block  ;; label = @5
              local.get 8
              local.get 3
              i32.le_u
              br_if 0 (;@5;)
              local.get 8
              local.get 3
              i32.const 1050476
              call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
              unreachable
            end
            local.get 3
            local.get 8
            i32.sub
            local.tee 9
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 8
            i32.const 3
            i32.shl
            i32.add
            local.set 10
            loop  ;; label = @5
              local.get 9
              i32.const 3
              i32.and
              local.set 8
              i32.const 0
              local.set 3
              i32.const 0
              local.set 6
              block  ;; label = @6
                local.get 9
                i32.const -1
                i32.add
                local.tee 11
                i32.const 3
                i32.lt_u
                br_if 0 (;@6;)
                local.get 10
                i32.const 20
                i32.add
                local.set 5
                local.get 9
                i32.const -4
                i32.and
                local.set 2
                i32.const 0
                local.set 3
                i32.const 0
                local.set 6
                loop  ;; label = @7
                  local.get 5
                  i32.const 8
                  i32.add
                  i32.load
                  local.get 5
                  i32.load
                  local.get 5
                  i32.const -8
                  i32.add
                  i32.load
                  local.get 5
                  i32.const -16
                  i32.add
                  i32.load
                  local.get 3
                  i32.add
                  i32.add
                  i32.add
                  i32.add
                  local.set 3
                  local.get 5
                  i32.const 32
                  i32.add
                  local.set 5
                  local.get 2
                  local.get 6
                  i32.const 4
                  i32.add
                  local.tee 6
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              block  ;; label = @6
                local.get 8
                i32.eqz
                br_if 0 (;@6;)
                local.get 10
                local.get 6
                i32.const 3
                i32.shl
                i32.add
                i32.const 4
                i32.add
                local.set 5
                loop  ;; label = @7
                  local.get 5
                  i32.load
                  local.get 3
                  i32.add
                  local.set 3
                  local.get 5
                  i32.const 8
                  i32.add
                  local.set 5
                  local.get 8
                  i32.const -1
                  i32.add
                  local.tee 8
                  br_if 0 (;@7;)
                end
              end
              local.get 9
              i32.const 3
              i32.shl
              local.set 12
              block  ;; label = @6
                local.get 1
                i32.load offset=4
                local.get 1
                i32.load offset=8
                local.tee 5
                i32.sub
                local.get 3
                i32.ge_u
                br_if 0 (;@6;)
                local.get 1
                local.get 5
                local.get 3
                call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
                local.get 1
                i32.load offset=8
                local.set 5
              end
              local.get 10
              local.get 12
              i32.add
              local.set 7
              local.get 10
              local.set 8
              loop  ;; label = @6
                local.get 8
                i32.load
                local.set 2
                block  ;; label = @7
                  local.get 1
                  i32.load offset=4
                  local.get 5
                  i32.sub
                  local.get 8
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 6
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 1
                  local.get 5
                  local.get 6
                  call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
                  local.get 1
                  i32.load offset=8
                  local.set 5
                end
                local.get 1
                i32.load
                local.get 5
                i32.add
                local.get 2
                local.get 6
                call $memcpy
                drop
                local.get 1
                local.get 5
                local.get 6
                i32.add
                local.tee 5
                i32.store offset=8
                local.get 8
                i32.const 8
                i32.add
                local.tee 8
                local.get 7
                i32.ne
                br_if 0 (;@6;)
              end
              block  ;; label = @6
                local.get 3
                br_if 0 (;@6;)
                local.get 0
                i32.const 1050676
                i32.store offset=4
                local.get 0
                i32.const 2
                i32.store8
                br 5 (;@1;)
              end
              local.get 10
              i32.const 4
              i32.add
              local.set 5
              local.get 11
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set 7
              i32.const 0
              local.set 8
              i32.const 0
              local.set 6
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 5
                  i32.load
                  local.get 6
                  i32.add
                  local.tee 2
                  local.get 3
                  i32.gt_u
                  br_if 1 (;@6;)
                  local.get 5
                  i32.const 8
                  i32.add
                  local.set 5
                  local.get 8
                  i32.const 1
                  i32.add
                  local.set 8
                  local.get 2
                  local.set 6
                  local.get 12
                  i32.const -8
                  i32.add
                  local.tee 12
                  br_if 0 (;@7;)
                end
                local.get 2
                local.set 6
                local.get 7
                local.set 8
              end
              local.get 9
              local.get 8
              i32.lt_u
              br_if 2 (;@3;)
              local.get 10
              local.get 8
              i32.const 3
              i32.shl
              local.tee 2
              i32.add
              local.set 5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 9
                  local.get 8
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 3
                  local.get 6
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 4
                  i32.const 20
                  i32.add
                  i64.const 0
                  i64.store align=4
                  local.get 4
                  i32.const 1
                  i32.store offset=12
                  local.get 4
                  i32.const 1050532
                  i32.store offset=8
                  local.get 4
                  i32.const 1048880
                  i32.store offset=16
                  local.get 4
                  i32.const 8
                  i32.add
                  i32.const 1050540
                  call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
                  unreachable
                end
                local.get 10
                local.get 2
                i32.add
                local.tee 2
                i32.load offset=4
                local.tee 7
                local.get 3
                local.get 6
                i32.sub
                local.tee 6
                i32.lt_u
                br_if 4 (;@2;)
                local.get 2
                i32.const 4
                i32.add
                local.get 7
                local.get 6
                i32.sub
                i32.store
                local.get 5
                local.get 5
                i32.load
                local.get 6
                i32.add
                i32.store
              end
              local.get 5
              local.set 10
              local.get 9
              local.get 8
              i32.sub
              local.tee 9
              br_if 0 (;@5;)
            end
          end
          local.get 0
          i32.const 4
          i32.store8
          br 2 (;@1;)
        end
        local.get 8
        local.get 9
        i32.const 1050476
        call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
        unreachable
      end
      local.get 4
      i32.const 20
      i32.add
      i64.const 0
      i64.store align=4
      local.get 4
      i32.const 1
      i32.store offset=12
      local.get 4
      i32.const 1050592
      i32.store offset=8
      local.get 4
      i32.const 1048880
      i32.store offset=16
      local.get 4
      i32.const 8
      i32.add
      i32.const 1050632
      call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
      unreachable
    end
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std2io5Write9write_fmt17h0c13bd5dc713ad26E (type 5) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 4
    i32.store8 offset=8
    local.get 3
    local.get 1
    i32.store offset=16
    local.get 3
    i32.const 24
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    local.get 2
    i64.load align=4
    i64.store offset=24
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const 8
        i32.add
        i32.const 1050704
        local.get 3
        i32.const 24
        i32.add
        call $_ZN4core3fmt5write17h80c8117f546444b5E
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.load8_u offset=8
          i32.const 4
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.const 1050744
          i32.store offset=4
          local.get 0
          i32.const 2
          i32.store8
          br 2 (;@1;)
        end
        local.get 0
        local.get 3
        i64.load offset=8
        i64.store align=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 4
      i32.store8
      local.get 3
      i32.load offset=12
      local.set 0
      block  ;; label = @2
        local.get 3
        i32.load8_u offset=8
        local.tee 2
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 0
      i32.load
      local.tee 1
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.tee 2
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 2
        i32.load offset=4
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 4
        local.get 2
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 0
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h37c8a55fa99d45b0E (type 6) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hb2fb6114277a9b02E
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hd5407d2c62c31640E (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    local.get 1
    local.get 2
    call $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$9write_all17h3793cd8c0240d4ddE
    block  ;; label = @1
      local.get 3
      i32.load8_u offset=8
      local.tee 2
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.set 4
      local.get 3
      i64.load offset=8
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 1
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 4
        i32.load
        local.tee 6
        local.get 4
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 7
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 4
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 5
      i64.store align=4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    i32.const 4
    i32.ne)
  (func $_ZN3std5panic19get_backtrace_style17h767795e76de2418cE (type 8) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1056108
              br_table 3 (;@2;) 4 (;@1;) 2 (;@3;) 1 (;@4;) 0 (;@5;)
            end
            i32.const 1048932
            i32.const 40
            i32.const 1050828
            call $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E
            unreachable
          end
          i32.const 2
          local.set 1
          br 2 (;@1;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      i32.const 1049332
      i32.const 14
      call $_ZN3std3env7_var_os17h4c5665f691f15443E
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          local.get 0
          i32.load offset=4
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=8
                i32.const -1
                i32.add
                br_table 0 (;@6;) 2 (;@4;) 2 (;@4;) 1 (;@5;) 2 (;@4;)
              end
              local.get 2
              i32.load8_u
              i32.const 48
              i32.eq
              i32.const 1
              i32.shl
              local.set 1
              br 1 (;@4;)
            end
            local.get 2
            i32.load align=1
            i32.const 1819047270
            i32.eq
            local.set 1
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.const 1
            call $__rust_dealloc
          end
          local.get 1
          i32.const 1
          i32.add
          local.set 2
          br 1 (;@2;)
        end
        i32.const 3
        local.set 2
        i32.const 2
        local.set 1
      end
      i32.const 0
      local.get 2
      i32.store offset=1056108
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN3std7process5abort17hd45c1523f6588d30E (type 0)
    call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
    unreachable)
  (func $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17h4cdc754394f10ad2E (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1056104
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      i32.const 1056072
      i32.store offset=12
      local.get 1
      local.get 0
      i32.store offset=8
      local.get 1
      local.get 1
      i32.const 24
      i32.add
      i32.store offset=16
      local.get 1
      i32.const 8
      i32.add
      call $_ZN3std3sys4wasi4once4Once4call17h43619e2953d53b25E
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std3sys4wasi4once4Once4call17h43619e2953d53b25E (type 1) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load8_u offset=1056104
            local.tee 2
            i32.const 2
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const -2
            i32.add
            br_table 3 (;@1;) 1 (;@3;) 3 (;@1;)
          end
          i32.const 0
          i32.const 2
          i32.store8 offset=1056104
          local.get 0
          i32.load
          local.set 2
          local.get 0
          i32.const 0
          i32.store
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=4
          local.set 0
          local.get 2
          i32.const 1
          i32.store8
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          local.get 0
          i64.const 4294967296
          i64.store offset=8 align=4
          local.get 0
          i64.const 0
          i64.store align=4
          local.get 0
          i32.const 24
          i32.add
          i32.const 0
          i32.store8
          local.get 0
          i32.const 0
          i32.store8 offset=28
          i32.const 0
          i32.const 3
          i32.store8 offset=1056104
        end
        local.get 1
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1048736
      i32.const 43
      i32.const 1050904
      call $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E
      unreachable
    end
    local.get 1
    i32.const 20
    i32.add
    i64.const 0
    i64.store align=4
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1052560
    i32.store offset=8
    local.get 1
    i32.const 1048880
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    i32.const 1050888
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN3std3sys4wasi4once4Once4call17hbd51488539e7eb57E (type 1) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load8_u offset=1056104
              local.tee 2
              i32.const 2
              i32.lt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const -2
              i32.add
              br_table 4 (;@1;) 1 (;@4;) 4 (;@1;)
            end
            i32.const 0
            i32.const 2
            i32.store8 offset=1056104
            local.get 0
            i32.load
            local.set 2
            local.get 0
            i32.const 0
            i32.store
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
            i32.const 0
            i32.load8_u offset=1056069
            drop
            i32.const 1024
            i32.const 1
            call $__rust_alloc
            local.tee 0
            i32.eqz
            br_if 2 (;@2;)
            local.get 2
            i32.const 0
            i32.store8 offset=28
            local.get 2
            i32.const 0
            i32.store8 offset=24
            local.get 2
            i64.const 1024
            i64.store offset=16 align=4
            local.get 2
            local.get 0
            i32.store offset=12
            local.get 2
            i32.const 0
            i32.store offset=8
            local.get 2
            i64.const 0
            i64.store align=4
            i32.const 0
            i32.const 3
            i32.store8 offset=1056104
          end
          local.get 1
          i32.const 32
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 1048736
        i32.const 43
        i32.const 1050904
        call $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E
        unreachable
      end
      i32.const 1
      i32.const 1024
      call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
      unreachable
    end
    local.get 1
    i32.const 20
    i32.add
    i64.const 0
    i64.store align=4
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1052560
    i32.store offset=8
    local.get 1
    i32.const 1048880
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    i32.const 1050888
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN3std10sys_common9backtrace5print17h3f7333e2fc80655dE (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    i32.const 0
    i32.load8_u offset=1056112
    local.set 5
    i32.const 1
    local.set 6
    i32.const 0
    i32.const 1
    i32.store8 offset=1056112
    local.get 4
    local.get 5
    i32.store8 offset=32
    block  ;; label = @1
      local.get 5
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1056136
        i32.const 2147483647
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        call $_ZN3std9panicking11panic_count17is_zero_slow_path17h88f026da919a15b3E
        local.set 6
      end
      local.get 2
      i32.const 36
      i32.add
      i32.load
      local.set 5
      local.get 4
      i32.const 20
      i32.add
      i64.const 1
      i64.store align=4
      local.get 4
      i32.const 1
      i32.store offset=12
      local.get 4
      i32.const 1049436
      i32.store offset=8
      local.get 4
      i32.const 10
      i32.store offset=36
      local.get 4
      local.get 3
      i32.store8 offset=47
      local.get 4
      local.get 4
      i32.const 32
      i32.add
      i32.store offset=16
      local.get 4
      local.get 4
      i32.const 47
      i32.add
      i32.store offset=32
      local.get 0
      local.get 1
      local.get 4
      i32.const 8
      i32.add
      local.get 5
      call_indirect (type 5)
      block  ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=1056136
        i32.const 2147483647
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        call $_ZN3std9panicking11panic_count17is_zero_slow_path17h88f026da919a15b3E
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store8 offset=1056113
      end
      i32.const 0
      i32.const 0
      i32.store8 offset=1056112
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 4
    i64.const 0
    i64.store offset=20 align=4
    local.get 4
    i32.const 1048880
    i32.store offset=16
    local.get 4
    i32.const 1
    i32.store offset=12
    local.get 4
    i32.const 1052172
    i32.store offset=8
    local.get 4
    i32.const 32
    i32.add
    local.get 4
    i32.const 8
    i32.add
    call $_ZN4core9panicking13assert_failed17h88aeb5e475543e29E
    unreachable)
  (func $_ZN91_$LT$std..sys_common..backtrace.._print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17hea32b2f7b995831dE (type 4) (param i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    local.get 2
    i32.const 8
    i32.add
    call $_ZN3std3env11current_dir17hce9f0b0936a648a9E
    local.get 2
    i64.load offset=12 align=4
    local.set 4
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      local.tee 0
      br_if 0 (;@1;)
      local.get 4
      i64.const 255
      i64.and
      i64.const 3
      i64.ne
      br_if 0 (;@1;)
      local.get 4
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      local.tee 5
      i32.load
      local.tee 6
      local.get 5
      i32.const 4
      i32.add
      i32.load
      local.tee 7
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 7
        i32.load offset=4
        local.tee 8
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        local.get 8
        local.get 7
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 5
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 2
    i32.const 20
    i32.add
    i64.const 0
    i64.store align=4
    i32.const 1
    local.set 5
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 1051092
    i32.store offset=8
    local.get 2
    i32.const 1048880
    i32.store offset=16
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            local.get 2
            i32.const 8
            i32.add
            call $_ZN4core3fmt9Formatter9write_fmt17h8b1fb458f4c75394E
            br_if 0 (;@4;)
            local.get 3
            i32.const 255
            i32.and
            br_if 1 (;@3;)
            local.get 2
            i32.const 20
            i32.add
            i64.const 0
            i64.store align=4
            local.get 2
            i32.const 1
            i32.store offset=12
            local.get 2
            i32.const 1051188
            i32.store offset=8
            local.get 2
            i32.const 1048880
            i32.store offset=16
            local.get 1
            local.get 2
            i32.const 8
            i32.add
            call $_ZN4core3fmt9Formatter9write_fmt17h8b1fb458f4c75394E
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        i32.const 0
        local.set 5
        local.get 0
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 4
      i32.wrap_i64
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 5)
  (func $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17hd312084468c4357cE (type 1) (param i32)
    local.get 0
    call $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h685c1054195e4d4bE
    unreachable)
  (func $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h685c1054195e4d4bE (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 2
    i32.const 12
    i32.add
    i32.load
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            br_table 0 (;@4;) 1 (;@3;) 3 (;@1;)
          end
          local.get 3
          br_if 2 (;@1;)
          i32.const 1048880
          local.set 2
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 3
        br_if 1 (;@1;)
        local.get 2
        i32.load
        local.tee 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load
        local.set 2
      end
      local.get 1
      local.get 3
      i32.store offset=4
      local.get 1
      local.get 2
      i32.store
      local.get 1
      i32.const 1051828
      local.get 0
      i32.load offset=4
      local.tee 2
      call $_ZN4core5panic10panic_info9PanicInfo7message17hdea9c15d299b73f9E
      local.get 0
      i32.load offset=8
      local.get 2
      call $_ZN4core5panic10panic_info9PanicInfo10can_unwind17h8d4f277fdc08a6caE
      call $_ZN3std9panicking20rust_panic_with_hook17h59179097e3fe00d4E
      unreachable
    end
    local.get 1
    i32.const 0
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 1051848
    local.get 0
    i32.load offset=4
    local.tee 2
    call $_ZN4core5panic10panic_info9PanicInfo7message17hdea9c15d299b73f9E
    local.get 0
    i32.load offset=8
    local.get 2
    call $_ZN4core5panic10panic_info9PanicInfo10can_unwind17h8d4f277fdc08a6caE
    call $_ZN3std9panicking20rust_panic_with_hook17h59179097e3fe00d4E
    unreachable)
  (func $_ZN3std5alloc24default_alloc_error_hook17ha3291554c6d119e3E (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1056068
      br_if 0 (;@1;)
      local.get 2
      i32.const 11
      i32.store offset=4
      local.get 2
      local.get 1
      i32.store offset=12
      local.get 2
      local.get 2
      i32.const 12
      i32.add
      i32.store
      local.get 2
      i32.const 4
      i32.store8 offset=16
      local.get 2
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=24
      local.get 2
      i64.const 1
      i64.store offset=44 align=4
      local.get 2
      i32.const 2
      i32.store offset=36
      local.get 2
      i32.const 1051380
      i32.store offset=32
      local.get 2
      local.get 2
      i32.store offset=40
      local.get 2
      i32.const 16
      i32.add
      i32.const 1050780
      local.get 2
      i32.const 32
      i32.add
      call $_ZN4core3fmt5write17h80c8117f546444b5E
      local.set 3
      local.get 2
      i32.load8_u offset=16
      local.set 1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 4
          i32.eq
          br_if 1 (;@2;)
          local.get 2
          i32.load offset=20
          local.set 3
          block  ;; label = @4
            local.get 2
            i32.load8_u offset=16
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
          end
          local.get 3
          i32.load
          local.tee 4
          local.get 3
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 3
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 1 (;@2;)
        end
        local.get 2
        i32.load offset=20
        local.set 3
        block  ;; label = @3
          local.get 1
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load
        local.tee 4
        local.get 3
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 3
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 2
      i32.const 64
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    i32.const 44
    i32.add
    i64.const 1
    i64.store align=4
    local.get 2
    i32.const 2
    i32.store offset=36
    local.get 2
    i32.const 1051412
    i32.store offset=32
    local.get 2
    i32.const 11
    i32.store offset=20
    local.get 2
    local.get 1
    i32.store
    local.get 2
    local.get 2
    i32.const 16
    i32.add
    i32.store offset=40
    local.get 2
    local.get 2
    i32.store offset=16
    local.get 2
    i32.const 32
    i32.add
    i32.const 1051452
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $__rdl_alloc (type 4) (param i32 i32) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 8
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        i32.le_u
        br_if 1 (;@1;)
      end
      local.get 1
      local.get 0
      call $aligned_alloc
      return
    end
    local.get 0
    call $malloc)
  (func $__rdl_dealloc (type 5) (param i32 i32 i32)
    local.get 0
    call $free)
  (func $__rdl_realloc (type 7) (param i32 i32 i32 i32) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 8
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.le_u
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        local.get 3
        call $aligned_alloc
        local.tee 2
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 2
      local.get 0
      local.get 1
      local.get 3
      local.get 1
      local.get 3
      i32.lt_u
      select
      call $memcpy
      local.set 3
      local.get 0
      call $free
      local.get 3
      return
    end
    local.get 0
    local.get 3
    call $realloc)
  (func $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h85c38d52f5cb3588E (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 16
    i32.add
    i32.const 12
    i32.add
    i64.const 3
    i64.store align=4
    local.get 3
    i32.const 60
    i32.add
    i32.const 12
    i32.store
    local.get 3
    i32.const 40
    i32.add
    i32.const 12
    i32.add
    i32.const 8
    i32.store
    local.get 3
    i32.const 1051644
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.store offset=44
    local.get 3
    local.get 0
    i32.load offset=8
    i32.store offset=56
    local.get 3
    local.get 0
    i32.load offset=4
    i32.store offset=48
    local.get 3
    local.get 0
    i32.load
    i32.store offset=40
    local.get 3
    local.get 3
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 3
    i32.const 4
    i32.store offset=20
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    local.get 3
    i32.const 16
    i32.add
    local.get 2
    i32.load offset=36
    local.tee 4
    call_indirect (type 5)
    local.get 3
    i32.load offset=12
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load8_u offset=8
        local.tee 6
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 6
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 5
      i32.load
      local.tee 7
      local.get 5
      i32.const 4
      i32.add
      i32.load
      local.tee 6
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 6
        i32.load offset=4
        local.tee 8
        i32.eqz
        br_if 0 (;@2;)
        local.get 7
        local.get 8
        local.get 6
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 5
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=12
      i32.load8_u
      local.tee 0
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 0 (;@4;)
          end
          local.get 3
          i32.const 40
          i32.add
          local.get 1
          local.get 2
          i32.const 0
          call $_ZN3std10sys_common9backtrace5print17h3f7333e2fc80655dE
          local.get 3
          i32.load offset=44
          local.set 1
          block  ;; label = @4
            local.get 3
            i32.load8_u offset=40
            local.tee 0
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.ne
            br_if 3 (;@1;)
          end
          local.get 1
          i32.load
          local.tee 2
          local.get 1
          i32.const 4
          i32.add
          i32.load
          local.tee 0
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 6
            local.get 0
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 1
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 2 (;@1;)
        end
        local.get 3
        i32.const 40
        i32.add
        local.get 1
        local.get 2
        i32.const 1
        call $_ZN3std10sys_common9backtrace5print17h3f7333e2fc80655dE
        local.get 3
        i32.load offset=44
        local.set 1
        block  ;; label = @3
          local.get 3
          i32.load8_u offset=40
          local.tee 0
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 3
          i32.ne
          br_if 2 (;@1;)
        end
        local.get 1
        i32.load
        local.tee 2
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.tee 0
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 6
          local.get 0
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 1
        i32.const 12
        i32.const 4
        call $__rust_dealloc
        br 1 (;@1;)
      end
      i32.const 0
      i32.load8_u offset=1056052
      local.set 0
      i32.const 0
      i32.const 0
      i32.store8 offset=1056052
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 52
      i32.add
      i64.const 0
      i64.store align=4
      local.get 3
      i32.const 1
      i32.store offset=44
      local.get 3
      i32.const 1051756
      i32.store offset=40
      local.get 3
      i32.const 1048880
      i32.store offset=48
      local.get 3
      i32.const 16
      i32.add
      local.get 1
      local.get 3
      i32.const 40
      i32.add
      local.get 4
      call_indirect (type 5)
      local.get 3
      i32.load offset=20
      local.set 1
      block  ;; label = @2
        local.get 3
        i32.load8_u offset=16
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 6
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $rust_begin_unwind (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        call $_ZN4core5panic10panic_info9PanicInfo8location17h229cda8b7bd8b69eE
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        call $_ZN4core5panic10panic_info9PanicInfo7message17hdea9c15d299b73f9E
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 2
        i32.store offset=8
        local.get 1
        local.get 0
        i32.store offset=4
        local.get 1
        local.get 3
        i32.store
        local.get 1
        call $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17hd312084468c4357cE
        unreachable
      end
      i32.const 1048736
      i32.const 43
      i32.const 1051764
      call $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E
      unreachable
    end
    i32.const 1048736
    i32.const 43
    i32.const 1051780
    call $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E
    unreachable)
  (func $_ZN90_$LT$std..panicking..begin_panic_handler..PanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$8take_box17h888193ef09bb7434E (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.add
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 4
      local.get 2
      i32.const 32
      i32.add
      i32.const 8
      i32.add
      local.tee 5
      i32.const 0
      i32.store
      local.get 2
      i64.const 1
      i64.store offset=32
      local.get 2
      local.get 2
      i32.const 32
      i32.add
      i32.store offset=44
      local.get 2
      i32.const 44
      i32.add
      i32.const 1048808
      local.get 4
      call $_ZN4core3fmt5write17h80c8117f546444b5E
      drop
      local.get 2
      i32.const 16
      i32.add
      i32.const 8
      i32.add
      local.get 5
      i32.load
      local.tee 4
      i32.store
      local.get 2
      local.get 2
      i64.load offset=32
      local.tee 6
      i64.store offset=16
      local.get 3
      i32.const 8
      i32.add
      local.get 4
      i32.store
      local.get 3
      local.get 6
      i64.store align=4
    end
    local.get 2
    i32.const 8
    i32.add
    local.tee 4
    local.get 3
    i32.const 8
    i32.add
    i32.load
    i32.store
    local.get 1
    i32.const 12
    i32.add
    i32.const 0
    i32.store
    local.get 3
    i64.load align=4
    local.set 6
    local.get 1
    i64.const 1
    i64.store offset=4 align=4
    i32.const 0
    i32.load8_u offset=1056069
    drop
    local.get 2
    local.get 6
    i64.store
    block  ;; label = @1
      i32.const 12
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 12
      call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
      unreachable
    end
    local.get 1
    local.get 2
    i64.load
    i64.store align=4
    local.get 1
    i32.const 8
    i32.add
    local.get 4
    i32.load
    i32.store
    local.get 0
    i32.const 1051796
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN90_$LT$std..panicking..begin_panic_handler..PanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$3get17h01c47134cac61165E (type 2) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.add
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 1
      local.get 2
      i32.const 16
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 1
      i64.store offset=16
      local.get 2
      local.get 2
      i32.const 16
      i32.add
      i32.store offset=28
      local.get 2
      i32.const 28
      i32.add
      i32.const 1048808
      local.get 1
      call $_ZN4core3fmt5write17h80c8117f546444b5E
      drop
      local.get 2
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 1
      i32.store
      local.get 2
      local.get 2
      i64.load offset=16
      local.tee 5
      i64.store
      local.get 3
      i32.const 8
      i32.add
      local.get 1
      i32.store
      local.get 3
      local.get 5
      i64.store align=4
    end
    local.get 0
    i32.const 1051796
    i32.store offset=4
    local.get 0
    local.get 3
    i32.store
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN93_$LT$std..panicking..begin_panic_handler..StrPanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$8take_box17h4653026584ff3204E (type 2) (param i32 i32)
    (local i32 i32)
    i32.const 0
    i32.load8_u offset=1056069
    drop
    local.get 1
    i32.load offset=4
    local.set 2
    local.get 1
    i32.load
    local.set 3
    block  ;; label = @1
      i32.const 8
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 8
      call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
      unreachable
    end
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 0
    i32.const 1051812
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN93_$LT$std..panicking..begin_panic_handler..StrPanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$3get17he8cc0efc923178bfE (type 2) (param i32 i32)
    local.get 0
    i32.const 1051812
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN3std9panicking20rust_panic_with_hook17h59179097e3fe00d4E (type 11) (param i32 i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    i32.const 0
    i32.const 0
    i32.load offset=1056136
    local.tee 6
    i32.const 1
    i32.add
    i32.store offset=1056136
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 6
                  i32.const 0
                  i32.lt_s
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.load8_u offset=1056156
                  br_if 1 (;@6;)
                  i32.const 0
                  i32.const 1
                  i32.store8 offset=1056156
                  i32.const 0
                  i32.const 0
                  i32.load offset=1056152
                  i32.const 1
                  i32.add
                  i32.store offset=1056152
                  local.get 5
                  local.get 2
                  i32.store offset=28
                  local.get 5
                  i32.const 1051868
                  i32.store offset=20
                  local.get 5
                  i32.const 1048880
                  i32.store offset=16
                  local.get 5
                  local.get 4
                  i32.store8 offset=32
                  local.get 5
                  local.get 3
                  i32.store offset=24
                  i32.const 0
                  i32.load offset=1056120
                  local.tee 6
                  i32.const -1
                  i32.le_s
                  br_if 5 (;@2;)
                  i32.const 0
                  local.get 6
                  i32.const 1
                  i32.add
                  i32.store offset=1056120
                  i32.const 0
                  i32.load offset=1056128
                  local.set 6
                  local.get 5
                  local.get 0
                  local.get 1
                  i32.load offset=16
                  call_indirect (type 2)
                  local.get 5
                  local.get 5
                  i64.load
                  i64.store offset=16
                  local.get 6
                  br_if 3 (;@4;)
                  local.get 5
                  i32.const 16
                  i32.add
                  call $_ZN3std9panicking12default_hook17h540665267a76b5f8E
                  br 4 (;@3;)
                end
                local.get 5
                local.get 2
                i32.store offset=28
                local.get 5
                i32.const 1051868
                i32.store offset=20
                local.get 5
                i32.const 1048880
                i32.store offset=16
                local.get 5
                local.get 4
                i32.store8 offset=32
                local.get 5
                local.get 3
                i32.store offset=24
                local.get 5
                i32.const 13
                i32.store offset=12
                local.get 5
                local.get 5
                i32.const 16
                i32.add
                i32.store offset=8
                local.get 5
                i32.const 4
                i32.store8 offset=40
                local.get 5
                local.get 5
                i32.const 8
                i32.add
                i32.store offset=48
                local.get 5
                i64.const 1
                i64.store offset=68 align=4
                local.get 5
                i32.const 2
                i32.store offset=60
                local.get 5
                i32.const 1051936
                i32.store offset=56
                local.get 5
                local.get 5
                i32.const 8
                i32.add
                i32.store offset=64
                local.get 5
                i32.const 40
                i32.add
                i32.const 1050780
                local.get 5
                i32.const 56
                i32.add
                call $_ZN4core3fmt5write17h80c8117f546444b5E
                local.set 4
                local.get 5
                i32.load8_u offset=40
                local.set 6
                block  ;; label = @7
                  local.get 4
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 4
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 5
                  i32.load offset=44
                  local.set 6
                  block  ;; label = @8
                    local.get 5
                    i32.load8_u offset=40
                    local.tee 5
                    i32.const 4
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 3
                    i32.ne
                    br_if 3 (;@5;)
                  end
                  local.get 6
                  i32.load
                  local.tee 4
                  local.get 6
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 5
                  i32.load
                  call_indirect (type 1)
                  block  ;; label = @8
                    local.get 5
                    i32.load offset=4
                    local.tee 3
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 3
                    local.get 5
                    i32.load offset=8
                    call $__rust_dealloc
                  end
                  local.get 6
                  i32.const 12
                  i32.const 4
                  call $__rust_dealloc
                  call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
                  unreachable
                end
                local.get 5
                i32.load offset=44
                local.set 5
                block  ;; label = @7
                  local.get 6
                  i32.const 4
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 3
                  i32.ne
                  br_if 2 (;@5;)
                end
                local.get 5
                i32.load
                local.tee 4
                local.get 5
                i32.const 4
                i32.add
                i32.load
                local.tee 6
                i32.load
                call_indirect (type 1)
                block  ;; label = @7
                  local.get 6
                  i32.load offset=4
                  local.tee 3
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 3
                  local.get 6
                  i32.load offset=8
                  call $__rust_dealloc
                end
                local.get 5
                i32.const 12
                i32.const 4
                call $__rust_dealloc
                call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
                unreachable
              end
              local.get 5
              i32.const 4
              i32.store8 offset=16
              local.get 5
              local.get 5
              i32.const 8
              i32.add
              i32.store offset=24
              local.get 5
              i64.const 0
              i64.store offset=68 align=4
              local.get 5
              i32.const 1048880
              i32.store offset=64
              local.get 5
              i32.const 1
              i32.store offset=60
              local.get 5
              i32.const 1052004
              i32.store offset=56
              local.get 5
              i32.const 16
              i32.add
              i32.const 1050780
              local.get 5
              i32.const 56
              i32.add
              call $_ZN4core3fmt5write17h80c8117f546444b5E
              local.set 4
              local.get 5
              i32.load8_u offset=16
              local.set 6
              block  ;; label = @6
                local.get 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.const 4
                i32.eq
                br_if 1 (;@5;)
                local.get 5
                i32.load offset=20
                local.set 6
                block  ;; label = @7
                  local.get 5
                  i32.load8_u offset=16
                  local.tee 5
                  i32.const 4
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 3
                  i32.ne
                  br_if 2 (;@5;)
                end
                local.get 6
                i32.load
                local.tee 4
                local.get 6
                i32.const 4
                i32.add
                i32.load
                local.tee 5
                i32.load
                call_indirect (type 1)
                block  ;; label = @7
                  local.get 5
                  i32.load offset=4
                  local.tee 3
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 3
                  local.get 5
                  i32.load offset=8
                  call $__rust_dealloc
                end
                local.get 6
                i32.const 12
                i32.const 4
                call $__rust_dealloc
                call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
                unreachable
              end
              local.get 5
              i32.load offset=20
              local.set 5
              block  ;; label = @6
                local.get 6
                i32.const 4
                i32.gt_u
                br_if 0 (;@6;)
                local.get 6
                i32.const 3
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 5
              i32.load
              local.tee 4
              local.get 5
              i32.const 4
              i32.add
              i32.load
              local.tee 6
              i32.load
              call_indirect (type 1)
              block  ;; label = @6
                local.get 6
                i32.load offset=4
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                local.get 3
                local.get 6
                i32.load offset=8
                call $__rust_dealloc
              end
              local.get 5
              i32.const 12
              i32.const 4
              call $__rust_dealloc
            end
            call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
            unreachable
          end
          i32.const 0
          i32.load offset=1056128
          local.get 5
          i32.const 16
          i32.add
          i32.const 0
          i32.load offset=1056132
          i32.load offset=20
          call_indirect (type 2)
        end
        i32.const 0
        i32.const 0
        i32.load offset=1056120
        i32.const -1
        i32.add
        i32.store offset=1056120
        i32.const 0
        i32.const 0
        i32.store8 offset=1056156
        local.get 4
        br_if 1 (;@1;)
        local.get 5
        i32.const 68
        i32.add
        i64.const 0
        i64.store align=4
        local.get 5
        i32.const 1
        i32.store offset=60
        local.get 5
        i32.const 1052060
        i32.store offset=56
        local.get 5
        i32.const 1048880
        i32.store offset=64
        local.get 5
        i32.const 40
        i32.add
        local.get 5
        i32.const 8
        i32.add
        local.get 5
        i32.const 56
        i32.add
        call $_ZN3std2io5Write9write_fmt17he644c9ec16dca596E
        local.get 5
        i32.load8_u offset=40
        local.get 5
        i32.load offset=44
        call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17h90619d11b6168bf9E
        call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
        unreachable
      end
      local.get 5
      i32.const 68
      i32.add
      i64.const 0
      i64.store align=4
      local.get 5
      i32.const 1
      i32.store offset=60
      local.get 5
      i32.const 1052300
      i32.store offset=56
      local.get 5
      local.get 5
      i32.const 8
      i32.add
      i32.store offset=64
      local.get 5
      i32.const 40
      i32.add
      local.get 5
      i32.const 8
      i32.add
      local.get 5
      i32.const 56
      i32.add
      call $_ZN3std2io5Write9write_fmt17he644c9ec16dca596E
      local.get 5
      i32.load8_u offset=40
      local.get 5
      i32.load offset=44
      call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17h90619d11b6168bf9E
      call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
      unreachable
    end
    local.get 0
    local.get 1
    call $rust_panic
    unreachable)
  (func $rust_panic (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    local.get 1
    call $__rust_start_panic
    i32.store offset=12
    local.get 2
    i32.const 36
    i32.add
    i64.const 1
    i64.store align=4
    local.get 2
    i32.const 2
    i32.store offset=28
    local.get 2
    i32.const 1052124
    i32.store offset=24
    local.get 2
    i32.const 11
    i32.store offset=52
    local.get 2
    local.get 2
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 2
    local.get 2
    i32.const 12
    i32.add
    i32.store offset=48
    local.get 2
    i32.const 16
    i32.add
    local.get 2
    i32.const 56
    i32.add
    local.get 2
    i32.const 24
    i32.add
    call $_ZN3std2io5Write9write_fmt17he644c9ec16dca596E
    local.get 2
    i32.load8_u offset=16
    local.get 2
    i32.load offset=20
    call $_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17h90619d11b6168bf9E
    call $_ZN3std3sys4wasi14abort_internal17h1f6b37acb101778eE
    unreachable)
  (func $_ZN3std3sys4wasi7process8ExitCode6as_i3217had408febceec50a5E (type 3) (param i32) (result i32)
    local.get 0
    i32.load8_u)
  (func $_ZN64_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$5write17h3a378ee0bcdd7f43E (type 9) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 3
    i32.store offset=12
    local.get 4
    local.get 2
    i32.store offset=8
    local.get 4
    i32.const 16
    i32.add
    i32.const 2
    local.get 4
    i32.const 8
    i32.add
    i32.const 1
    call $_ZN4wasi13lib_generated8fd_write17h644a6b3622a5007dE
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.load16_u offset=16
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.load offset=20
        i32.store offset=4
        local.get 0
        i32.const 4
        i32.store8
        br 1 (;@1;)
      end
      local.get 4
      local.get 4
      i32.load16_u offset=18
      i32.store16 offset=30
      local.get 0
      local.get 4
      i32.const 30
      i32.add
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i64.extend_i32_u
      i64.const 65535
      i64.and
      i64.const 32
      i64.shl
      i64.store align=4
    end
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN64_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$14write_vectored17h1297b0f22f014a75E (type 9) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 2
    local.get 2
    local.get 3
    call $_ZN4wasi13lib_generated8fd_write17h644a6b3622a5007dE
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.load16_u
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.load offset=4
        i32.store offset=4
        local.get 0
        i32.const 4
        i32.store8
        br 1 (;@1;)
      end
      local.get 4
      local.get 4
      i32.load16_u offset=2
      i32.store16 offset=14
      local.get 0
      local.get 4
      i32.const 14
      i32.add
      call $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE
      i64.extend_i32_u
      i64.const 65535
      i64.and
      i64.const 32
      i64.shl
      i64.store align=4
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN64_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$17is_write_vectored17h36803292745c3d05E (type 3) (param i32) (result i32)
    i32.const 1)
  (func $_ZN64_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$5flush17hb9ed6af4a99a6e9cE (type 2) (param i32 i32)
    local.get 0
    i32.const 4
    i32.store8)
  (func $_ZN3std5alloc8rust_oom17hb466c6b0b424784eE (type 2) (param i32 i32)
    (local i32)
    local.get 0
    local.get 1
    i32.const 0
    i32.load offset=1056116
    local.tee 2
    i32.const 14
    local.get 2
    select
    call_indirect (type 2)
    call $_ZN3std7process5abort17hd45c1523f6588d30E
    unreachable)
  (func $__rg_oom (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $_ZN3std5alloc8rust_oom17hb466c6b0b424784eE
    unreachable)
  (func $__rust_start_panic (type 4) (param i32 i32) (result i32)
    unreachable
    unreachable)
  (func $_ZN4wasi13lib_generated5Errno3raw17h474028c1fb96d5aeE (type 3) (param i32) (result i32)
    local.get 0
    i32.load16_u)
  (func $_ZN4wasi13lib_generated8fd_write17h644a6b3622a5007dE (type 9) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 2
        local.get 3
        local.get 4
        i32.const 12
        i32.add
        call $_ZN4wasi13lib_generated22wasi_snapshot_preview18fd_write17h03249cfaa96a4902E
        local.tee 3
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.load offset=12
        i32.store offset=4
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      local.get 3
      i32.store16 offset=2
      i32.const 1
      local.set 3
    end
    local.get 0
    local.get 3
    i32.store16
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $malloc (type 3) (param i32) (result i32)
    local.get 0
    call $dlmalloc)
  (func $dlmalloc (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load offset=1056204
      local.tee 2
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1056652
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1056656
          local.set 4
          br 1 (;@2;)
        end
        i32.const 0
        i64.const -1
        i64.store offset=1056664 align=4
        i32.const 0
        i64.const 281474976776192
        i64.store offset=1056656 align=4
        i32.const 0
        local.get 1
        i32.const 8
        i32.add
        i32.const -16
        i32.and
        i32.const 1431655768
        i32.xor
        local.tee 3
        i32.store offset=1056652
        i32.const 0
        i32.const 0
        i32.store offset=1056672
        i32.const 0
        i32.const 0
        i32.store offset=1056624
        i32.const 65536
        local.set 4
      end
      i32.const 0
      local.set 2
      i32.const 1114112
      i32.const 1056720
      local.get 4
      i32.add
      i32.const -1
      i32.add
      i32.const 0
      local.get 4
      i32.sub
      i32.and
      i32.const 1114112
      select
      i32.const 1056720
      i32.sub
      local.tee 5
      i32.const 89
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 0
      local.set 4
      i32.const 0
      local.get 5
      i32.store offset=1056632
      i32.const 0
      i32.const 1056720
      i32.store offset=1056628
      i32.const 0
      i32.const 1056720
      i32.store offset=1056196
      i32.const 0
      local.get 3
      i32.store offset=1056216
      i32.const 0
      i32.const -1
      i32.store offset=1056212
      loop  ;; label = @2
        local.get 4
        i32.const 1056240
        i32.add
        local.get 4
        i32.const 1056228
        i32.add
        local.tee 3
        i32.store
        local.get 3
        local.get 4
        i32.const 1056220
        i32.add
        local.tee 6
        i32.store
        local.get 4
        i32.const 1056232
        i32.add
        local.get 6
        i32.store
        local.get 4
        i32.const 1056248
        i32.add
        local.get 4
        i32.const 1056236
        i32.add
        local.tee 6
        i32.store
        local.get 6
        local.get 3
        i32.store
        local.get 4
        i32.const 1056256
        i32.add
        local.get 4
        i32.const 1056244
        i32.add
        local.tee 3
        i32.store
        local.get 3
        local.get 6
        i32.store
        local.get 4
        i32.const 1056252
        i32.add
        local.get 3
        i32.store
        local.get 4
        i32.const 32
        i32.add
        local.tee 4
        i32.const 256
        i32.ne
        br_if 0 (;@2;)
      end
      i32.const 1056720
      i32.const -8
      i32.const 1056720
      i32.sub
      i32.const 15
      i32.and
      i32.const 0
      i32.const 1056720
      i32.const 8
      i32.add
      i32.const 15
      i32.and
      select
      local.tee 4
      i32.add
      local.tee 2
      i32.const 4
      i32.add
      local.get 5
      i32.const -56
      i32.add
      local.tee 3
      local.get 4
      i32.sub
      local.tee 4
      i32.const 1
      i32.or
      i32.store
      i32.const 0
      i32.const 0
      i32.load offset=1056668
      i32.store offset=1056208
      i32.const 0
      local.get 4
      i32.store offset=1056192
      i32.const 0
      local.get 2
      i32.store offset=1056204
      i32.const 1056720
      local.get 3
      i32.add
      i32.const 56
      i32.store offset=4
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.const 236
                            i32.gt_u
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1056180
                              local.tee 7
                              i32.const 16
                              local.get 0
                              i32.const 19
                              i32.add
                              i32.const -16
                              i32.and
                              local.get 0
                              i32.const 11
                              i32.lt_u
                              select
                              local.tee 5
                              i32.const 3
                              i32.shr_u
                              local.tee 3
                              i32.shr_u
                              local.tee 4
                              i32.const 3
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 1
                                  i32.and
                                  local.get 3
                                  i32.or
                                  i32.const 1
                                  i32.xor
                                  local.tee 6
                                  i32.const 3
                                  i32.shl
                                  local.tee 3
                                  i32.const 1056220
                                  i32.add
                                  local.tee 4
                                  local.get 3
                                  i32.const 1056228
                                  i32.add
                                  i32.load
                                  local.tee 3
                                  i32.load offset=8
                                  local.tee 5
                                  i32.ne
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.get 7
                                  i32.const -2
                                  local.get 6
                                  i32.rotl
                                  i32.and
                                  i32.store offset=1056180
                                  br 1 (;@14;)
                                end
                                local.get 4
                                local.get 5
                                i32.store offset=8
                                local.get 5
                                local.get 4
                                i32.store offset=12
                              end
                              local.get 3
                              i32.const 8
                              i32.add
                              local.set 4
                              local.get 3
                              local.get 6
                              i32.const 3
                              i32.shl
                              local.tee 6
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 3
                              local.get 6
                              i32.add
                              local.tee 3
                              local.get 3
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              br 12 (;@1;)
                            end
                            local.get 5
                            i32.const 0
                            i32.load offset=1056188
                            local.tee 8
                            i32.le_u
                            br_if 1 (;@11;)
                            block  ;; label = @13
                              local.get 4
                              i32.eqz
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 4
                                  local.get 3
                                  i32.shl
                                  i32.const 2
                                  local.get 3
                                  i32.shl
                                  local.tee 4
                                  i32.const 0
                                  local.get 4
                                  i32.sub
                                  i32.or
                                  i32.and
                                  local.tee 4
                                  i32.const 0
                                  local.get 4
                                  i32.sub
                                  i32.and
                                  i32.ctz
                                  local.tee 3
                                  i32.const 3
                                  i32.shl
                                  local.tee 4
                                  i32.const 1056220
                                  i32.add
                                  local.tee 6
                                  local.get 4
                                  i32.const 1056228
                                  i32.add
                                  i32.load
                                  local.tee 4
                                  i32.load offset=8
                                  local.tee 0
                                  i32.ne
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.get 7
                                  i32.const -2
                                  local.get 3
                                  i32.rotl
                                  i32.and
                                  local.tee 7
                                  i32.store offset=1056180
                                  br 1 (;@14;)
                                end
                                local.get 6
                                local.get 0
                                i32.store offset=8
                                local.get 0
                                local.get 6
                                i32.store offset=12
                              end
                              local.get 4
                              local.get 5
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 4
                              local.get 3
                              i32.const 3
                              i32.shl
                              local.tee 3
                              i32.add
                              local.get 3
                              local.get 5
                              i32.sub
                              local.tee 6
                              i32.store
                              local.get 4
                              local.get 5
                              i32.add
                              local.tee 0
                              local.get 6
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              block  ;; label = @14
                                local.get 8
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 8
                                i32.const -8
                                i32.and
                                i32.const 1056220
                                i32.add
                                local.set 5
                                i32.const 0
                                i32.load offset=1056200
                                local.set 3
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 7
                                    i32.const 1
                                    local.get 8
                                    i32.const 3
                                    i32.shr_u
                                    i32.shl
                                    local.tee 9
                                    i32.and
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 7
                                    local.get 9
                                    i32.or
                                    i32.store offset=1056180
                                    local.get 5
                                    local.set 9
                                    br 1 (;@15;)
                                  end
                                  local.get 5
                                  i32.load offset=8
                                  local.set 9
                                end
                                local.get 9
                                local.get 3
                                i32.store offset=12
                                local.get 5
                                local.get 3
                                i32.store offset=8
                                local.get 3
                                local.get 5
                                i32.store offset=12
                                local.get 3
                                local.get 9
                                i32.store offset=8
                              end
                              local.get 4
                              i32.const 8
                              i32.add
                              local.set 4
                              i32.const 0
                              local.get 0
                              i32.store offset=1056200
                              i32.const 0
                              local.get 6
                              i32.store offset=1056188
                              br 12 (;@1;)
                            end
                            i32.const 0
                            i32.load offset=1056184
                            local.tee 10
                            i32.eqz
                            br_if 1 (;@11;)
                            local.get 10
                            i32.const 0
                            local.get 10
                            i32.sub
                            i32.and
                            i32.ctz
                            i32.const 2
                            i32.shl
                            i32.const 1056484
                            i32.add
                            i32.load
                            local.tee 0
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            local.get 5
                            i32.sub
                            local.set 3
                            local.get 0
                            local.set 6
                            block  ;; label = @13
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 6
                                  i32.load offset=16
                                  local.tee 4
                                  br_if 0 (;@15;)
                                  local.get 6
                                  i32.const 20
                                  i32.add
                                  i32.load
                                  local.tee 4
                                  i32.eqz
                                  br_if 2 (;@13;)
                                end
                                local.get 4
                                i32.load offset=4
                                i32.const -8
                                i32.and
                                local.get 5
                                i32.sub
                                local.tee 6
                                local.get 3
                                local.get 6
                                local.get 3
                                i32.lt_u
                                local.tee 6
                                select
                                local.set 3
                                local.get 4
                                local.get 0
                                local.get 6
                                select
                                local.set 0
                                local.get 4
                                local.set 6
                                br 0 (;@14;)
                              end
                            end
                            local.get 0
                            i32.load offset=24
                            local.set 11
                            block  ;; label = @13
                              local.get 0
                              i32.load offset=12
                              local.tee 9
                              local.get 0
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 0
                              i32.load offset=8
                              local.tee 4
                              i32.const 0
                              i32.load offset=1056196
                              i32.lt_u
                              drop
                              local.get 9
                              local.get 4
                              i32.store offset=8
                              local.get 4
                              local.get 9
                              i32.store offset=12
                              br 11 (;@2;)
                            end
                            block  ;; label = @13
                              local.get 0
                              i32.const 20
                              i32.add
                              local.tee 6
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 0
                              i32.load offset=16
                              local.tee 4
                              i32.eqz
                              br_if 3 (;@10;)
                              local.get 0
                              i32.const 16
                              i32.add
                              local.set 6
                            end
                            loop  ;; label = @13
                              local.get 6
                              local.set 2
                              local.get 4
                              local.tee 9
                              i32.const 20
                              i32.add
                              local.tee 6
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 9
                              i32.const 16
                              i32.add
                              local.set 6
                              local.get 9
                              i32.load offset=16
                              local.tee 4
                              br_if 0 (;@13;)
                            end
                            local.get 2
                            i32.const 0
                            i32.store
                            br 10 (;@2;)
                          end
                          i32.const -1
                          local.set 5
                          local.get 0
                          i32.const -65
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 19
                          i32.add
                          local.tee 4
                          i32.const -16
                          i32.and
                          local.set 5
                          i32.const 0
                          i32.load offset=1056184
                          local.tee 10
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 8
                          block  ;; label = @12
                            local.get 5
                            i32.const 256
                            i32.lt_u
                            br_if 0 (;@12;)
                            i32.const 31
                            local.set 8
                            local.get 5
                            i32.const 16777215
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 5
                            i32.const 38
                            local.get 4
                            i32.const 8
                            i32.shr_u
                            i32.clz
                            local.tee 4
                            i32.sub
                            i32.shr_u
                            i32.const 1
                            i32.and
                            local.get 4
                            i32.const 1
                            i32.shl
                            i32.sub
                            i32.const 62
                            i32.add
                            local.set 8
                          end
                          i32.const 0
                          local.get 5
                          i32.sub
                          local.set 3
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 8
                                  i32.const 2
                                  i32.shl
                                  i32.const 1056484
                                  i32.add
                                  i32.load
                                  local.tee 6
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 4
                                  i32.const 0
                                  local.set 9
                                  br 1 (;@14;)
                                end
                                i32.const 0
                                local.set 4
                                local.get 5
                                i32.const 0
                                i32.const 25
                                local.get 8
                                i32.const 1
                                i32.shr_u
                                i32.sub
                                local.get 8
                                i32.const 31
                                i32.eq
                                select
                                i32.shl
                                local.set 0
                                i32.const 0
                                local.set 9
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 6
                                    i32.load offset=4
                                    i32.const -8
                                    i32.and
                                    local.get 5
                                    i32.sub
                                    local.tee 7
                                    local.get 3
                                    i32.ge_u
                                    br_if 0 (;@16;)
                                    local.get 7
                                    local.set 3
                                    local.get 6
                                    local.set 9
                                    local.get 7
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 3
                                    local.get 6
                                    local.set 9
                                    local.get 6
                                    local.set 4
                                    br 3 (;@13;)
                                  end
                                  local.get 4
                                  local.get 6
                                  i32.const 20
                                  i32.add
                                  i32.load
                                  local.tee 7
                                  local.get 7
                                  local.get 6
                                  local.get 0
                                  i32.const 29
                                  i32.shr_u
                                  i32.const 4
                                  i32.and
                                  i32.add
                                  i32.const 16
                                  i32.add
                                  i32.load
                                  local.tee 6
                                  i32.eq
                                  select
                                  local.get 4
                                  local.get 7
                                  select
                                  local.set 4
                                  local.get 0
                                  i32.const 1
                                  i32.shl
                                  local.set 0
                                  local.get 6
                                  br_if 0 (;@15;)
                                end
                              end
                              block  ;; label = @14
                                local.get 4
                                local.get 9
                                i32.or
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 9
                                i32.const 2
                                local.get 8
                                i32.shl
                                local.tee 4
                                i32.const 0
                                local.get 4
                                i32.sub
                                i32.or
                                local.get 10
                                i32.and
                                local.tee 4
                                i32.eqz
                                br_if 3 (;@11;)
                                local.get 4
                                i32.const 0
                                local.get 4
                                i32.sub
                                i32.and
                                i32.ctz
                                i32.const 2
                                i32.shl
                                i32.const 1056484
                                i32.add
                                i32.load
                                local.set 4
                              end
                              local.get 4
                              i32.eqz
                              br_if 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 4
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 5
                              i32.sub
                              local.tee 7
                              local.get 3
                              i32.lt_u
                              local.set 0
                              block  ;; label = @14
                                local.get 4
                                i32.load offset=16
                                local.tee 6
                                br_if 0 (;@14;)
                                local.get 4
                                i32.const 20
                                i32.add
                                i32.load
                                local.set 6
                              end
                              local.get 7
                              local.get 3
                              local.get 0
                              select
                              local.set 3
                              local.get 4
                              local.get 9
                              local.get 0
                              select
                              local.set 9
                              local.get 6
                              local.set 4
                              local.get 6
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 9
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 3
                          i32.const 0
                          i32.load offset=1056188
                          local.get 5
                          i32.sub
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 9
                          i32.load offset=24
                          local.set 2
                          block  ;; label = @12
                            local.get 9
                            i32.load offset=12
                            local.tee 0
                            local.get 9
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 9
                            i32.load offset=8
                            local.tee 4
                            i32.const 0
                            i32.load offset=1056196
                            i32.lt_u
                            drop
                            local.get 0
                            local.get 4
                            i32.store offset=8
                            local.get 4
                            local.get 0
                            i32.store offset=12
                            br 9 (;@3;)
                          end
                          block  ;; label = @12
                            local.get 9
                            i32.const 20
                            i32.add
                            local.tee 6
                            i32.load
                            local.tee 4
                            br_if 0 (;@12;)
                            local.get 9
                            i32.load offset=16
                            local.tee 4
                            i32.eqz
                            br_if 3 (;@9;)
                            local.get 9
                            i32.const 16
                            i32.add
                            local.set 6
                          end
                          loop  ;; label = @12
                            local.get 6
                            local.set 7
                            local.get 4
                            local.tee 0
                            i32.const 20
                            i32.add
                            local.tee 6
                            i32.load
                            local.tee 4
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 16
                            i32.add
                            local.set 6
                            local.get 0
                            i32.load offset=16
                            local.tee 4
                            br_if 0 (;@12;)
                          end
                          local.get 7
                          i32.const 0
                          i32.store
                          br 8 (;@3;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1056188
                          local.tee 4
                          local.get 5
                          i32.lt_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=1056200
                          local.set 3
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 4
                              local.get 5
                              i32.sub
                              local.tee 6
                              i32.const 16
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 5
                              i32.add
                              local.tee 0
                              local.get 6
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              i32.const 0
                              local.get 6
                              i32.store offset=1056188
                              i32.const 0
                              local.get 0
                              i32.store offset=1056200
                              local.get 3
                              local.get 4
                              i32.add
                              local.get 6
                              i32.store
                              local.get 3
                              local.get 5
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              br 1 (;@12;)
                            end
                            local.get 3
                            local.get 4
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 3
                            local.get 4
                            i32.add
                            local.tee 4
                            local.get 4
                            i32.load offset=4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            i32.const 0
                            i32.store offset=1056200
                            i32.const 0
                            i32.const 0
                            i32.store offset=1056188
                          end
                          local.get 3
                          i32.const 8
                          i32.add
                          local.set 4
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1056192
                          local.tee 6
                          local.get 5
                          i32.le_u
                          br_if 0 (;@11;)
                          local.get 2
                          local.get 5
                          i32.add
                          local.tee 4
                          local.get 6
                          local.get 5
                          i32.sub
                          local.tee 3
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          i32.const 0
                          local.get 4
                          i32.store offset=1056204
                          i32.const 0
                          local.get 3
                          i32.store offset=1056192
                          local.get 2
                          local.get 5
                          i32.const 3
                          i32.or
                          i32.store offset=4
                          local.get 2
                          i32.const 8
                          i32.add
                          local.set 4
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1056652
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=1056660
                            local.set 3
                            br 1 (;@11;)
                          end
                          i32.const 0
                          i64.const -1
                          i64.store offset=1056664 align=4
                          i32.const 0
                          i64.const 281474976776192
                          i64.store offset=1056656 align=4
                          i32.const 0
                          local.get 1
                          i32.const 12
                          i32.add
                          i32.const -16
                          i32.and
                          i32.const 1431655768
                          i32.xor
                          i32.store offset=1056652
                          i32.const 0
                          i32.const 0
                          i32.store offset=1056672
                          i32.const 0
                          i32.const 0
                          i32.store offset=1056624
                          i32.const 65536
                          local.set 3
                        end
                        i32.const 0
                        local.set 4
                        block  ;; label = @11
                          local.get 3
                          local.get 5
                          i32.const 71
                          i32.add
                          local.tee 8
                          i32.add
                          local.tee 0
                          i32.const 0
                          local.get 3
                          i32.sub
                          local.tee 7
                          i32.and
                          local.tee 9
                          local.get 5
                          i32.gt_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.const 48
                          i32.store offset=1056676
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1056620
                          local.tee 4
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1056612
                            local.tee 3
                            local.get 9
                            i32.add
                            local.tee 10
                            local.get 3
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 10
                            local.get 4
                            i32.le_u
                            br_if 1 (;@11;)
                          end
                          i32.const 0
                          local.set 4
                          i32.const 0
                          i32.const 48
                          i32.store offset=1056676
                          br 10 (;@1;)
                        end
                        i32.const 0
                        i32.load8_u offset=1056624
                        i32.const 4
                        i32.and
                        br_if 4 (;@6;)
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 2
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 1056628
                              local.set 4
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 4
                                  i32.load
                                  local.tee 3
                                  local.get 2
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  local.get 3
                                  local.get 4
                                  i32.load offset=4
                                  i32.add
                                  local.get 2
                                  i32.gt_u
                                  br_if 3 (;@12;)
                                end
                                local.get 4
                                i32.load offset=8
                                local.tee 4
                                br_if 0 (;@14;)
                              end
                            end
                            i32.const 0
                            call $sbrk
                            local.tee 0
                            i32.const -1
                            i32.eq
                            br_if 5 (;@7;)
                            local.get 9
                            local.set 7
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1056656
                              local.tee 4
                              i32.const -1
                              i32.add
                              local.tee 3
                              local.get 0
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 9
                              local.get 0
                              i32.sub
                              local.get 3
                              local.get 0
                              i32.add
                              i32.const 0
                              local.get 4
                              i32.sub
                              i32.and
                              i32.add
                              local.set 7
                            end
                            local.get 7
                            local.get 5
                            i32.le_u
                            br_if 5 (;@7;)
                            local.get 7
                            i32.const 2147483646
                            i32.gt_u
                            br_if 5 (;@7;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1056620
                              local.tee 4
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=1056612
                              local.tee 3
                              local.get 7
                              i32.add
                              local.tee 6
                              local.get 3
                              i32.le_u
                              br_if 6 (;@7;)
                              local.get 6
                              local.get 4
                              i32.gt_u
                              br_if 6 (;@7;)
                            end
                            local.get 7
                            call $sbrk
                            local.tee 4
                            local.get 0
                            i32.ne
                            br_if 1 (;@11;)
                            br 7 (;@5;)
                          end
                          local.get 0
                          local.get 6
                          i32.sub
                          local.get 7
                          i32.and
                          local.tee 7
                          i32.const 2147483646
                          i32.gt_u
                          br_if 4 (;@7;)
                          local.get 7
                          call $sbrk
                          local.tee 0
                          local.get 4
                          i32.load
                          local.get 4
                          i32.load offset=4
                          i32.add
                          i32.eq
                          br_if 3 (;@8;)
                          local.get 0
                          local.set 4
                        end
                        block  ;; label = @11
                          local.get 4
                          i32.const -1
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 72
                          i32.add
                          local.get 7
                          i32.le_u
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            local.get 8
                            local.get 7
                            i32.sub
                            i32.const 0
                            i32.load offset=1056660
                            local.tee 3
                            i32.add
                            i32.const 0
                            local.get 3
                            i32.sub
                            i32.and
                            local.tee 3
                            i32.const 2147483646
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 4
                            local.set 0
                            br 7 (;@5;)
                          end
                          block  ;; label = @12
                            local.get 3
                            call $sbrk
                            i32.const -1
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 3
                            local.get 7
                            i32.add
                            local.set 7
                            local.get 4
                            local.set 0
                            br 7 (;@5;)
                          end
                          i32.const 0
                          local.get 7
                          i32.sub
                          call $sbrk
                          drop
                          br 4 (;@7;)
                        end
                        local.get 4
                        local.set 0
                        local.get 4
                        i32.const -1
                        i32.ne
                        br_if 5 (;@5;)
                        br 3 (;@7;)
                      end
                      i32.const 0
                      local.set 9
                      br 7 (;@2;)
                    end
                    i32.const 0
                    local.set 0
                    br 5 (;@3;)
                  end
                  local.get 0
                  i32.const -1
                  i32.ne
                  br_if 2 (;@5;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=1056624
                i32.const 4
                i32.or
                i32.store offset=1056624
              end
              local.get 9
              i32.const 2147483646
              i32.gt_u
              br_if 1 (;@4;)
              local.get 9
              call $sbrk
              local.set 0
              i32.const 0
              call $sbrk
              local.set 4
              local.get 0
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              local.get 4
              i32.ge_u
              br_if 1 (;@4;)
              local.get 4
              local.get 0
              i32.sub
              local.tee 7
              local.get 5
              i32.const 56
              i32.add
              i32.le_u
              br_if 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=1056612
            local.get 7
            i32.add
            local.tee 4
            i32.store offset=1056612
            block  ;; label = @5
              local.get 4
              i32.const 0
              i32.load offset=1056616
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 4
              i32.store offset=1056616
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1056204
                    local.tee 3
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 1056628
                    local.set 4
                    loop  ;; label = @9
                      local.get 0
                      local.get 4
                      i32.load
                      local.tee 6
                      local.get 4
                      i32.load offset=4
                      local.tee 9
                      i32.add
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 4
                      i32.load offset=8
                      local.tee 4
                      br_if 0 (;@9;)
                      br 3 (;@6;)
                    end
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1056196
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 4
                      i32.ge_u
                      br_if 1 (;@8;)
                    end
                    i32.const 0
                    local.get 0
                    i32.store offset=1056196
                  end
                  i32.const 0
                  local.set 4
                  i32.const 0
                  local.get 7
                  i32.store offset=1056632
                  i32.const 0
                  local.get 0
                  i32.store offset=1056628
                  i32.const 0
                  i32.const -1
                  i32.store offset=1056212
                  i32.const 0
                  i32.const 0
                  i32.load offset=1056652
                  i32.store offset=1056216
                  i32.const 0
                  i32.const 0
                  i32.store offset=1056640
                  loop  ;; label = @8
                    local.get 4
                    i32.const 1056240
                    i32.add
                    local.get 4
                    i32.const 1056228
                    i32.add
                    local.tee 3
                    i32.store
                    local.get 3
                    local.get 4
                    i32.const 1056220
                    i32.add
                    local.tee 6
                    i32.store
                    local.get 4
                    i32.const 1056232
                    i32.add
                    local.get 6
                    i32.store
                    local.get 4
                    i32.const 1056248
                    i32.add
                    local.get 4
                    i32.const 1056236
                    i32.add
                    local.tee 6
                    i32.store
                    local.get 6
                    local.get 3
                    i32.store
                    local.get 4
                    i32.const 1056256
                    i32.add
                    local.get 4
                    i32.const 1056244
                    i32.add
                    local.tee 3
                    i32.store
                    local.get 3
                    local.get 6
                    i32.store
                    local.get 4
                    i32.const 1056252
                    i32.add
                    local.get 3
                    i32.store
                    local.get 4
                    i32.const 32
                    i32.add
                    local.tee 4
                    i32.const 256
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 0
                  i32.const -8
                  local.get 0
                  i32.sub
                  i32.const 15
                  i32.and
                  i32.const 0
                  local.get 0
                  i32.const 8
                  i32.add
                  i32.const 15
                  i32.and
                  select
                  local.tee 4
                  i32.add
                  local.tee 3
                  local.get 7
                  i32.const -56
                  i32.add
                  local.tee 6
                  local.get 4
                  i32.sub
                  local.tee 4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=1056668
                  i32.store offset=1056208
                  i32.const 0
                  local.get 4
                  i32.store offset=1056192
                  i32.const 0
                  local.get 3
                  i32.store offset=1056204
                  local.get 0
                  local.get 6
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  br 2 (;@5;)
                end
                local.get 4
                i32.load8_u offset=12
                i32.const 8
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                local.get 0
                i32.ge_u
                br_if 0 (;@6;)
                local.get 3
                i32.const -8
                local.get 3
                i32.sub
                i32.const 15
                i32.and
                i32.const 0
                local.get 3
                i32.const 8
                i32.add
                i32.const 15
                i32.and
                select
                local.tee 6
                i32.add
                local.tee 0
                i32.const 0
                i32.load offset=1056192
                local.get 7
                i32.add
                local.tee 2
                local.get 6
                i32.sub
                local.tee 6
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 4
                local.get 9
                local.get 7
                i32.add
                i32.store offset=4
                i32.const 0
                i32.const 0
                i32.load offset=1056668
                i32.store offset=1056208
                i32.const 0
                local.get 6
                i32.store offset=1056192
                i32.const 0
                local.get 0
                i32.store offset=1056204
                local.get 3
                local.get 2
                i32.add
                i32.const 56
                i32.store offset=4
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 0
                i32.const 0
                i32.load offset=1056196
                local.tee 9
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 0
                i32.store offset=1056196
                local.get 0
                local.set 9
              end
              local.get 0
              local.get 7
              i32.add
              local.set 6
              i32.const 1056628
              local.set 4
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            loop  ;; label = @13
                              local.get 4
                              i32.load
                              local.get 6
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 4
                              i32.load offset=8
                              local.tee 4
                              br_if 0 (;@13;)
                              br 2 (;@11;)
                            end
                          end
                          local.get 4
                          i32.load8_u offset=12
                          i32.const 8
                          i32.and
                          i32.eqz
                          br_if 1 (;@10;)
                        end
                        i32.const 1056628
                        local.set 4
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 4
                            i32.load
                            local.tee 6
                            local.get 3
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 6
                            local.get 4
                            i32.load offset=4
                            i32.add
                            local.tee 6
                            local.get 3
                            i32.gt_u
                            br_if 3 (;@9;)
                          end
                          local.get 4
                          i32.load offset=8
                          local.set 4
                          br 0 (;@11;)
                        end
                      end
                      local.get 4
                      local.get 0
                      i32.store
                      local.get 4
                      local.get 4
                      i32.load offset=4
                      local.get 7
                      i32.add
                      i32.store offset=4
                      local.get 0
                      i32.const -8
                      local.get 0
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 0
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 2
                      local.get 5
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 6
                      i32.const -8
                      local.get 6
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 6
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 7
                      local.get 2
                      local.get 5
                      i32.add
                      local.tee 5
                      i32.sub
                      local.set 4
                      block  ;; label = @10
                        local.get 7
                        local.get 3
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 5
                        i32.store offset=1056204
                        i32.const 0
                        i32.const 0
                        i32.load offset=1056192
                        local.get 4
                        i32.add
                        local.tee 4
                        i32.store offset=1056192
                        local.get 5
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        local.get 7
                        i32.const 0
                        i32.load offset=1056200
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 5
                        i32.store offset=1056200
                        i32.const 0
                        i32.const 0
                        i32.load offset=1056188
                        local.get 4
                        i32.add
                        local.tee 4
                        i32.store offset=1056188
                        local.get 5
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 5
                        local.get 4
                        i32.add
                        local.get 4
                        i32.store
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        local.get 7
                        i32.load offset=4
                        local.tee 3
                        i32.const 3
                        i32.and
                        i32.const 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 3
                        i32.const -8
                        i32.and
                        local.set 8
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 3
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 7
                            i32.load offset=8
                            local.tee 6
                            local.get 3
                            i32.const 3
                            i32.shr_u
                            local.tee 9
                            i32.const 3
                            i32.shl
                            i32.const 1056220
                            i32.add
                            local.tee 0
                            i32.eq
                            drop
                            block  ;; label = @13
                              local.get 7
                              i32.load offset=12
                              local.tee 3
                              local.get 6
                              i32.ne
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=1056180
                              i32.const -2
                              local.get 9
                              i32.rotl
                              i32.and
                              i32.store offset=1056180
                              br 2 (;@11;)
                            end
                            local.get 3
                            local.get 0
                            i32.eq
                            drop
                            local.get 3
                            local.get 6
                            i32.store offset=8
                            local.get 6
                            local.get 3
                            i32.store offset=12
                            br 1 (;@11;)
                          end
                          local.get 7
                          i32.load offset=24
                          local.set 10
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 7
                              i32.load offset=12
                              local.tee 0
                              local.get 7
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 7
                              i32.load offset=8
                              local.tee 3
                              local.get 9
                              i32.lt_u
                              drop
                              local.get 0
                              local.get 3
                              i32.store offset=8
                              local.get 3
                              local.get 0
                              i32.store offset=12
                              br 1 (;@12;)
                            end
                            block  ;; label = @13
                              local.get 7
                              i32.const 20
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 6
                              br_if 0 (;@13;)
                              local.get 7
                              i32.const 16
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 6
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 0
                              br 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 3
                              local.set 9
                              local.get 6
                              local.tee 0
                              i32.const 20
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 6
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 16
                              i32.add
                              local.set 3
                              local.get 0
                              i32.load offset=16
                              local.tee 6
                              br_if 0 (;@13;)
                            end
                            local.get 9
                            i32.const 0
                            i32.store
                          end
                          local.get 10
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 7
                              local.get 7
                              i32.load offset=28
                              local.tee 6
                              i32.const 2
                              i32.shl
                              i32.const 1056484
                              i32.add
                              local.tee 3
                              i32.load
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 0
                              i32.store
                              local.get 0
                              br_if 1 (;@12;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=1056184
                              i32.const -2
                              local.get 6
                              i32.rotl
                              i32.and
                              i32.store offset=1056184
                              br 2 (;@11;)
                            end
                            local.get 10
                            i32.const 16
                            i32.const 20
                            local.get 10
                            i32.load offset=16
                            local.get 7
                            i32.eq
                            select
                            i32.add
                            local.get 0
                            i32.store
                            local.get 0
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          local.get 0
                          local.get 10
                          i32.store offset=24
                          block  ;; label = @12
                            local.get 7
                            i32.load offset=16
                            local.tee 3
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 3
                            i32.store offset=16
                            local.get 3
                            local.get 0
                            i32.store offset=24
                          end
                          local.get 7
                          i32.load offset=20
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 20
                          i32.add
                          local.get 3
                          i32.store
                          local.get 3
                          local.get 0
                          i32.store offset=24
                        end
                        local.get 8
                        local.get 4
                        i32.add
                        local.set 4
                        local.get 7
                        local.get 8
                        i32.add
                        local.tee 7
                        i32.load offset=4
                        local.set 3
                      end
                      local.get 7
                      local.get 3
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 5
                      local.get 4
                      i32.add
                      local.get 4
                      i32.store
                      local.get 5
                      local.get 4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      block  ;; label = @10
                        local.get 4
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const -8
                        i32.and
                        i32.const 1056220
                        i32.add
                        local.set 3
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1056180
                            local.tee 6
                            i32.const 1
                            local.get 4
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 4
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 6
                            local.get 4
                            i32.or
                            i32.store offset=1056180
                            local.get 3
                            local.set 4
                            br 1 (;@11;)
                          end
                          local.get 3
                          i32.load offset=8
                          local.set 4
                        end
                        local.get 4
                        local.get 5
                        i32.store offset=12
                        local.get 3
                        local.get 5
                        i32.store offset=8
                        local.get 5
                        local.get 3
                        i32.store offset=12
                        local.get 5
                        local.get 4
                        i32.store offset=8
                        br 3 (;@7;)
                      end
                      i32.const 31
                      local.set 3
                      block  ;; label = @10
                        local.get 4
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const 38
                        local.get 4
                        i32.const 8
                        i32.shr_u
                        i32.clz
                        local.tee 3
                        i32.sub
                        i32.shr_u
                        i32.const 1
                        i32.and
                        local.get 3
                        i32.const 1
                        i32.shl
                        i32.sub
                        i32.const 62
                        i32.add
                        local.set 3
                      end
                      local.get 5
                      local.get 3
                      i32.store offset=28
                      local.get 5
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 3
                      i32.const 2
                      i32.shl
                      i32.const 1056484
                      i32.add
                      local.set 6
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1056184
                        local.tee 0
                        i32.const 1
                        local.get 3
                        i32.shl
                        local.tee 9
                        i32.and
                        br_if 0 (;@10;)
                        local.get 6
                        local.get 5
                        i32.store
                        i32.const 0
                        local.get 0
                        local.get 9
                        i32.or
                        i32.store offset=1056184
                        local.get 5
                        local.get 6
                        i32.store offset=24
                        local.get 5
                        local.get 5
                        i32.store offset=8
                        local.get 5
                        local.get 5
                        i32.store offset=12
                        br 3 (;@7;)
                      end
                      local.get 4
                      i32.const 0
                      i32.const 25
                      local.get 3
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 3
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 3
                      local.get 6
                      i32.load
                      local.set 0
                      loop  ;; label = @10
                        local.get 0
                        local.tee 6
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 4
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 3
                        i32.const 29
                        i32.shr_u
                        local.set 0
                        local.get 3
                        i32.const 1
                        i32.shl
                        local.set 3
                        local.get 6
                        local.get 0
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 9
                        i32.load
                        local.tee 0
                        br_if 0 (;@10;)
                      end
                      local.get 9
                      local.get 5
                      i32.store
                      local.get 5
                      local.get 6
                      i32.store offset=24
                      local.get 5
                      local.get 5
                      i32.store offset=12
                      local.get 5
                      local.get 5
                      i32.store offset=8
                      br 2 (;@7;)
                    end
                    local.get 0
                    i32.const -8
                    local.get 0
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 0
                    i32.const 8
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    local.tee 4
                    i32.add
                    local.tee 2
                    local.get 7
                    i32.const -56
                    i32.add
                    local.tee 9
                    local.get 4
                    i32.sub
                    local.tee 4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 9
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    local.get 3
                    local.get 6
                    i32.const 55
                    local.get 6
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 6
                    i32.const -55
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    i32.add
                    i32.const -63
                    i32.add
                    local.tee 9
                    local.get 9
                    local.get 3
                    i32.const 16
                    i32.add
                    i32.lt_u
                    select
                    local.tee 9
                    i32.const 35
                    i32.store offset=4
                    i32.const 0
                    i32.const 0
                    i32.load offset=1056668
                    i32.store offset=1056208
                    i32.const 0
                    local.get 4
                    i32.store offset=1056192
                    i32.const 0
                    local.get 2
                    i32.store offset=1056204
                    local.get 9
                    i32.const 16
                    i32.add
                    i32.const 0
                    i64.load offset=1056636 align=4
                    i64.store align=4
                    local.get 9
                    i32.const 0
                    i64.load offset=1056628 align=4
                    i64.store offset=8 align=4
                    i32.const 0
                    local.get 9
                    i32.const 8
                    i32.add
                    i32.store offset=1056636
                    i32.const 0
                    local.get 7
                    i32.store offset=1056632
                    i32.const 0
                    local.get 0
                    i32.store offset=1056628
                    i32.const 0
                    i32.const 0
                    i32.store offset=1056640
                    local.get 9
                    i32.const 36
                    i32.add
                    local.set 4
                    loop  ;; label = @9
                      local.get 4
                      i32.const 7
                      i32.store
                      local.get 4
                      i32.const 4
                      i32.add
                      local.tee 4
                      local.get 6
                      i32.lt_u
                      br_if 0 (;@9;)
                    end
                    local.get 9
                    local.get 3
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 9
                    local.get 9
                    i32.load offset=4
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 9
                    local.get 9
                    local.get 3
                    i32.sub
                    local.tee 0
                    i32.store
                    local.get 3
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    block  ;; label = @9
                      local.get 0
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const -8
                      i32.and
                      i32.const 1056220
                      i32.add
                      local.set 4
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1056180
                          local.tee 6
                          i32.const 1
                          local.get 0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee 0
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 6
                          local.get 0
                          i32.or
                          i32.store offset=1056180
                          local.get 4
                          local.set 6
                          br 1 (;@10;)
                        end
                        local.get 4
                        i32.load offset=8
                        local.set 6
                      end
                      local.get 6
                      local.get 3
                      i32.store offset=12
                      local.get 4
                      local.get 3
                      i32.store offset=8
                      local.get 3
                      local.get 4
                      i32.store offset=12
                      local.get 3
                      local.get 6
                      i32.store offset=8
                      br 4 (;@5;)
                    end
                    i32.const 31
                    local.set 4
                    block  ;; label = @9
                      local.get 0
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 38
                      local.get 0
                      i32.const 8
                      i32.shr_u
                      i32.clz
                      local.tee 4
                      i32.sub
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get 4
                      i32.const 1
                      i32.shl
                      i32.sub
                      i32.const 62
                      i32.add
                      local.set 4
                    end
                    local.get 3
                    local.get 4
                    i32.store offset=28
                    local.get 3
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 4
                    i32.const 2
                    i32.shl
                    i32.const 1056484
                    i32.add
                    local.set 6
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1056184
                      local.tee 9
                      i32.const 1
                      local.get 4
                      i32.shl
                      local.tee 7
                      i32.and
                      br_if 0 (;@9;)
                      local.get 6
                      local.get 3
                      i32.store
                      i32.const 0
                      local.get 9
                      local.get 7
                      i32.or
                      i32.store offset=1056184
                      local.get 3
                      local.get 6
                      i32.store offset=24
                      local.get 3
                      local.get 3
                      i32.store offset=8
                      local.get 3
                      local.get 3
                      i32.store offset=12
                      br 4 (;@5;)
                    end
                    local.get 0
                    i32.const 0
                    i32.const 25
                    local.get 4
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 4
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 4
                    local.get 6
                    i32.load
                    local.set 9
                    loop  ;; label = @9
                      local.get 9
                      local.tee 6
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 0
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 4
                      i32.const 29
                      i32.shr_u
                      local.set 9
                      local.get 4
                      i32.const 1
                      i32.shl
                      local.set 4
                      local.get 6
                      local.get 9
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      local.tee 7
                      i32.load
                      local.tee 9
                      br_if 0 (;@9;)
                    end
                    local.get 7
                    local.get 3
                    i32.store
                    local.get 3
                    local.get 6
                    i32.store offset=24
                    local.get 3
                    local.get 3
                    i32.store offset=12
                    local.get 3
                    local.get 3
                    i32.store offset=8
                    br 3 (;@5;)
                  end
                  local.get 6
                  i32.load offset=8
                  local.tee 4
                  local.get 5
                  i32.store offset=12
                  local.get 6
                  local.get 5
                  i32.store offset=8
                  local.get 5
                  i32.const 0
                  i32.store offset=24
                  local.get 5
                  local.get 6
                  i32.store offset=12
                  local.get 5
                  local.get 4
                  i32.store offset=8
                end
                local.get 2
                i32.const 8
                i32.add
                local.set 4
                br 5 (;@1;)
              end
              local.get 6
              i32.load offset=8
              local.tee 4
              local.get 3
              i32.store offset=12
              local.get 6
              local.get 3
              i32.store offset=8
              local.get 3
              i32.const 0
              i32.store offset=24
              local.get 3
              local.get 6
              i32.store offset=12
              local.get 3
              local.get 4
              i32.store offset=8
            end
            i32.const 0
            i32.load offset=1056192
            local.tee 4
            local.get 5
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1056204
            local.tee 3
            local.get 5
            i32.add
            local.tee 6
            local.get 4
            local.get 5
            i32.sub
            local.tee 4
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.get 4
            i32.store offset=1056192
            i32.const 0
            local.get 6
            i32.store offset=1056204
            local.get 3
            local.get 5
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 3
            i32.const 8
            i32.add
            local.set 4
            br 3 (;@1;)
          end
          i32.const 0
          local.set 4
          i32.const 0
          i32.const 48
          i32.store offset=1056676
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 9
              local.get 9
              i32.load offset=28
              local.tee 6
              i32.const 2
              i32.shl
              i32.const 1056484
              i32.add
              local.tee 4
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              local.get 0
              i32.store
              local.get 0
              br_if 1 (;@4;)
              i32.const 0
              local.get 10
              i32.const -2
              local.get 6
              i32.rotl
              i32.and
              local.tee 10
              i32.store offset=1056184
              br 2 (;@3;)
            end
            local.get 2
            i32.const 16
            i32.const 20
            local.get 2
            i32.load offset=16
            local.get 9
            i32.eq
            select
            i32.add
            local.get 0
            i32.store
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 2
          i32.store offset=24
          block  ;; label = @4
            local.get 9
            i32.load offset=16
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            i32.store offset=16
            local.get 4
            local.get 0
            i32.store offset=24
          end
          local.get 9
          i32.const 20
          i32.add
          i32.load
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 20
          i32.add
          local.get 4
          i32.store
          local.get 4
          local.get 0
          i32.store offset=24
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 9
            local.get 3
            local.get 5
            i32.add
            local.tee 4
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 9
            local.get 4
            i32.add
            local.tee 4
            local.get 4
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 9
          local.get 5
          i32.add
          local.tee 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 9
          local.get 5
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
          block  ;; label = @4
            local.get 3
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const -8
            i32.and
            i32.const 1056220
            i32.add
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1056180
                local.tee 6
                i32.const 1
                local.get 3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 3
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 6
                local.get 3
                i32.or
                i32.store offset=1056180
                local.get 4
                local.set 3
                br 1 (;@5;)
              end
              local.get 4
              i32.load offset=8
              local.set 3
            end
            local.get 3
            local.get 0
            i32.store offset=12
            local.get 4
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 4
            i32.store offset=12
            local.get 0
            local.get 3
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 4
          block  ;; label = @4
            local.get 3
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 38
            local.get 3
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 4
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 4
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 4
          end
          local.get 0
          local.get 4
          i32.store offset=28
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          local.get 4
          i32.const 2
          i32.shl
          i32.const 1056484
          i32.add
          local.set 6
          block  ;; label = @4
            local.get 10
            i32.const 1
            local.get 4
            i32.shl
            local.tee 5
            i32.and
            br_if 0 (;@4;)
            local.get 6
            local.get 0
            i32.store
            i32.const 0
            local.get 10
            local.get 5
            i32.or
            i32.store offset=1056184
            local.get 0
            local.get 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 0
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.const 25
          local.get 4
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 4
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 4
          local.get 6
          i32.load
          local.set 5
          block  ;; label = @4
            loop  ;; label = @5
              local.get 5
              local.tee 6
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 3
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const 29
              i32.shr_u
              local.set 5
              local.get 4
              i32.const 1
              i32.shl
              local.set 4
              local.get 6
              local.get 5
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 7
              i32.load
              local.tee 5
              br_if 0 (;@5;)
            end
            local.get 7
            local.get 0
            i32.store
            local.get 0
            local.get 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 0
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 6
          i32.load offset=8
          local.tee 4
          local.get 0
          i32.store offset=12
          local.get 6
          local.get 0
          i32.store offset=8
          local.get 0
          i32.const 0
          i32.store offset=24
          local.get 0
          local.get 6
          i32.store offset=12
          local.get 0
          local.get 4
          i32.store offset=8
        end
        local.get 9
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 11
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 0
            i32.load offset=28
            local.tee 6
            i32.const 2
            i32.shl
            i32.const 1056484
            i32.add
            local.tee 4
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.get 9
            i32.store
            local.get 9
            br_if 1 (;@3;)
            i32.const 0
            local.get 10
            i32.const -2
            local.get 6
            i32.rotl
            i32.and
            i32.store offset=1056184
            br 2 (;@2;)
          end
          local.get 11
          i32.const 16
          i32.const 20
          local.get 11
          i32.load offset=16
          local.get 0
          i32.eq
          select
          i32.add
          local.get 9
          i32.store
          local.get 9
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 9
        local.get 11
        i32.store offset=24
        block  ;; label = @3
          local.get 0
          i32.load offset=16
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          local.get 4
          i32.store offset=16
          local.get 4
          local.get 9
          i32.store offset=24
        end
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        i32.const 20
        i32.add
        local.get 4
        i32.store
        local.get 4
        local.get 9
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 5
          i32.add
          local.tee 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 4
          i32.add
          local.tee 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 0
        local.get 5
        i32.add
        local.tee 6
        local.get 3
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        local.get 5
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 6
        local.get 3
        i32.add
        local.get 3
        i32.store
        block  ;; label = @3
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const -8
          i32.and
          i32.const 1056220
          i32.add
          local.set 5
          i32.const 0
          i32.load offset=1056200
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              i32.const 1
              local.get 8
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 9
              local.get 7
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 9
              local.get 7
              i32.or
              i32.store offset=1056180
              local.get 5
              local.set 9
              br 1 (;@4;)
            end
            local.get 5
            i32.load offset=8
            local.set 9
          end
          local.get 9
          local.get 4
          i32.store offset=12
          local.get 5
          local.get 4
          i32.store offset=8
          local.get 4
          local.get 5
          i32.store offset=12
          local.get 4
          local.get 9
          i32.store offset=8
        end
        i32.const 0
        local.get 6
        i32.store offset=1056200
        i32.const 0
        local.get 3
        i32.store offset=1056188
      end
      local.get 0
      i32.const 8
      i32.add
      local.set 4
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $free (type 1) (param i32)
    local.get 0
    call $dlfree)
  (func $dlfree (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.tee 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 2
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 3
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i32.load
        local.tee 2
        i32.sub
        local.tee 1
        i32.const 0
        i32.load offset=1056196
        local.tee 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          local.get 1
          i32.const 0
          i32.load offset=1056200
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 2
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=8
            local.tee 4
            local.get 2
            i32.const 3
            i32.shr_u
            local.tee 5
            i32.const 3
            i32.shl
            i32.const 1056220
            i32.add
            local.tee 6
            i32.eq
            drop
            block  ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 2
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=1056180
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1056180
              br 3 (;@2;)
            end
            local.get 2
            local.get 6
            i32.eq
            drop
            local.get 2
            local.get 4
            i32.store offset=8
            local.get 4
            local.get 2
            i32.store offset=12
            br 2 (;@2;)
          end
          local.get 1
          i32.load offset=24
          local.set 7
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 6
              local.get 1
              i32.eq
              br_if 0 (;@5;)
              local.get 1
              i32.load offset=8
              local.tee 2
              local.get 4
              i32.lt_u
              drop
              local.get 6
              local.get 2
              i32.store offset=8
              local.get 2
              local.get 6
              i32.store offset=12
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 1
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 1
              i32.const 16
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              br 1 (;@4;)
            end
            loop  ;; label = @5
              local.get 2
              local.set 5
              local.get 4
              local.tee 6
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 6
              i32.const 16
              i32.add
              local.set 2
              local.get 6
              i32.load offset=16
              local.tee 4
              br_if 0 (;@5;)
            end
            local.get 5
            i32.const 0
            i32.store
          end
          local.get 7
          i32.eqz
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.get 1
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 1056484
              i32.add
              local.tee 2
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1056184
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=1056184
              br 3 (;@2;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 1
            i32.eq
            select
            i32.add
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 6
          local.get 7
          i32.store offset=24
          block  ;; label = @4
            local.get 1
            i32.load offset=16
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 2
            i32.store offset=16
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 1
          i32.load offset=20
          local.tee 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 6
          i32.const 20
          i32.add
          local.get 2
          i32.store
          local.get 2
          local.get 6
          i32.store offset=24
          br 1 (;@2;)
        end
        local.get 3
        i32.load offset=4
        local.tee 2
        i32.const 3
        i32.and
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        i32.const 0
        local.get 0
        i32.store offset=1056188
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        return
      end
      local.get 1
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.tee 2
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 3
            i32.const 0
            i32.load offset=1056204
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=1056204
            i32.const 0
            i32.const 0
            i32.load offset=1056192
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=1056192
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            i32.const 0
            i32.load offset=1056200
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=1056188
            i32.const 0
            i32.const 0
            i32.store offset=1056200
            return
          end
          block  ;; label = @4
            local.get 3
            i32.const 0
            i32.load offset=1056200
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=1056200
            i32.const 0
            i32.const 0
            i32.load offset=1056188
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=1056188
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 0
            i32.add
            local.get 0
            i32.store
            return
          end
          local.get 2
          i32.const -8
          i32.and
          local.get 0
          i32.add
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 3
              i32.load offset=8
              local.tee 4
              local.get 2
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 1056220
              i32.add
              local.tee 6
              i32.eq
              drop
              block  ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 2
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=1056180
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=1056180
                br 2 (;@4;)
              end
              local.get 2
              local.get 6
              i32.eq
              drop
              local.get 2
              local.get 4
              i32.store offset=8
              local.get 4
              local.get 2
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 6
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=8
                local.tee 2
                i32.const 0
                i32.load offset=1056196
                i32.lt_u
                drop
                local.get 6
                local.get 2
                i32.store offset=8
                local.get 2
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 3
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 3
                i32.const 16
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 2
                local.set 5
                local.get 4
                local.tee 6
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 2
                local.get 6
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                local.get 3
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1056484
                i32.add
                local.tee 2
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 2
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1056184
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1056184
                br 2 (;@4;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 3
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block  ;; label = @5
              local.get 3
              i32.load offset=16
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 2
              i32.store offset=16
              local.get 2
              local.get 6
              i32.store offset=24
            end
            local.get 3
            i32.load offset=20
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.add
            local.get 2
            i32.store
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 1
          local.get 0
          i32.add
          local.get 0
          i32.store
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          i32.const 0
          i32.load offset=1056200
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=1056188
          return
        end
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
      end
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 1056220
        i32.add
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1056180
            local.tee 4
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 0
            i32.or
            i32.store offset=1056180
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 2
        local.get 1
        i32.store offset=8
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 1
      local.get 2
      i32.store offset=28
      local.get 1
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 1056484
      i32.add
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1056184
          local.tee 6
          i32.const 1
          local.get 2
          i32.shl
          local.tee 3
          i32.and
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.store
          i32.const 0
          local.get 6
          local.get 3
          i32.or
          i32.store offset=1056184
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=8
          local.get 1
          local.get 1
          i32.store offset=12
          br 1 (;@2;)
        end
        local.get 0
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 2
        local.get 4
        i32.load
        local.set 6
        block  ;; label = @3
          loop  ;; label = @4
            local.get 6
            local.tee 4
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 0
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 29
            i32.shr_u
            local.set 6
            local.get 2
            i32.const 1
            i32.shl
            local.set 2
            local.get 4
            local.get 6
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 3
            i32.load
            local.tee 6
            br_if 0 (;@4;)
          end
          local.get 3
          local.get 1
          i32.store
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 0
        local.get 1
        i32.store offset=12
        local.get 4
        local.get 1
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store offset=24
        local.get 1
        local.get 4
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
      end
      i32.const 0
      i32.const 0
      i32.load offset=1056212
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=1056212
    end)
  (func $calloc (type 4) (param i32 i32) (result i32)
    (local i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      i64.extend_i32_u
      local.get 1
      i64.extend_i32_u
      i64.mul
      local.tee 3
      i32.wrap_i64
      local.set 2
      local.get 1
      local.get 0
      i32.or
      i32.const 65536
      i32.lt_u
      br_if 0 (;@1;)
      i32.const -1
      local.get 2
      local.get 3
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      i32.const 0
      i32.ne
      select
      local.set 2
    end
    block  ;; label = @1
      local.get 2
      call $dlmalloc
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -4
      i32.add
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 2
      call $memset
      drop
    end
    local.get 0)
  (func $realloc (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    block  ;; label = @1
      local.get 1
      i32.const -64
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 48
      i32.store offset=1056676
      i32.const 0
      return
    end
    i32.const 16
    local.get 1
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    local.get 1
    i32.const 11
    i32.lt_u
    select
    local.set 2
    local.get 0
    i32.const -4
    i32.add
    local.tee 3
    i32.load
    local.tee 4
    i32.const -8
    i32.and
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.const 256
          i32.lt_u
          br_if 1 (;@2;)
          local.get 5
          local.get 2
          i32.const 4
          i32.or
          i32.lt_u
          br_if 1 (;@2;)
          local.get 5
          local.get 2
          i32.sub
          i32.const 0
          i32.load offset=1056660
          i32.const 1
          i32.shl
          i32.le_u
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        local.get 0
        i32.const -8
        i32.add
        local.tee 6
        local.get 5
        i32.add
        local.set 7
        block  ;; label = @3
          local.get 5
          local.get 2
          i32.lt_u
          br_if 0 (;@3;)
          local.get 5
          local.get 2
          i32.sub
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 2 (;@1;)
          local.get 3
          local.get 2
          local.get 4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 6
          local.get 2
          i32.add
          local.tee 2
          local.get 1
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 7
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          call $dispose_chunk
          local.get 0
          return
        end
        block  ;; label = @3
          local.get 7
          i32.const 0
          i32.load offset=1056204
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1056192
          local.get 5
          i32.add
          local.tee 5
          local.get 2
          i32.le_u
          br_if 1 (;@2;)
          local.get 3
          local.get 2
          local.get 4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          i32.const 0
          local.get 6
          local.get 2
          i32.add
          local.tee 1
          i32.store offset=1056204
          i32.const 0
          local.get 5
          local.get 2
          i32.sub
          local.tee 2
          i32.store offset=1056192
          local.get 1
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        block  ;; label = @3
          local.get 7
          i32.const 0
          i32.load offset=1056200
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1056188
          local.get 5
          i32.add
          local.tee 5
          local.get 2
          i32.lt_u
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              local.get 2
              i32.sub
              local.tee 1
              i32.const 16
              i32.lt_u
              br_if 0 (;@5;)
              local.get 3
              local.get 2
              local.get 4
              i32.const 1
              i32.and
              i32.or
              i32.const 2
              i32.or
              i32.store
              local.get 6
              local.get 2
              i32.add
              local.tee 2
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 6
              local.get 5
              i32.add
              local.tee 5
              local.get 1
              i32.store
              local.get 5
              local.get 5
              i32.load offset=4
              i32.const -2
              i32.and
              i32.store offset=4
              br 1 (;@4;)
            end
            local.get 3
            local.get 4
            i32.const 1
            i32.and
            local.get 5
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 6
            local.get 5
            i32.add
            local.tee 1
            local.get 1
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.set 1
            i32.const 0
            local.set 2
          end
          i32.const 0
          local.get 2
          i32.store offset=1056200
          i32.const 0
          local.get 1
          i32.store offset=1056188
          local.get 0
          return
        end
        local.get 7
        i32.load offset=4
        local.tee 8
        i32.const 2
        i32.and
        br_if 0 (;@2;)
        local.get 8
        i32.const -8
        i32.and
        local.get 5
        i32.add
        local.tee 9
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 9
        local.get 2
        i32.sub
        local.set 10
        block  ;; label = @3
          block  ;; label = @4
            local.get 8
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 7
            i32.load offset=8
            local.tee 1
            local.get 8
            i32.const 3
            i32.shr_u
            local.tee 11
            i32.const 3
            i32.shl
            i32.const 1056220
            i32.add
            local.tee 8
            i32.eq
            drop
            block  ;; label = @5
              local.get 7
              i32.load offset=12
              local.tee 5
              local.get 1
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=1056180
              i32.const -2
              local.get 11
              i32.rotl
              i32.and
              i32.store offset=1056180
              br 2 (;@3;)
            end
            local.get 5
            local.get 8
            i32.eq
            drop
            local.get 5
            local.get 1
            i32.store offset=8
            local.get 1
            local.get 5
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 7
          i32.load offset=24
          local.set 12
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.load offset=12
              local.tee 8
              local.get 7
              i32.eq
              br_if 0 (;@5;)
              local.get 7
              i32.load offset=8
              local.tee 1
              i32.const 0
              i32.load offset=1056196
              i32.lt_u
              drop
              local.get 8
              local.get 1
              i32.store offset=8
              local.get 1
              local.get 8
              i32.store offset=12
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 7
              i32.const 20
              i32.add
              local.tee 1
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              local.get 7
              i32.const 16
              i32.add
              local.tee 1
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              i32.const 0
              local.set 8
              br 1 (;@4;)
            end
            loop  ;; label = @5
              local.get 1
              local.set 11
              local.get 5
              local.tee 8
              i32.const 20
              i32.add
              local.tee 1
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              local.get 8
              i32.const 16
              i32.add
              local.set 1
              local.get 8
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
            end
            local.get 11
            i32.const 0
            i32.store
          end
          local.get 12
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              local.get 7
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 1056484
              i32.add
              local.tee 1
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 1
              local.get 8
              i32.store
              local.get 8
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1056184
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1056184
              br 2 (;@3;)
            end
            local.get 12
            i32.const 16
            i32.const 20
            local.get 12
            i32.load offset=16
            local.get 7
            i32.eq
            select
            i32.add
            local.get 8
            i32.store
            local.get 8
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 8
          local.get 12
          i32.store offset=24
          block  ;; label = @4
            local.get 7
            i32.load offset=16
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 8
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 8
            i32.store offset=24
          end
          local.get 7
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const 20
          i32.add
          local.get 1
          i32.store
          local.get 1
          local.get 8
          i32.store offset=24
        end
        block  ;; label = @3
          local.get 10
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i32.const 1
          i32.and
          local.get 9
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 6
          local.get 9
          i32.add
          local.tee 1
          local.get 1
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        local.get 3
        local.get 2
        local.get 4
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store
        local.get 6
        local.get 2
        i32.add
        local.tee 1
        local.get 10
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 6
        local.get 9
        i32.add
        local.tee 2
        local.get 2
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 10
        call $dispose_chunk
        local.get 0
        return
      end
      block  ;; label = @2
        local.get 1
        call $dlmalloc
        local.tee 2
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 2
      local.get 0
      i32.const -4
      i32.const -8
      local.get 3
      i32.load
      local.tee 5
      i32.const 3
      i32.and
      select
      local.get 5
      i32.const -8
      i32.and
      i32.add
      local.tee 5
      local.get 1
      local.get 5
      local.get 1
      i32.lt_u
      select
      call $memcpy
      local.set 1
      local.get 0
      call $dlfree
      local.get 1
      local.set 0
    end
    local.get 0)
  (func $dispose_chunk (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 3
            i32.sub
            local.tee 0
            i32.const 0
            i32.load offset=1056200
            i32.eq
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=8
              local.tee 4
              local.get 3
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 1056220
              i32.add
              local.tee 6
              i32.eq
              drop
              local.get 0
              i32.load offset=12
              local.tee 3
              local.get 4
              i32.ne
              br_if 2 (;@3;)
              i32.const 0
              i32.const 0
              i32.load offset=1056180
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1056180
              br 3 (;@2;)
            end
            local.get 0
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=12
                local.tee 6
                local.get 0
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=8
                local.tee 3
                i32.const 0
                i32.load offset=1056196
                i32.lt_u
                drop
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 3
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 0
                i32.const 20
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 0
                i32.const 16
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 3
                local.set 5
                local.get 4
                local.tee 6
                i32.const 20
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 3
                local.get 6
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                local.get 0
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1056484
                i32.add
                local.tee 3
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1056184
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1056184
                br 4 (;@2;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 0
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 3 (;@2;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block  ;; label = @5
              local.get 0
              i32.load offset=16
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 3
              i32.store offset=16
              local.get 3
              local.get 6
              i32.store offset=24
            end
            local.get 0
            i32.load offset=20
            local.tee 3
            i32.eqz
            br_if 2 (;@2;)
            local.get 6
            i32.const 20
            i32.add
            local.get 3
            i32.store
            local.get 3
            local.get 6
            i32.store offset=24
            br 2 (;@2;)
          end
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          local.get 2
          local.get 3
          i32.const -2
          i32.and
          i32.store offset=4
          i32.const 0
          local.get 1
          i32.store offset=1056188
          local.get 2
          local.get 1
          i32.store
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          return
        end
        local.get 3
        local.get 6
        i32.eq
        drop
        local.get 3
        local.get 4
        i32.store offset=8
        local.get 4
        local.get 3
        i32.store offset=12
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.const 2
          i32.and
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 2
            i32.const 0
            i32.load offset=1056204
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.store offset=1056204
            i32.const 0
            i32.const 0
            i32.load offset=1056192
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=1056192
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.load offset=1056200
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=1056188
            i32.const 0
            i32.const 0
            i32.store offset=1056200
            return
          end
          block  ;; label = @4
            local.get 2
            i32.const 0
            i32.load offset=1056200
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.store offset=1056200
            i32.const 0
            i32.const 0
            i32.load offset=1056188
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=1056188
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 1
            i32.add
            local.get 1
            i32.store
            return
          end
          local.get 3
          i32.const -8
          i32.and
          local.get 1
          i32.add
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=8
              local.tee 4
              local.get 3
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 1056220
              i32.add
              local.tee 6
              i32.eq
              drop
              block  ;; label = @6
                local.get 2
                i32.load offset=12
                local.tee 3
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=1056180
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=1056180
                br 2 (;@4;)
              end
              local.get 3
              local.get 6
              i32.eq
              drop
              local.get 3
              local.get 4
              i32.store offset=8
              local.get 4
              local.get 3
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.load offset=12
                local.tee 6
                local.get 2
                i32.eq
                br_if 0 (;@6;)
                local.get 2
                i32.load offset=8
                local.tee 3
                i32.const 0
                i32.load offset=1056196
                i32.lt_u
                drop
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 3
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 3
                br_if 0 (;@6;)
                local.get 2
                i32.const 16
                i32.add
                local.tee 4
                i32.load
                local.tee 3
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 4
                local.set 5
                local.get 3
                local.tee 6
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 3
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 4
                local.get 6
                i32.load offset=16
                local.tee 3
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                local.get 2
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1056484
                i32.add
                local.tee 3
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1056184
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1056184
                br 2 (;@4;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 2
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 3
              i32.store offset=16
              local.get 3
              local.get 6
              i32.store offset=24
            end
            local.get 2
            i32.load offset=20
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.add
            local.get 3
            i32.store
            local.get 3
            local.get 6
            i32.store offset=24
          end
          local.get 0
          local.get 1
          i32.add
          local.get 1
          i32.store
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          i32.const 0
          i32.load offset=1056200
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 1
          i32.store offset=1056188
          return
        end
        local.get 2
        local.get 3
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 0
        local.get 1
        i32.add
        local.get 1
        i32.store
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
      end
      block  ;; label = @2
        local.get 1
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const -8
        i32.and
        i32.const 1056220
        i32.add
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1056180
            local.tee 4
            i32.const 1
            local.get 1
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 1
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 1
            i32.or
            i32.store offset=1056180
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 3
          i32.load offset=8
          local.set 1
        end
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 3
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 3
        i32.store offset=12
        local.get 0
        local.get 1
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 3
      block  ;; label = @2
        local.get 1
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 38
        local.get 1
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 3
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 3
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 3
      end
      local.get 0
      local.get 3
      i32.store offset=28
      local.get 0
      i64.const 0
      i64.store offset=16 align=4
      local.get 3
      i32.const 2
      i32.shl
      i32.const 1056484
      i32.add
      local.set 4
      block  ;; label = @2
        i32.const 0
        i32.load offset=1056184
        local.tee 6
        i32.const 1
        local.get 3
        i32.shl
        local.tee 2
        i32.and
        br_if 0 (;@2;)
        local.get 4
        local.get 0
        i32.store
        i32.const 0
        local.get 6
        local.get 2
        i32.or
        i32.store offset=1056184
        local.get 0
        local.get 4
        i32.store offset=24
        local.get 0
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 0
        i32.store offset=12
        return
      end
      local.get 1
      i32.const 0
      i32.const 25
      local.get 3
      i32.const 1
      i32.shr_u
      i32.sub
      local.get 3
      i32.const 31
      i32.eq
      select
      i32.shl
      local.set 3
      local.get 4
      i32.load
      local.set 6
      block  ;; label = @2
        loop  ;; label = @3
          local.get 6
          local.tee 4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 3
          i32.const 29
          i32.shr_u
          local.set 6
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 4
          local.get 6
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee 2
          i32.load
          local.tee 6
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        i32.store
        local.get 0
        local.get 4
        i32.store offset=24
        local.get 0
        local.get 0
        i32.store offset=12
        local.get 0
        local.get 0
        i32.store offset=8
        return
      end
      local.get 4
      i32.load offset=8
      local.tee 1
      local.get 0
      i32.store offset=12
      local.get 4
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 4
      i32.store offset=12
      local.get 0
      local.get 1
      i32.store offset=8
    end)
  (func $internal_memalign (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 16
        local.get 0
        i32.const 16
        i32.gt_u
        select
        local.tee 2
        local.get 2
        i32.const -1
        i32.add
        i32.and
        br_if 0 (;@2;)
        local.get 2
        local.set 0
        br 1 (;@1;)
      end
      i32.const 32
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.tee 0
        i32.const 1
        i32.shl
        local.set 3
        local.get 0
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      i32.const -64
      local.get 0
      i32.sub
      local.get 1
      i32.gt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 48
      i32.store offset=1056676
      i32.const 0
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 16
      local.get 1
      i32.const 19
      i32.add
      i32.const -16
      i32.and
      local.get 1
      i32.const 11
      i32.lt_u
      select
      local.tee 1
      i32.add
      i32.const 12
      i32.add
      call $dlmalloc
      local.tee 3
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 3
    i32.const -8
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const -1
        i32.add
        local.get 3
        i32.and
        br_if 0 (;@2;)
        local.get 2
        local.set 0
        br 1 (;@1;)
      end
      local.get 3
      i32.const -4
      i32.add
      local.tee 4
      i32.load
      local.tee 5
      i32.const -8
      i32.and
      local.get 3
      local.get 0
      i32.add
      i32.const -1
      i32.add
      i32.const 0
      local.get 0
      i32.sub
      i32.and
      i32.const -8
      i32.add
      local.tee 3
      i32.const 0
      local.get 0
      local.get 3
      local.get 2
      i32.sub
      i32.const 15
      i32.gt_u
      select
      i32.add
      local.tee 0
      local.get 2
      i32.sub
      local.tee 3
      i32.sub
      local.set 6
      block  ;; label = @2
        local.get 5
        i32.const 3
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 6
        i32.store offset=4
        local.get 0
        local.get 2
        i32.load
        local.get 3
        i32.add
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      local.get 6
      local.get 0
      i32.load offset=4
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 6
      i32.add
      local.tee 6
      local.get 6
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 4
      local.get 3
      local.get 4
      i32.load
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store
      local.get 2
      local.get 3
      i32.add
      local.tee 6
      local.get 6
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 2
      local.get 3
      call $dispose_chunk
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 3
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const -8
      i32.and
      local.tee 2
      local.get 1
      i32.const 16
      i32.add
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 3
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.add
      local.tee 3
      local.get 2
      local.get 1
      i32.sub
      local.tee 1
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.add
      local.tee 2
      local.get 2
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 3
      local.get 1
      call $dispose_chunk
    end
    local.get 0
    i32.const 8
    i32.add)
  (func $aligned_alloc (type 4) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 16
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    local.get 0
    local.get 1
    call $internal_memalign)
  (func $_Exit (type 1) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $__wasilibc_ensure_environ (type 0)
    block  ;; label = @1
      i32.const 0
      i32.load offset=1056056
      i32.const -1
      i32.ne
      br_if 0 (;@1;)
      call $__wasilibc_initialize_environ
    end)
  (func $__wasilibc_initialize_environ (type 0)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 12
        i32.add
        local.get 0
        i32.const 8
        i32.add
        call $__wasi_environ_sizes_get
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.load offset=12
          local.tee 1
          br_if 0 (;@3;)
          i32.const 1056680
          local.set 1
          br 2 (;@1;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=8
            call $malloc
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 4
            call $calloc
            local.tee 1
            br_if 1 (;@3;)
            local.get 2
            call $free
          end
          i32.const 70
          call $_Exit
          unreachable
        end
        local.get 1
        local.get 2
        call $__wasi_environ_get
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        call $free
        local.get 1
        call $free
      end
      i32.const 71
      call $_Exit
      unreachable
    end
    i32.const 0
    local.get 1
    i32.store offset=1056056
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $__wasi_environ_get (type 4) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_environ_get
    i32.const 65535
    i32.and)
  (func $__wasi_environ_sizes_get (type 4) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_environ_sizes_get
    i32.const 65535
    i32.and)
  (func $__wasi_proc_exit (type 1) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable)
  (func $abort (type 0)
    unreachable
    unreachable)
  (func $getcwd (type 4) (param i32 i32) (result i32)
    (local i32)
    i32.const 0
    i32.load offset=1056060
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        local.get 2
        call $strdup
        local.tee 0
        br_if 1 (;@1;)
        i32.const 0
        i32.const 48
        i32.store offset=1056676
        i32.const 0
        return
      end
      block  ;; label = @2
        local.get 2
        call $strlen
        i32.const 1
        i32.add
        local.get 1
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 2
        call $strcpy
        return
      end
      i32.const 0
      local.set 0
      i32.const 0
      i32.const 68
      i32.store offset=1056676
    end
    local.get 0)
  (func $sbrk (type 3) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      memory.size
      i32.const 16
      i32.shl
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 48
        i32.store offset=1056676
        i32.const -1
        return
      end
      local.get 0
      i32.const 16
      i32.shl
      return
    end
    call $abort
    unreachable)
  (func $getenv (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    call $__wasilibc_ensure_environ
    block  ;; label = @1
      local.get 0
      i32.const 61
      call $__strchrnul
      local.tee 1
      local.get 0
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 0
      local.get 1
      local.get 0
      i32.sub
      local.tee 3
      i32.add
      i32.load8_u
      br_if 0 (;@1;)
      i32.const 0
      i32.load offset=1056056
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 4
      i32.add
      local.set 4
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 1
            local.get 3
            call $strncmp
            br_if 0 (;@4;)
            local.get 1
            local.get 3
            i32.add
            local.tee 1
            i32.load8_u
            i32.const 61
            i32.eq
            br_if 2 (;@2;)
          end
          local.get 4
          i32.load
          local.set 1
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 1
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 2
    end
    local.get 2)
  (func $dummy (type 0))
  (func $__wasm_call_dtors (type 0)
    call $dummy
    call $dummy)
  (func $memcpy (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 32
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i32.const -1
          i32.add
          local.set 3
          local.get 0
          i32.const 1
          i32.add
          local.set 4
          local.get 1
          i32.const 1
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 2
          i32.const -2
          i32.add
          local.set 3
          local.get 0
          i32.const 2
          i32.add
          local.set 4
          local.get 1
          i32.const 2
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=2
          i32.store8 offset=2
          local.get 2
          i32.const -3
          i32.add
          local.set 3
          local.get 0
          i32.const 3
          i32.add
          local.set 4
          local.get 1
          i32.const 3
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=3
          i32.store8 offset=3
          local.get 2
          i32.const -4
          i32.add
          local.set 3
          local.get 0
          i32.const 4
          i32.add
          local.set 4
          local.get 1
          i32.const 4
          i32.add
          local.set 5
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        local.get 2
        memory.copy
        local.get 0
        return
      end
      local.get 2
      local.set 3
      local.get 0
      local.set 4
      local.get 1
      local.set 5
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.const 3
        i32.and
        local.tee 2
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 16
            i32.ge_u
            br_if 0 (;@4;)
            local.get 3
            local.set 2
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 3
            i32.const -16
            i32.add
            local.tee 2
            i32.const 16
            i32.and
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 5
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            i32.const 16
            i32.add
            local.set 4
            local.get 5
            i32.const 16
            i32.add
            local.set 5
            local.get 2
            local.set 3
          end
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 3
          local.set 2
          loop  ;; label = @4
            local.get 4
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 5
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            local.get 5
            i64.load offset=16 align=4
            i64.store offset=16 align=4
            local.get 4
            local.get 5
            i64.load offset=24 align=4
            i64.store offset=24 align=4
            local.get 4
            i32.const 32
            i32.add
            local.set 4
            local.get 5
            i32.const 32
            i32.add
            local.set 5
            local.get 2
            i32.const -32
            i32.add
            local.tee 2
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 2
          i32.const 8
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i64.load align=4
          i64.store align=4
          local.get 5
          i32.const 8
          i32.add
          local.set 5
          local.get 4
          i32.const 8
          i32.add
          local.set 4
        end
        block  ;; label = @3
          local.get 2
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load
          i32.store
          local.get 5
          i32.const 4
          i32.add
          local.set 5
          local.get 4
          i32.const 4
          i32.add
          local.set 4
        end
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load16_u align=1
          i32.store16 align=1
          local.get 4
          i32.const 2
          i32.add
          local.set 4
          local.get 5
          i32.const 2
          i32.add
          local.set 5
        end
        local.get 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 5
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.const 32
                i32.lt_u
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    i32.const -1
                    i32.add
                    br_table 3 (;@5;) 0 (;@8;) 1 (;@7;) 7 (;@1;)
                  end
                  local.get 4
                  local.get 5
                  i32.load
                  i32.store16 align=1
                  local.get 4
                  local.get 5
                  i32.const 2
                  i32.add
                  i32.load align=2
                  i32.store offset=2
                  local.get 4
                  local.get 5
                  i32.const 6
                  i32.add
                  i64.load align=2
                  i64.store offset=6 align=4
                  local.get 4
                  i32.const 18
                  i32.add
                  local.set 2
                  local.get 5
                  i32.const 18
                  i32.add
                  local.set 1
                  i32.const 14
                  local.set 6
                  local.get 5
                  i32.const 14
                  i32.add
                  i32.load align=2
                  local.set 5
                  i32.const 14
                  local.set 3
                  br 3 (;@4;)
                end
                local.get 4
                local.get 5
                i32.load
                i32.store8
                local.get 4
                local.get 5
                i32.const 1
                i32.add
                i32.load align=1
                i32.store offset=1
                local.get 4
                local.get 5
                i32.const 5
                i32.add
                i64.load align=1
                i64.store offset=5 align=4
                local.get 4
                i32.const 17
                i32.add
                local.set 2
                local.get 5
                i32.const 17
                i32.add
                local.set 1
                i32.const 13
                local.set 6
                local.get 5
                i32.const 13
                i32.add
                i32.load align=1
                local.set 5
                i32.const 15
                local.set 3
                br 2 (;@4;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 16
                  i32.and
                  br_if 0 (;@7;)
                  local.get 4
                  local.set 2
                  local.get 5
                  local.set 1
                  br 1 (;@6;)
                end
                local.get 4
                local.get 5
                i32.load8_u
                i32.store8
                local.get 4
                local.get 5
                i32.load offset=1 align=1
                i32.store offset=1 align=1
                local.get 4
                local.get 5
                i64.load offset=5 align=1
                i64.store offset=5 align=1
                local.get 4
                local.get 5
                i32.load16_u offset=13 align=1
                i32.store16 offset=13 align=1
                local.get 4
                local.get 5
                i32.load8_u offset=15
                i32.store8 offset=15
                local.get 4
                i32.const 16
                i32.add
                local.set 2
                local.get 5
                i32.const 16
                i32.add
                local.set 1
              end
              local.get 3
              i32.const 8
              i32.and
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            local.get 4
            local.get 5
            i32.load
            local.tee 2
            i32.store8
            local.get 4
            local.get 2
            i32.const 16
            i32.shr_u
            i32.store8 offset=2
            local.get 4
            local.get 2
            i32.const 8
            i32.shr_u
            i32.store8 offset=1
            local.get 4
            local.get 5
            i32.const 3
            i32.add
            i32.load align=1
            i32.store offset=3
            local.get 4
            local.get 5
            i32.const 7
            i32.add
            i64.load align=1
            i64.store offset=7 align=4
            local.get 4
            i32.const 19
            i32.add
            local.set 2
            local.get 5
            i32.const 19
            i32.add
            local.set 1
            i32.const 15
            local.set 6
            local.get 5
            i32.const 15
            i32.add
            i32.load align=1
            local.set 5
            i32.const 13
            local.set 3
          end
          local.get 4
          local.get 6
          i32.add
          local.get 5
          i32.store
        end
        local.get 2
        local.get 1
        i64.load align=1
        i64.store align=1
        local.get 2
        i32.const 8
        i32.add
        local.set 2
        local.get 1
        i32.const 8
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 3
        i32.const 4
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.load align=1
        i32.store align=1
        local.get 2
        i32.const 4
        i32.add
        local.set 2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.load16_u align=1
        i32.store16 align=1
        local.get 2
        i32.const 2
        i32.add
        local.set 2
        local.get 1
        i32.const 2
        i32.add
        local.set 1
      end
      local.get 3
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func $memmove (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 33
          i32.ge_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          local.get 0
          local.get 2
          i32.add
          local.tee 3
          i32.sub
          i32.const 0
          local.get 2
          i32.const 1
          i32.shl
          i32.sub
          i32.gt_u
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 2
        memory.copy
        br 1 (;@1;)
      end
      local.get 1
      local.get 0
      i32.xor
      i32.const 3
      i32.and
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 1
            i32.ge_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.set 4
              local.get 0
              local.set 3
              br 3 (;@2;)
            end
            block  ;; label = @5
              local.get 0
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 2
              local.set 4
              local.get 0
              local.set 3
              br 2 (;@3;)
            end
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u
            i32.store8
            local.get 2
            i32.const -1
            i32.add
            local.set 4
            block  ;; label = @5
              local.get 0
              i32.const 1
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              br 2 (;@3;)
            end
            local.get 4
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 2
            i32.const -2
            i32.add
            local.set 4
            block  ;; label = @5
              local.get 0
              i32.const 2
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 1
              i32.const 2
              i32.add
              local.set 1
              br 2 (;@3;)
            end
            local.get 4
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u offset=2
            i32.store8 offset=2
            local.get 2
            i32.const -3
            i32.add
            local.set 4
            block  ;; label = @5
              local.get 0
              i32.const 3
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 1
              i32.const 3
              i32.add
              local.set 1
              br 2 (;@3;)
            end
            local.get 4
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u offset=3
            i32.store8 offset=3
            local.get 0
            i32.const 4
            i32.add
            local.set 3
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 2
            i32.const -4
            i32.add
            local.set 4
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 4
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.const 3
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -1
              i32.add
              local.tee 3
              i32.add
              local.tee 4
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              block  ;; label = @6
                local.get 4
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.set 2
                br 1 (;@5;)
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -2
              i32.add
              local.tee 3
              i32.add
              local.tee 4
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              block  ;; label = @6
                local.get 4
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.set 2
                br 1 (;@5;)
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -3
              i32.add
              local.tee 3
              i32.add
              local.tee 4
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              block  ;; label = @6
                local.get 4
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.set 2
                br 1 (;@5;)
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -4
              i32.add
              local.tee 2
              i32.add
              local.get 1
              local.get 2
              i32.add
              i32.load8_u
              i32.store8
            end
            local.get 2
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 2
              i32.const -4
              i32.add
              local.tee 5
              i32.const 2
              i32.shr_u
              i32.const 1
              i32.add
              i32.const 3
              i32.and
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.const -4
              i32.add
              local.set 4
              local.get 0
              i32.const -4
              i32.add
              local.set 6
              loop  ;; label = @6
                local.get 6
                local.get 2
                i32.add
                local.get 4
                local.get 2
                i32.add
                i32.load
                i32.store
                local.get 2
                i32.const -4
                i32.add
                local.set 2
                local.get 3
                i32.const -1
                i32.add
                local.tee 3
                br_if 0 (;@6;)
              end
            end
            local.get 5
            i32.const 12
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const -16
            i32.add
            local.set 6
            local.get 0
            i32.const -16
            i32.add
            local.set 5
            loop  ;; label = @5
              local.get 5
              local.get 2
              i32.add
              local.tee 3
              i32.const 12
              i32.add
              local.get 6
              local.get 2
              i32.add
              local.tee 4
              i32.const 12
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 8
              i32.add
              local.get 4
              i32.const 8
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.get 4
              i32.const 4
              i32.add
              i32.load
              i32.store
              local.get 3
              local.get 4
              i32.load
              i32.store
              local.get 2
              i32.const -16
              i32.add
              local.tee 2
              i32.const 3
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
          local.get 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 2
          i32.const -1
          i32.add
          local.set 5
          block  ;; label = @4
            local.get 2
            i32.const 3
            i32.and
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const -1
            i32.add
            local.set 4
            local.get 0
            i32.const -1
            i32.add
            local.set 6
            loop  ;; label = @5
              local.get 6
              local.get 2
              i32.add
              local.get 4
              local.get 2
              i32.add
              i32.load8_u
              i32.store8
              local.get 2
              i32.const -1
              i32.add
              local.set 2
              local.get 3
              i32.const -1
              i32.add
              local.tee 3
              br_if 0 (;@5;)
            end
          end
          local.get 5
          i32.const 3
          i32.lt_u
          br_if 2 (;@1;)
          local.get 1
          i32.const -4
          i32.add
          local.set 4
          local.get 0
          i32.const -4
          i32.add
          local.set 6
          loop  ;; label = @4
            local.get 6
            local.get 2
            i32.add
            local.tee 1
            i32.const 3
            i32.add
            local.get 4
            local.get 2
            i32.add
            local.tee 3
            i32.const 3
            i32.add
            i32.load8_u
            i32.store8
            local.get 1
            i32.const 2
            i32.add
            local.get 3
            i32.const 2
            i32.add
            i32.load8_u
            i32.store8
            local.get 1
            i32.const 1
            i32.add
            local.get 3
            i32.const 1
            i32.add
            i32.load8_u
            i32.store8
            local.get 1
            local.get 3
            i32.load8_u
            i32.store8
            local.get 2
            i32.const -4
            i32.add
            local.tee 2
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 4
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 4
          i32.const -4
          i32.add
          local.tee 6
          i32.const 2
          i32.shr_u
          i32.const 1
          i32.add
          i32.const 7
          i32.and
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 3
            local.get 1
            i32.load
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 3
            i32.const 4
            i32.add
            local.set 3
            local.get 4
            i32.const -4
            i32.add
            local.set 4
            local.get 2
            i32.const -1
            i32.add
            local.tee 2
            br_if 0 (;@4;)
          end
        end
        local.get 6
        i32.const 28
        i32.lt_u
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load
          i32.store
          local.get 3
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 3
          local.get 1
          i32.load offset=8
          i32.store offset=8
          local.get 3
          local.get 1
          i32.load offset=12
          i32.store offset=12
          local.get 3
          local.get 1
          i32.load offset=16
          i32.store offset=16
          local.get 3
          local.get 1
          i32.load offset=20
          i32.store offset=20
          local.get 3
          local.get 1
          i32.load offset=24
          i32.store offset=24
          local.get 3
          local.get 1
          i32.load offset=28
          i32.store offset=28
          local.get 1
          i32.const 32
          i32.add
          local.set 1
          local.get 3
          i32.const 32
          i32.add
          local.set 3
          local.get 4
          i32.const -32
          i32.add
          local.tee 4
          i32.const 3
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const -1
      i32.add
      local.set 6
      block  ;; label = @2
        local.get 4
        i32.const 7
        i32.and
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 4
          i32.const -1
          i32.add
          local.set 4
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          br_if 0 (;@3;)
        end
      end
      local.get 6
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        local.get 1
        i32.const 8
        i32.add
        local.set 1
        local.get 4
        i32.const -8
        i32.add
        local.tee 4
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $memset (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block  ;; label = @1
      local.get 2
      i32.const 33
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      memory.fill
      local.get 0
      return
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      local.get 0
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 5
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 3
      i32.store
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 1
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=8
      local.get 5
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=24
      local.get 5
      local.get 3
      i32.store offset=20
      local.get 5
      local.get 3
      i32.store offset=16
      local.get 5
      local.get 3
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 2
      i32.sub
      local.tee 1
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 6
      local.get 5
      local.get 2
      i32.add
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 6
        i64.store offset=24
        local.get 2
        local.get 6
        i64.store offset=16
        local.get 2
        local.get 6
        i64.store offset=8
        local.get 2
        local.get 6
        i64.store
        local.get 2
        i32.const 32
        i32.add
        local.set 2
        local.get 1
        i32.const -32
        i32.add
        local.tee 1
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $__strchrnul (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 255
            i32.and
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              local.get 0
              i32.load8_u
              local.tee 3
              br_if 0 (;@5;)
              local.get 0
              return
            end
            local.get 3
            local.get 1
            i32.const 255
            i32.and
            i32.ne
            br_if 1 (;@3;)
            local.get 0
            return
          end
          local.get 0
          local.get 0
          call $strlen
          i32.add
          return
        end
        block  ;; label = @3
          local.get 0
          i32.const 1
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 0
          i32.const 2
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.set 0
      end
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        i32.const -1
        i32.xor
        local.get 3
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 16843009
        i32.mul
        local.set 2
        loop  ;; label = @3
          local.get 3
          local.get 2
          i32.xor
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 0
          i32.const 4
          i32.add
          local.tee 0
          i32.load
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.const -1
      i32.add
      local.set 3
      loop  ;; label = @2
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.load8_u
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.const 255
        i32.and
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 3)
  (func $__stpcpy (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 0
          i32.xor
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load8_u
          local.set 2
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.load8_u
          local.tee 2
          i32.store8
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 0
            return
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 2
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 0
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.load8_u
          local.tee 3
          i32.store8
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 2
          i32.add
          local.set 2
          block  ;; label = @4
            local.get 1
            i32.const 2
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 0
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.load8_u
          local.tee 3
          i32.store8
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 3
          i32.add
          local.set 2
          block  ;; label = @4
            local.get 1
            i32.const 3
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 0
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.load8_u
          local.tee 3
          i32.store8
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.set 1
        end
        local.get 1
        i32.load
        local.tee 2
        i32.const -1
        i32.xor
        local.get 2
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 0
          local.get 2
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.tee 1
          i32.load
          local.tee 2
          i32.const -1
          i32.xor
          local.get 2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 2
      i32.store8
      block  ;; label = @2
        local.get 2
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        local.get 0
        return
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 1
        i32.load8_u
        local.tee 0
        i32.store8 offset=1
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        local.get 0
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func $strcpy (type 4) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__stpcpy
    drop
    local.get 0)
  (func $strdup (type 3) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      call $strlen
      i32.const 1
      i32.add
      local.tee 1
      call $malloc
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      local.get 1
      call $memcpy
      drop
    end
    local.get 2)
  (func $dummy.1 (type 4) (param i32 i32) (result i32)
    local.get 0)
  (func $__lctrans (type 4) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $dummy.1)
  (func $strerror (type 3) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=1056708
      local.tee 1
      br_if 0 (;@1;)
      i32.const 1056684
      local.set 1
      i32.const 0
      i32.const 1056684
      i32.store offset=1056708
    end
    i32.const 0
    local.get 0
    local.get 0
    i32.const 76
    i32.gt_u
    select
    i32.const 1
    i32.shl
    i32.const 1054464
    i32.add
    i32.load16_u
    i32.const 1052898
    i32.add
    local.get 1
    i32.load offset=20
    call $__lctrans)
  (func $strerror_r (type 6) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        call $strerror
        local.tee 0
        call $strlen
        local.tee 3
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 68
        local.set 3
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        call $memcpy
        local.get 2
        i32.add
        i32.const 0
        i32.store8
        i32.const 68
        return
      end
      local.get 1
      local.get 0
      local.get 3
      i32.const 1
      i32.add
      call $memcpy
      drop
      i32.const 0
      local.set 3
    end
    local.get 3)
  (func $strlen (type 3) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 1
        local.get 0
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 1
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 2
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 3
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.set 1
      end
      local.get 1
      i32.const -5
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 5
        i32.add
        local.set 2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        local.get 2
        i32.load
        local.tee 2
        i32.const -1
        i32.xor
        local.get 2
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        i32.eqz
        br_if 0 (;@2;)
      end
      loop  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.load8_u
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i32.sub)
  (func $strncmp (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.load8_u
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 2
      i32.const -1
      i32.add
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load8_u
          local.tee 5
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          local.get 5
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 0
        i32.load8_u
        local.set 4
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 4
        br_if 0 (;@2;)
      end
    end
    local.get 3
    i32.const 255
    i32.and
    local.get 1
    i32.load8_u
    i32.sub)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h2e17edb63ca4ceefE (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.set 0
    block  ;; label = @1
      local.get 1
      call $_ZN4core3fmt9Formatter15debug_lower_hex17h664ac1e13fe0f150E
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        call $_ZN4core3fmt9Formatter15debug_upper_hex17hb39a5ad72f656bb3E
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h63ea37767eb5b48bE
        return
      end
      local.get 0
      local.get 1
      call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$3fmt17h827476b06538be7cE
      return
    end
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$3fmt17hf3b2ed3d26336b39E)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h53f1661e1d3ca33dE (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 0
    i32.load offset=8
    local.set 3
    local.get 0
    i32.load
    local.set 0
    local.get 2
    local.get 1
    call $_ZN4core3fmt9Formatter10debug_list17h5721f0bd814d30e6E
    block  ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.store offset=12
        local.get 2
        local.get 2
        i32.const 12
        i32.add
        i32.const 1054620
        call $_ZN4core3fmt8builders8DebugSet5entry17h7150245ca659dcacE
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 3
        i32.const -1
        i32.add
        local.tee 3
        br_if 0 (;@2;)
      end
    end
    local.get 2
    call $_ZN4core3fmt8builders9DebugList6finish17hd58a034686c0a295E
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h57e5d6d92df4f277E (type 4) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 1
      call $_ZN4core3fmt9Formatter15debug_lower_hex17h664ac1e13fe0f150E
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        call $_ZN4core3fmt9Formatter15debug_upper_hex17hb39a5ad72f656bb3E
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4fbd4b654b964086E
        return
      end
      local.get 0
      local.get 1
      call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h430f08a50696f267E
      return
    end
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17hf7cbfbf8e026c195E)
  (func $_ZN4core3ptr26drop_in_place$LT$usize$GT$17h8a70431a17b00a9dE (type 1) (param i32))
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h360a46831ba2dfccE (type 1) (param i32))
  (func $_ZN5alloc7raw_vec11finish_grow17h5538b12d95552e36E (type 9) (param i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const -1
        i32.le_s
        br_if 1 (;@1;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.const 8
                  i32.add
                  i32.load
                  local.tee 1
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 1
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1056069
                  drop
                  local.get 2
                  i32.const 1
                  call $__rust_alloc
                  local.set 1
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 1
                i32.const 1
                local.get 2
                call $__rust_realloc
                local.set 1
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 1
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1056069
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.set 1
            end
            local.get 1
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 1
          i32.store offset=4
          local.get 0
          i32.const 8
          i32.add
          local.get 2
          i32.store
          local.get 0
          i32.const 0
          i32.store
          return
        end
        local.get 0
        i32.const 1
        i32.store offset=4
        local.get 0
        i32.const 8
        i32.add
        local.get 2
        i32.store
        local.get 0
        i32.const 1
        i32.store
        return
      end
      local.get 0
      i32.const 0
      i32.store offset=4
      local.get 0
      i32.const 8
      i32.add
      local.get 2
      i32.store
      local.get 0
      i32.const 1
      i32.store
      return
    end
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    i32.const 1
    i32.store)
  (func $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E (type 2) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN5alloc5alloc18handle_alloc_error8rt_error17hb51ed5ed7a7011fbE
    unreachable)
  (func $_ZN5alloc7raw_vec17capacity_overflow17ha2fa7309cb777b97E (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 20
    i32.add
    i64.const 0
    i64.store align=4
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1054684
    i32.store offset=8
    local.get 0
    i32.const 1054636
    i32.store offset=16
    local.get 0
    i32.const 8
    i32.add
    i32.const 1054692
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h0077ecf4ef1af0ddE (type 2) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 4
        i32.add
        i32.load
        local.tee 3
        i32.const 1
        i32.shl
        local.tee 4
        local.get 1
        local.get 4
        local.get 1
        i32.gt_u
        select
        local.tee 1
        i32.const 8
        local.get 1
        i32.const 8
        i32.gt_u
        select
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 31
        i32.shr_u
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.store offset=24
            local.get 2
            i32.const 1
            i32.store offset=20
            local.get 2
            local.get 0
            i32.load
            i32.store offset=16
            br 1 (;@3;)
          end
          local.get 2
          i32.const 0
          i32.store offset=20
        end
        local.get 2
        local.get 4
        local.get 1
        local.get 2
        i32.const 16
        i32.add
        call $_ZN5alloc7raw_vec11finish_grow17h5538b12d95552e36E
        local.get 2
        i32.load offset=4
        local.set 3
        block  ;; label = @3
          local.get 2
          i32.load
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.get 1
          i32.store
          br 2 (;@1;)
        end
        local.get 3
        i32.const -2147483647
        i32.eq
        br_if 1 (;@1;)
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.const 8
        i32.add
        i32.load
        call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
        unreachable
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17ha2fa7309cb777b97E
      unreachable
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN5alloc5alloc18handle_alloc_error8rt_error17hb51ed5ed7a7011fbE (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $__rust_alloc_error_handler
    unreachable)
  (func $_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17heacf9a7d517be95cE (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 1
              i32.add
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              i32.const -1
              i32.le_s
              br_if 1 (;@4;)
              i32.const 0
              i32.load8_u offset=1056069
              drop
              local.get 4
              i32.const 1
              call $__rust_alloc
              local.tee 5
              i32.eqz
              br_if 2 (;@3;)
              local.get 5
              local.get 1
              local.get 2
              call $memcpy
              local.set 6
              block  ;; label = @6
                local.get 2
                i32.const 8
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                i32.const 8
                i32.add
                i32.const 0
                local.get 1
                local.get 2
                call $_ZN4core5slice6memchr14memchr_aligned17h44220a3c88e412c1E
                local.get 3
                i32.load offset=12
                local.set 7
                local.get 3
                i32.load offset=8
                local.set 8
                br 5 (;@1;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 0
                local.set 7
                i32.const 0
                local.set 8
                br 5 (;@1;)
              end
              block  ;; label = @6
                local.get 1
                i32.load8_u
                br_if 0 (;@6;)
                i32.const 1
                local.set 8
                i32.const 0
                local.set 7
                br 5 (;@1;)
              end
              i32.const 1
              local.set 8
              local.get 2
              i32.const 1
              i32.eq
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 1
                i32.load8_u offset=1
                br_if 0 (;@6;)
                i32.const 1
                local.set 7
                br 5 (;@1;)
              end
              i32.const 2
              local.set 7
              local.get 2
              i32.const 2
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=2
              i32.eqz
              br_if 4 (;@1;)
              i32.const 3
              local.set 7
              local.get 2
              i32.const 3
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=3
              i32.eqz
              br_if 4 (;@1;)
              i32.const 4
              local.set 7
              local.get 2
              i32.const 4
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=4
              i32.eqz
              br_if 4 (;@1;)
              i32.const 5
              local.set 7
              local.get 2
              i32.const 5
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=5
              i32.eqz
              br_if 4 (;@1;)
              local.get 2
              local.set 7
              i32.const 0
              local.set 8
              local.get 2
              i32.const 6
              i32.eq
              br_if 4 (;@1;)
              local.get 2
              i32.const 6
              local.get 1
              i32.load8_u offset=6
              local.tee 1
              select
              local.set 7
              local.get 1
              i32.eqz
              local.set 8
              br 4 (;@1;)
            end
            i32.const 1054708
            i32.const 43
            i32.const 1054784
            call $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E
            unreachable
          end
          call $_ZN5alloc7raw_vec17capacity_overflow17ha2fa7309cb777b97E
          unreachable
        end
        i32.const 1
        local.get 4
        call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
        unreachable
      end
      local.get 2
      local.set 7
      i32.const 0
      local.set 8
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 8
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.store offset=24
        local.get 3
        local.get 4
        i32.store offset=20
        local.get 3
        local.get 6
        i32.store offset=16
        local.get 3
        local.get 3
        i32.const 16
        i32.add
        call $_ZN5alloc3ffi5c_str7CString19_from_vec_unchecked17h176ddfd6a3ad6becE
        local.get 0
        local.get 3
        i64.load
        i64.store offset=4 align=4
        i32.const 0
        local.set 5
        br 1 (;@1;)
      end
      local.get 0
      local.get 2
      i32.store offset=8
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      local.get 7
      i32.store offset=12
    end
    local.get 0
    local.get 5
    i32.store
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN5alloc3ffi5c_str7CString19_from_vec_unchecked17h176ddfd6a3ad6becE (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.tee 3
              local.get 1
              i32.load offset=8
              local.tee 4
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              i32.const 1
              i32.add
              local.tee 3
              i32.eqz
              br_if 2 (;@3;)
              local.get 3
              i32.const -1
              i32.xor
              i32.const 31
              i32.shr_u
              local.set 5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 4
                  i32.store offset=24
                  local.get 2
                  i32.const 1
                  i32.store offset=20
                  local.get 2
                  local.get 1
                  i32.load
                  i32.store offset=16
                  br 1 (;@6;)
                end
                local.get 2
                i32.const 0
                i32.store offset=20
              end
              local.get 2
              local.get 5
              local.get 3
              local.get 2
              i32.const 16
              i32.add
              call $_ZN5alloc7raw_vec11finish_grow17h5538b12d95552e36E
              local.get 2
              i32.load offset=4
              local.set 5
              local.get 2
              i32.load
              br_if 1 (;@4;)
              local.get 1
              local.get 5
              i32.store
              local.get 1
              i32.const 4
              i32.add
              local.get 3
              i32.store
            end
            local.get 4
            local.get 3
            i32.ne
            br_if 3 (;@1;)
            br 2 (;@2;)
          end
          local.get 5
          i32.const -2147483647
          i32.eq
          br_if 1 (;@2;)
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 2
          i32.const 8
          i32.add
          i32.load
          call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
          unreachable
        end
        call $_ZN5alloc7raw_vec17capacity_overflow17ha2fa7309cb777b97E
        unreachable
      end
      local.get 1
      local.get 4
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h0077ecf4ef1af0ddE
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.set 3
      local.get 1
      i32.load offset=8
      local.set 4
    end
    local.get 1
    local.get 4
    i32.const 1
    i32.add
    local.tee 5
    i32.store offset=8
    local.get 1
    i32.load
    local.tee 1
    local.get 4
    i32.add
    i32.const 0
    i32.store8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          local.get 5
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          local.set 4
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          i32.const 1
          local.set 4
          local.get 1
          local.get 3
          i32.const 1
          call $__rust_dealloc
          br 1 (;@2;)
        end
        local.get 1
        local.get 3
        i32.const 1
        local.get 5
        call $__rust_realloc
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 5
      i32.store offset=4
      local.get 0
      local.get 4
      i32.store
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1
    local.get 5
    call $_ZN5alloc5alloc18handle_alloc_error17hac4f7515a97bd968E
    unreachable)
  (func $_ZN5alloc4sync32arcinner_layout_for_value_layout17h789f4a8a8dd91a05E (type 5) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.const 7
      i32.add
      i32.const 0
      local.get 1
      i32.sub
      i32.and
      local.tee 4
      local.get 4
      i32.const -8
      i32.add
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 2
      i32.add
      local.tee 2
      local.get 4
      i32.lt_u
      br_if 0 (;@1;)
      local.get 2
      i32.const -2147483648
      local.get 1
      i32.const 4
      local.get 1
      i32.const 4
      i32.gt_u
      select
      local.tee 1
      i32.sub
      i32.gt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 1
      local.get 2
      i32.add
      i32.const -1
      i32.add
      i32.const 0
      local.get 1
      i32.sub
      i32.and
      i32.store offset=4
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1054800
    i32.const 43
    local.get 3
    i32.const 8
    i32.add
    i32.const 1054844
    i32.const 1054888
    call $_ZN4core6result13unwrap_failed17hf48c8310675f070eE
    unreachable)
  (func $_ZN64_$LT$alloc..ffi..c_str..NulError$u20$as$u20$core..fmt..Debug$GT$3fmt17ha8a7836e4987d8caE (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 1
    i32.const 1054904
    i32.const 8
    local.get 0
    i32.const 12
    i32.add
    i32.const 1054912
    local.get 2
    i32.const 12
    i32.add
    i32.const 1054928
    call $_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h98426a452fcf5ad4E
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3ops8function6FnOnce9call_once17h6f4abb2291c2f20eE (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    drop
    loop (result i32)  ;; label = @1
      br 0 (;@1;)
    end)
  (func $_ZN4core3ptr102drop_in_place$LT$$RF$core..iter..adapters..copied..Copied$LT$core..slice..iter..Iter$LT$u8$GT$$GT$$GT$17h961389ecbf7edbd3E (type 1) (param i32))
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17hf7a381062dad12b3E (type 1) (param i32))
  (func $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=20
    local.get 2
    i32.const 1055028
    i32.store offset=12
    local.get 2
    i32.const 1054944
    i32.store offset=8
    local.get 2
    i32.const 1
    i32.store8 offset=24
    local.get 2
    local.get 1
    i32.store offset=16
    local.get 2
    i32.const 8
    i32.add
    call $rust_begin_unwind
    unreachable)
  (func $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E (type 5) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 8
    i32.add
    i32.const 12
    i32.add
    i64.const 2
    i64.store align=4
    local.get 3
    i32.const 32
    i32.add
    i32.const 12
    i32.add
    i32.const 11
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1055664
    i32.store offset=8
    local.get 3
    i32.const 11
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN4core5slice5index24slice_end_index_len_fail17h392bb1693dec020aE (type 5) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 8
    i32.add
    i32.const 12
    i32.add
    i64.const 2
    i64.store align=4
    local.get 3
    i32.const 32
    i32.add
    i32.const 12
    i32.add
    i32.const 11
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1055696
    i32.store offset=8
    local.get 3
    i32.const 11
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN4core3fmt9Formatter3pad17hff4ffeb08667be0eE (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        local.get 0
        i32.load offset=8
        local.tee 4
        i32.or
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          i32.add
          local.set 5
          local.get 0
          i32.const 12
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.set 6
          i32.const 0
          local.set 7
          local.get 1
          local.set 8
          block  ;; label = @4
            loop  ;; label = @5
              local.get 8
              local.set 4
              local.get 6
              i32.const -1
              i32.add
              local.tee 6
              i32.eqz
              br_if 1 (;@4;)
              local.get 4
              local.get 5
              i32.eq
              br_if 2 (;@3;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.load8_s
                  local.tee 9
                  i32.const -1
                  i32.le_s
                  br_if 0 (;@7;)
                  local.get 4
                  i32.const 1
                  i32.add
                  local.set 8
                  local.get 9
                  i32.const 255
                  i32.and
                  local.set 9
                  br 1 (;@6;)
                end
                local.get 4
                i32.load8_u offset=1
                i32.const 63
                i32.and
                local.set 10
                local.get 9
                i32.const 31
                i32.and
                local.set 8
                block  ;; label = @7
                  local.get 9
                  i32.const -33
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const 6
                  i32.shl
                  local.get 10
                  i32.or
                  local.set 9
                  local.get 4
                  i32.const 2
                  i32.add
                  local.set 8
                  br 1 (;@6;)
                end
                local.get 10
                i32.const 6
                i32.shl
                local.get 4
                i32.load8_u offset=2
                i32.const 63
                i32.and
                i32.or
                local.set 10
                block  ;; label = @7
                  local.get 9
                  i32.const -16
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 10
                  local.get 8
                  i32.const 12
                  i32.shl
                  i32.or
                  local.set 9
                  local.get 4
                  i32.const 3
                  i32.add
                  local.set 8
                  br 1 (;@6;)
                end
                local.get 10
                i32.const 6
                i32.shl
                local.get 4
                i32.load8_u offset=3
                i32.const 63
                i32.and
                i32.or
                local.get 8
                i32.const 18
                i32.shl
                i32.const 1835008
                i32.and
                i32.or
                local.tee 9
                i32.const 1114112
                i32.eq
                br_if 3 (;@3;)
                local.get 4
                i32.const 4
                i32.add
                local.set 8
              end
              local.get 7
              local.get 4
              i32.sub
              local.get 8
              i32.add
              local.set 7
              local.get 9
              i32.const 1114112
              i32.ne
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 4
          local.get 5
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 4
            i32.load8_s
            local.tee 8
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            local.get 8
            i32.const -32
            i32.lt_u
            br_if 0 (;@4;)
            local.get 8
            i32.const -16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 4
            i32.load8_u offset=2
            i32.const 63
            i32.and
            i32.const 6
            i32.shl
            local.get 4
            i32.load8_u offset=1
            i32.const 63
            i32.and
            i32.const 12
            i32.shl
            i32.or
            local.get 4
            i32.load8_u offset=3
            i32.const 63
            i32.and
            i32.or
            local.get 8
            i32.const 255
            i32.and
            i32.const 18
            i32.shl
            i32.const 1835008
            i32.and
            i32.or
            i32.const 1114112
            i32.eq
            br_if 1 (;@3;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 7
                local.get 2
                i32.lt_u
                br_if 0 (;@6;)
                i32.const 0
                local.set 4
                local.get 7
                local.get 2
                i32.eq
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              i32.const 0
              local.set 4
              local.get 1
              local.get 7
              i32.add
              i32.load8_s
              i32.const -64
              i32.lt_s
              br_if 1 (;@4;)
            end
            local.get 1
            local.set 4
          end
          local.get 7
          local.get 2
          local.get 4
          select
          local.set 2
          local.get 4
          local.get 1
          local.get 4
          select
          local.set 1
        end
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=20
          local.get 1
          local.get 2
          local.get 0
          i32.const 24
          i32.add
          i32.load
          i32.load offset=12
          call_indirect (type 6)
          return
        end
        local.get 0
        i32.load offset=4
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            local.get 2
            call $_ZN4core3str5count14do_count_chars17he3295d89edff7ffdE
            local.set 4
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          i32.const 3
          i32.and
          local.set 6
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 4
              i32.ge_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 4
              i32.const 0
              local.set 9
              br 1 (;@4;)
            end
            local.get 2
            i32.const -4
            i32.and
            local.set 7
            i32.const 0
            local.set 4
            i32.const 0
            local.set 9
            loop  ;; label = @5
              local.get 4
              local.get 1
              local.get 9
              i32.add
              local.tee 8
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 8
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 8
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 8
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 4
              local.get 7
              local.get 9
              i32.const 4
              i32.add
              local.tee 9
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 9
          i32.add
          local.set 8
          loop  ;; label = @4
            local.get 4
            local.get 8
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 4
            local.get 8
            i32.const 1
            i32.add
            local.set 8
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            br_if 0 (;@4;)
          end
        end
        local.get 5
        local.get 4
        i32.le_u
        br_if 1 (;@1;)
        i32.const 0
        local.set 8
        local.get 5
        local.get 4
        i32.sub
        local.tee 4
        local.set 7
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load8_u offset=32
              br_table 2 (;@3;) 0 (;@5;) 1 (;@4;) 2 (;@3;) 2 (;@3;)
            end
            i32.const 0
            local.set 7
            local.get 4
            local.set 8
            br 1 (;@3;)
          end
          local.get 4
          i32.const 1
          i32.shr_u
          local.set 8
          local.get 4
          i32.const 1
          i32.add
          i32.const 1
          i32.shr_u
          local.set 7
        end
        local.get 8
        i32.const 1
        i32.add
        local.set 4
        local.get 0
        i32.const 24
        i32.add
        i32.load
        local.set 9
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.set 6
        local.get 0
        i32.load offset=16
        local.set 8
        block  ;; label = @3
          loop  ;; label = @4
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            i32.eqz
            br_if 1 (;@3;)
            local.get 6
            local.get 8
            local.get 9
            i32.load offset=16
            call_indirect (type 4)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        i32.const 1
        local.set 4
        block  ;; label = @3
          local.get 8
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 1
          local.get 2
          local.get 9
          i32.load offset=12
          call_indirect (type 6)
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          block  ;; label = @4
            loop  ;; label = @5
              block  ;; label = @6
                local.get 7
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                local.get 7
                local.set 4
                br 2 (;@4;)
              end
              local.get 4
              i32.const 1
              i32.add
              local.set 4
              local.get 6
              local.get 8
              local.get 9
              i32.load offset=16
              call_indirect (type 4)
              i32.eqz
              br_if 0 (;@5;)
            end
            local.get 4
            i32.const -1
            i32.add
            local.set 4
          end
          local.get 4
          local.get 7
          i32.lt_u
          local.set 4
        end
        local.get 4
        return
      end
      local.get 0
      i32.load offset=20
      local.get 1
      local.get 2
      local.get 0
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 6)
      return
    end
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 6))
  (func $_ZN4core9panicking5panic17h2f7f1e15b374dfd2E (type 5) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 12
    i32.add
    i64.const 0
    i64.store align=4
    local.get 3
    i32.const 1
    i32.store offset=4
    local.get 3
    i32.const 1054944
    i32.store offset=8
    local.get 3
    local.get 1
    i32.store offset=28
    local.get 3
    local.get 0
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 24
    i32.add
    i32.store
    local.get 3
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4fbd4b654b964086E (type 4) (param i32 i32) (result i32)
    local.get 0
    i64.load32_u
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h2c887a692950a213E)
  (func $_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h7c698cc16fb44439E (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load offset=28
            local.tee 3
            i32.const 16
            i32.and
            br_if 0 (;@4;)
            local.get 3
            i32.const 32
            i32.and
            br_if 1 (;@3;)
            local.get 0
            i64.load32_u
            i32.const 1
            local.get 1
            call $_ZN4core3fmt3num3imp7fmt_u6417h2c887a692950a213E
            local.set 0
            br 3 (;@1;)
          end
          local.get 0
          i32.load
          local.set 0
          i32.const 0
          local.set 3
          loop  ;; label = @4
            local.get 2
            local.get 3
            i32.add
            i32.const 127
            i32.add
            i32.const 48
            i32.const 87
            local.get 0
            i32.const 15
            i32.and
            local.tee 4
            i32.const 10
            i32.lt_u
            select
            local.get 4
            i32.add
            i32.store8
            local.get 3
            i32.const -1
            i32.add
            local.set 3
            local.get 0
            i32.const 16
            i32.lt_u
            local.set 4
            local.get 0
            i32.const 4
            i32.shr_u
            local.set 0
            local.get 4
            i32.eqz
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 0
        i32.load
        local.set 0
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 2
          local.get 3
          i32.add
          i32.const 127
          i32.add
          i32.const 48
          i32.const 55
          local.get 0
          i32.const 15
          i32.and
          local.tee 4
          i32.const 10
          i32.lt_u
          select
          local.get 4
          i32.add
          i32.store8
          local.get 3
          i32.const -1
          i32.add
          local.set 3
          local.get 0
          i32.const 16
          i32.lt_u
          local.set 4
          local.get 0
          i32.const 4
          i32.shr_u
          local.set 0
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
        end
        block  ;; label = @3
          local.get 3
          i32.const 128
          i32.add
          local.tee 0
          i32.const 129
          i32.lt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 128
          i32.const 1055292
          call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
          unreachable
        end
        local.get 1
        i32.const 1
        i32.const 1055308
        i32.const 2
        local.get 2
        local.get 3
        i32.add
        i32.const 128
        i32.add
        i32.const 0
        local.get 3
        i32.sub
        call $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 3
        i32.const 128
        i32.add
        local.tee 0
        i32.const 129
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 128
        i32.const 1055292
        call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
        unreachable
      end
      local.get 1
      i32.const 1
      i32.const 1055308
      i32.const 2
      local.get 2
      local.get 3
      i32.add
      i32.const 128
      i32.add
      i32.const 0
      local.get 3
      i32.sub
      call $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E
      local.set 0
    end
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt5write17h80c8117f546444b5E (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 32
    i32.add
    local.get 1
    i32.store
    local.get 3
    i32.const 3
    i32.store8 offset=40
    local.get 3
    i32.const 32
    i32.store offset=24
    i32.const 0
    local.set 4
    local.get 3
    i32.const 0
    i32.store offset=36
    local.get 3
    local.get 0
    i32.store offset=28
    local.get 3
    i32.const 0
    i32.store offset=16
    local.get 3
    i32.const 0
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load offset=16
            local.tee 5
            br_if 0 (;@4;)
            local.get 2
            i32.const 12
            i32.add
            i32.load
            local.tee 0
            i32.eqz
            br_if 1 (;@3;)
            local.get 2
            i32.load offset=8
            local.set 1
            local.get 0
            i32.const 3
            i32.shl
            local.set 6
            local.get 0
            i32.const -1
            i32.add
            i32.const 536870911
            i32.and
            i32.const 1
            i32.add
            local.set 4
            local.get 2
            i32.load
            local.set 0
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 7
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=28
                local.get 0
                i32.load
                local.get 7
                local.get 3
                i32.load offset=32
                i32.load offset=12
                call_indirect (type 6)
                br_if 4 (;@2;)
              end
              local.get 1
              i32.load
              local.get 3
              i32.const 8
              i32.add
              local.get 1
              i32.const 4
              i32.add
              i32.load
              call_indirect (type 4)
              br_if 3 (;@2;)
              local.get 1
              i32.const 8
              i32.add
              local.set 1
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 6
              i32.const -8
              i32.add
              local.tee 6
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 2
          i32.const 20
          i32.add
          i32.load
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 5
          i32.shl
          local.set 8
          local.get 1
          i32.const -1
          i32.add
          i32.const 134217727
          i32.and
          i32.const 1
          i32.add
          local.set 4
          local.get 2
          i32.load
          local.set 0
          i32.const 0
          local.set 6
          loop  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 4
              i32.add
              i32.load
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              i32.load offset=28
              local.get 0
              i32.load
              local.get 1
              local.get 3
              i32.load offset=32
              i32.load offset=12
              call_indirect (type 6)
              br_if 3 (;@2;)
            end
            local.get 3
            local.get 5
            local.get 6
            i32.add
            local.tee 1
            i32.const 16
            i32.add
            i32.load
            i32.store offset=24
            local.get 3
            local.get 1
            i32.const 28
            i32.add
            i32.load8_u
            i32.store8 offset=40
            local.get 3
            local.get 1
            i32.const 24
            i32.add
            i32.load
            i32.store offset=36
            local.get 1
            i32.const 12
            i32.add
            i32.load
            local.set 9
            local.get 2
            i32.load offset=8
            local.set 10
            i32.const 0
            local.set 11
            i32.const 0
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.const 8
                  i32.add
                  i32.load
                  br_table 1 (;@6;) 0 (;@7;) 2 (;@5;) 1 (;@6;)
                end
                local.get 9
                i32.const 3
                i32.shl
                local.set 12
                i32.const 0
                local.set 7
                local.get 10
                local.get 12
                i32.add
                local.tee 12
                i32.load offset=4
                i32.const 74
                i32.ne
                br_if 1 (;@5;)
                local.get 12
                i32.load
                i32.load
                local.set 9
              end
              i32.const 1
              local.set 7
            end
            local.get 3
            local.get 9
            i32.store offset=12
            local.get 3
            local.get 7
            i32.store offset=8
            local.get 1
            i32.const 4
            i32.add
            i32.load
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.load
                  br_table 1 (;@6;) 0 (;@7;) 2 (;@5;) 1 (;@6;)
                end
                local.get 7
                i32.const 3
                i32.shl
                local.set 9
                local.get 10
                local.get 9
                i32.add
                local.tee 9
                i32.load offset=4
                i32.const 74
                i32.ne
                br_if 1 (;@5;)
                local.get 9
                i32.load
                i32.load
                local.set 7
              end
              i32.const 1
              local.set 11
            end
            local.get 3
            local.get 7
            i32.store offset=20
            local.get 3
            local.get 11
            i32.store offset=16
            local.get 10
            local.get 1
            i32.const 20
            i32.add
            i32.load
            i32.const 3
            i32.shl
            i32.add
            local.tee 1
            i32.load
            local.get 3
            i32.const 8
            i32.add
            local.get 1
            i32.load offset=4
            call_indirect (type 4)
            br_if 2 (;@2;)
            local.get 0
            i32.const 8
            i32.add
            local.set 0
            local.get 8
            local.get 6
            i32.const 32
            i32.add
            local.tee 6
            i32.ne
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 4
          local.get 2
          i32.load offset=4
          i32.ge_u
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=28
          local.get 2
          i32.load
          local.get 4
          i32.const 3
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=32
          i32.load offset=12
          call_indirect (type 6)
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      i32.const 1
      local.set 1
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E (type 12) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        i32.const 43
        i32.const 1114112
        local.get 0
        i32.load offset=28
        local.tee 6
        i32.const 1
        i32.and
        local.tee 1
        select
        local.set 7
        local.get 1
        local.get 5
        i32.add
        local.set 8
        br 1 (;@1;)
      end
      local.get 5
      i32.const 1
      i32.add
      local.set 8
      local.get 0
      i32.load offset=28
      local.set 6
      i32.const 45
      local.set 7
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          call $_ZN4core3str5count14do_count_chars17he3295d89edff7ffdE
          local.set 1
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          br 1 (;@2;)
        end
        local.get 3
        i32.const 3
        i32.and
        local.set 9
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            i32.const 0
            local.set 10
            br 1 (;@3;)
          end
          local.get 3
          i32.const -4
          i32.and
          local.set 11
          i32.const 0
          local.set 1
          i32.const 0
          local.set 10
          loop  ;; label = @4
            local.get 1
            local.get 2
            local.get 10
            i32.add
            local.tee 12
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 11
            local.get 10
            i32.const 4
            i32.add
            local.tee 10
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 10
        i32.add
        local.set 12
        loop  ;; label = @3
          local.get 1
          local.get 12
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 1
          local.get 12
          i32.const 1
          i32.add
          local.set 12
          local.get 9
          i32.const -1
          i32.add
          local.tee 9
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 8
      i32.add
      local.set 8
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 12
        local.get 0
        i32.const 24
        i32.add
        i32.load
        local.tee 10
        local.get 7
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h75035d5f44a85a07E
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 6)
        return
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 9
        local.get 8
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 12
        local.get 0
        i32.const 24
        i32.add
        i32.load
        local.tee 10
        local.get 7
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h75035d5f44a85a07E
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 6)
        return
      end
      block  ;; label = @2
        local.get 6
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=16
        local.set 11
        local.get 0
        i32.const 48
        i32.store offset=16
        local.get 0
        i32.load8_u offset=32
        local.set 6
        i32.const 1
        local.set 1
        local.get 0
        i32.const 1
        i32.store8 offset=32
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 12
        local.get 0
        i32.const 24
        i32.add
        i32.load
        local.tee 10
        local.get 7
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h75035d5f44a85a07E
        br_if 1 (;@1;)
        local.get 9
        local.get 8
        i32.sub
        i32.const 1
        i32.add
        local.set 1
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.const -1
            i32.add
            local.tee 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 12
            i32.const 48
            local.get 10
            i32.load offset=16
            call_indirect (type 4)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        i32.const 1
        local.set 1
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
        local.get 0
        local.get 6
        i32.store8 offset=32
        local.get 0
        local.get 11
        i32.store offset=16
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 9
      local.get 8
      i32.sub
      local.tee 12
      local.set 8
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u offset=32
            local.tee 1
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;) 2 (;@2;)
          end
          i32.const 0
          local.set 8
          local.get 12
          local.set 1
          br 1 (;@2;)
        end
        local.get 12
        i32.const 1
        i32.shr_u
        local.set 1
        local.get 12
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set 8
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      i32.const 24
      i32.add
      i32.load
      local.set 10
      local.get 0
      i32.const 20
      i32.add
      i32.load
      local.set 9
      local.get 0
      i32.load offset=16
      local.set 12
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 9
          local.get 12
          local.get 10
          i32.load offset=16
          call_indirect (type 4)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      i32.const 1
      local.set 1
      local.get 12
      i32.const 1114112
      i32.eq
      br_if 0 (;@1;)
      local.get 9
      local.get 10
      local.get 7
      local.get 2
      local.get 3
      call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h75035d5f44a85a07E
      br_if 0 (;@1;)
      local.get 9
      local.get 4
      local.get 5
      local.get 10
      i32.load offset=12
      call_indirect (type 6)
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 8
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 8
          local.get 8
          i32.lt_u
          return
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 9
        local.get 12
        local.get 10
        i32.load offset=16
        call_indirect (type 4)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const -1
      i32.add
      local.get 8
      i32.lt_u
      return
    end
    local.get 1)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h9296ce6d0b4dad2bE (type 2) (param i32 i32)
    local.get 0
    i64.const 7912501143857784762
    i64.store offset=8
    local.get 0
    i64.const 1677015036563326081
    i64.store)
  (func $_ZN4core3fmt8builders10DebugInner5entry17h3d85131a34f20280E (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 1
    local.set 4
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u offset=5
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 5
          i32.load offset=28
          local.tee 6
          i32.const 4
          i32.and
          br_if 0 (;@3;)
          local.get 4
          i32.const 255
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          i32.const 1
          local.set 4
          local.get 5
          i32.load offset=20
          i32.const 1055231
          i32.const 2
          local.get 5
          i32.const 24
          i32.add
          i32.load
          i32.load offset=12
          call_indirect (type 6)
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          br_if 0 (;@3;)
          i32.const 1
          local.set 4
          local.get 5
          i32.load offset=20
          i32.const 1055245
          i32.const 1
          local.get 5
          i32.const 24
          i32.add
          i32.load
          i32.load offset=12
          call_indirect (type 6)
          br_if 2 (;@1;)
          local.get 5
          i32.load offset=28
          local.set 6
        end
        i32.const 1
        local.set 4
        local.get 3
        i32.const 1
        i32.store8 offset=23
        local.get 3
        i32.const 48
        i32.add
        i32.const 1055200
        i32.store
        local.get 3
        local.get 5
        i64.load offset=20 align=4
        i64.store offset=8
        local.get 3
        local.get 3
        i32.const 23
        i32.add
        i32.store offset=16
        local.get 3
        local.get 5
        i64.load offset=8 align=4
        i64.store offset=32
        local.get 5
        i64.load align=4
        local.set 7
        local.get 3
        local.get 6
        i32.store offset=52
        local.get 3
        local.get 5
        i32.load offset=16
        i32.store offset=40
        local.get 3
        local.get 5
        i32.load8_u offset=32
        i32.store8 offset=56
        local.get 3
        local.get 7
        i64.store offset=24
        local.get 3
        local.get 3
        i32.const 8
        i32.add
        i32.store offset=44
        local.get 1
        local.get 3
        i32.const 24
        i32.add
        local.get 2
        i32.load offset=12
        call_indirect (type 4)
        br_if 1 (;@1;)
        local.get 3
        i32.load offset=44
        i32.const 1055236
        i32.const 2
        local.get 3
        i32.load offset=48
        i32.load offset=12
        call_indirect (type 6)
        local.set 4
        br 1 (;@1;)
      end
      local.get 1
      local.get 5
      local.get 2
      i32.load offset=12
      call_indirect (type 4)
      local.set 4
    end
    local.get 0
    i32.const 1
    i32.store8 offset=5
    local.get 0
    local.get 4
    i32.store8 offset=4
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17hbe726ced2502b98bE (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1054945
    i32.const 14
    local.get 1
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 6))
  (func $_ZN4core3ffi5c_str4CStr8from_ptr9strlen_rt17he94c37781a91fb2eE (type 3) (param i32) (result i32)
    local.get 0
    call $strlen)
  (func $_ZN4core3ffi5c_str4CStr19from_bytes_with_nul17h0f81087cbdb306deE (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  i32.const 8
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 3
                  i32.add
                  i32.const -4
                  i32.and
                  local.tee 3
                  local.get 1
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 3
                  local.get 1
                  i32.sub
                  local.tee 3
                  i32.eqz
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 4
                  loop  ;; label = @8
                    local.get 1
                    local.get 4
                    i32.add
                    i32.load8_u
                    i32.eqz
                    br_if 5 (;@3;)
                    local.get 3
                    local.get 4
                    i32.const 1
                    i32.add
                    local.tee 4
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 3
                  local.get 2
                  i32.const -8
                  i32.add
                  local.tee 5
                  i32.gt_u
                  br_if 3 (;@4;)
                  br 2 (;@5;)
                end
                local.get 2
                i32.eqz
                br_if 4 (;@2;)
                block  ;; label = @7
                  local.get 1
                  i32.load8_u
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 4
                  br 4 (;@3;)
                end
                i32.const 1
                local.set 4
                local.get 2
                i32.const 1
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=1
                i32.eqz
                br_if 3 (;@3;)
                i32.const 2
                local.set 4
                local.get 2
                i32.const 2
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=2
                i32.eqz
                br_if 3 (;@3;)
                i32.const 3
                local.set 4
                local.get 2
                i32.const 3
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=3
                i32.eqz
                br_if 3 (;@3;)
                i32.const 4
                local.set 4
                local.get 2
                i32.const 4
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=4
                i32.eqz
                br_if 3 (;@3;)
                i32.const 5
                local.set 4
                local.get 2
                i32.const 5
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=5
                i32.eqz
                br_if 3 (;@3;)
                i32.const 6
                local.set 4
                local.get 2
                i32.const 6
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=6
                i32.eqz
                br_if 3 (;@3;)
                br 4 (;@2;)
              end
              local.get 2
              i32.const -8
              i32.add
              local.set 5
              i32.const 0
              local.set 3
            end
            loop  ;; label = @5
              local.get 1
              local.get 3
              i32.add
              local.tee 6
              i32.load
              local.tee 4
              i32.const -1
              i32.xor
              local.get 4
              i32.const -16843009
              i32.add
              i32.and
              i32.const -2139062144
              i32.and
              br_if 1 (;@4;)
              local.get 6
              i32.const 4
              i32.add
              i32.load
              local.tee 4
              i32.const -1
              i32.xor
              local.get 4
              i32.const -16843009
              i32.add
              i32.and
              i32.const -2139062144
              i32.and
              br_if 1 (;@4;)
              local.get 3
              i32.const 8
              i32.add
              local.tee 3
              local.get 5
              i32.le_u
              br_if 0 (;@5;)
            end
          end
          local.get 3
          local.get 2
          i32.eq
          br_if 1 (;@2;)
          loop  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              br_if 0 (;@5;)
              local.get 3
              local.set 4
              br 2 (;@3;)
            end
            local.get 2
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.ne
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 4
        i32.const 1
        i32.add
        local.get 2
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 0
        i32.store offset=4
        local.get 0
        i32.const 8
        i32.add
        local.get 4
        i32.store
        local.get 0
        i32.const 1
        i32.store
        return
      end
      local.get 0
      i32.const 1
      i32.store offset=4
      local.get 0
      i32.const 1
      i32.store
      return
    end
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    i32.const 8
    i32.add
    local.get 2
    i32.store
    local.get 0
    i32.const 0
    i32.store)
  (func $_ZN4core3str8converts9from_utf817h0c702c416c8bc7f4E (type 5) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i64 i64 i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.get 2
      i32.const -7
      i32.add
      local.tee 3
      local.get 3
      local.get 2
      i32.gt_u
      select
      local.set 4
      local.get 1
      i32.const 3
      i32.add
      i32.const -4
      i32.and
      local.get 1
      i32.sub
      local.set 5
      i32.const 0
      local.set 3
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              local.tee 6
              i32.extend8_s
              local.tee 7
              i32.const 0
              i32.lt_s
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 5
                local.get 3
                i32.sub
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.get 4
                i32.ge_u
                br_if 2 (;@4;)
                loop  ;; label = @7
                  local.get 1
                  local.get 3
                  i32.add
                  local.tee 6
                  i32.load
                  i32.const -2139062144
                  i32.and
                  br_if 3 (;@4;)
                  local.get 6
                  i32.const 4
                  i32.add
                  i32.load
                  i32.const -2139062144
                  i32.and
                  br_if 3 (;@4;)
                  local.get 3
                  i32.const 8
                  i32.add
                  local.tee 3
                  local.get 4
                  i32.ge_u
                  br_if 3 (;@4;)
                  br 0 (;@7;)
                end
              end
              local.get 3
              i32.const 1
              i32.add
              local.set 3
              br 2 (;@3;)
            end
            i64.const 1099511627776
            local.set 8
            i64.const 4294967296
            local.set 9
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 6
                                    i32.const 1055712
                                    i32.add
                                    i32.load8_u
                                    i32.const -2
                                    i32.add
                                    br_table 0 (;@16;) 1 (;@15;) 2 (;@14;) 10 (;@6;)
                                  end
                                  local.get 3
                                  i32.const 1
                                  i32.add
                                  local.tee 6
                                  local.get 2
                                  i32.lt_u
                                  br_if 2 (;@13;)
                                  i64.const 0
                                  local.set 8
                                  i64.const 0
                                  local.set 9
                                  br 9 (;@6;)
                                end
                                i64.const 0
                                local.set 8
                                local.get 3
                                i32.const 1
                                i32.add
                                local.tee 10
                                local.get 2
                                i32.lt_u
                                br_if 2 (;@12;)
                                i64.const 0
                                local.set 9
                                br 8 (;@6;)
                              end
                              i64.const 0
                              local.set 8
                              local.get 3
                              i32.const 1
                              i32.add
                              local.tee 10
                              local.get 2
                              i32.lt_u
                              br_if 2 (;@11;)
                              i64.const 0
                              local.set 9
                              br 7 (;@6;)
                            end
                            i64.const 1099511627776
                            local.set 8
                            i64.const 4294967296
                            local.set 9
                            local.get 1
                            local.get 6
                            i32.add
                            i32.load8_s
                            i32.const -65
                            i32.gt_s
                            br_if 6 (;@6;)
                            br 7 (;@5;)
                          end
                          local.get 1
                          local.get 10
                          i32.add
                          i32.load8_s
                          local.set 10
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 6
                                i32.const -224
                                i32.add
                                br_table 0 (;@14;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 1 (;@13;) 2 (;@12;)
                              end
                              local.get 10
                              i32.const -32
                              i32.and
                              i32.const -96
                              i32.eq
                              br_if 4 (;@9;)
                              br 3 (;@10;)
                            end
                            local.get 10
                            i32.const -97
                            i32.gt_s
                            br_if 2 (;@10;)
                            br 3 (;@9;)
                          end
                          block  ;; label = @12
                            local.get 7
                            i32.const 31
                            i32.add
                            i32.const 255
                            i32.and
                            i32.const 12
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 7
                            i32.const -2
                            i32.and
                            i32.const -18
                            i32.ne
                            br_if 2 (;@10;)
                            local.get 10
                            i32.const -64
                            i32.lt_s
                            br_if 3 (;@9;)
                            br 2 (;@10;)
                          end
                          local.get 10
                          i32.const -64
                          i32.lt_s
                          br_if 2 (;@9;)
                          br 1 (;@10;)
                        end
                        local.get 1
                        local.get 10
                        i32.add
                        i32.load8_s
                        local.set 10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 6
                                i32.const -240
                                i32.add
                                br_table 1 (;@13;) 0 (;@14;) 0 (;@14;) 0 (;@14;) 2 (;@12;) 0 (;@14;)
                              end
                              local.get 7
                              i32.const 15
                              i32.add
                              i32.const 255
                              i32.and
                              i32.const 2
                              i32.gt_u
                              br_if 3 (;@10;)
                              local.get 10
                              i32.const -64
                              i32.ge_s
                              br_if 3 (;@10;)
                              br 2 (;@11;)
                            end
                            local.get 10
                            i32.const 112
                            i32.add
                            i32.const 255
                            i32.and
                            i32.const 48
                            i32.ge_u
                            br_if 2 (;@10;)
                            br 1 (;@11;)
                          end
                          local.get 10
                          i32.const -113
                          i32.gt_s
                          br_if 1 (;@10;)
                        end
                        block  ;; label = @11
                          local.get 3
                          i32.const 2
                          i32.add
                          local.tee 6
                          local.get 2
                          i32.lt_u
                          br_if 0 (;@11;)
                          i64.const 0
                          local.set 9
                          br 5 (;@6;)
                        end
                        local.get 1
                        local.get 6
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        br_if 2 (;@8;)
                        i64.const 0
                        local.set 9
                        local.get 3
                        i32.const 3
                        i32.add
                        local.tee 6
                        local.get 2
                        i32.ge_u
                        br_if 4 (;@6;)
                        local.get 1
                        local.get 6
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.le_s
                        br_if 5 (;@5;)
                        i64.const 3298534883328
                        local.set 8
                        br 3 (;@7;)
                      end
                      i64.const 1099511627776
                      local.set 8
                      br 2 (;@7;)
                    end
                    i64.const 0
                    local.set 9
                    local.get 3
                    i32.const 2
                    i32.add
                    local.tee 6
                    local.get 2
                    i32.ge_u
                    br_if 2 (;@6;)
                    local.get 1
                    local.get 6
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.le_s
                    br_if 3 (;@5;)
                  end
                  i64.const 2199023255552
                  local.set 8
                end
                i64.const 4294967296
                local.set 9
              end
              local.get 0
              local.get 8
              local.get 3
              i64.extend_i32_u
              i64.or
              local.get 9
              i64.or
              i64.store offset=4 align=4
              local.get 0
              i32.const 1
              i32.store
              return
            end
            local.get 6
            i32.const 1
            i32.add
            local.set 3
            br 1 (;@3;)
          end
          local.get 3
          local.get 2
          i32.ge_u
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 1
            local.get 3
            i32.add
            i32.load8_s
            i32.const 0
            i32.lt_s
            br_if 1 (;@3;)
            local.get 2
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.ne
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 3
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    i32.const 8
    i32.add
    local.get 2
    i32.store
    local.get 0
    i32.const 0
    i32.store)
  (func $_ZN4core3fmt8builders11DebugStruct5field17h83f20f9cee1d2b6fE (type 10) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    i32.const 1
    local.set 6
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u offset=5
      local.set 7
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 8
        i32.load offset=28
        local.tee 9
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        i32.const 1055231
        i32.const 1055228
        local.get 7
        i32.const 255
        i32.and
        local.tee 7
        select
        i32.const 2
        i32.const 3
        local.get 7
        select
        local.get 8
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        i32.const 1055180
        i32.const 2
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
        local.get 3
        local.get 8
        local.get 4
        i32.load offset=12
        call_indirect (type 4)
        local.set 6
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 7
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        i32.const 1055233
        i32.const 3
        local.get 8
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
        local.get 8
        i32.load offset=28
        local.set 9
      end
      i32.const 1
      local.set 6
      local.get 5
      i32.const 1
      i32.store8 offset=23
      local.get 5
      i32.const 48
      i32.add
      i32.const 1055200
      i32.store
      local.get 5
      local.get 8
      i64.load offset=20 align=4
      i64.store offset=8
      local.get 5
      local.get 5
      i32.const 23
      i32.add
      i32.store offset=16
      local.get 5
      local.get 8
      i64.load offset=8 align=4
      i64.store offset=32
      local.get 8
      i64.load align=4
      local.set 10
      local.get 5
      local.get 9
      i32.store offset=52
      local.get 5
      local.get 8
      i32.load offset=16
      i32.store offset=40
      local.get 5
      local.get 8
      i32.load8_u offset=32
      i32.store8 offset=56
      local.get 5
      local.get 10
      i64.store offset=24
      local.get 5
      local.get 5
      i32.const 8
      i32.add
      i32.store offset=44
      local.get 5
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hf382a5879dfb1e7eE
      br_if 0 (;@1;)
      local.get 5
      i32.const 8
      i32.add
      i32.const 1055180
      i32.const 2
      call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hf382a5879dfb1e7eE
      br_if 0 (;@1;)
      local.get 3
      local.get 5
      i32.const 24
      i32.add
      local.get 4
      i32.load offset=12
      call_indirect (type 4)
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=44
      i32.const 1055236
      i32.const 2
      local.get 5
      i32.load offset=48
      i32.load offset=12
      call_indirect (type 6)
      local.set 6
    end
    local.get 0
    i32.const 1
    i32.store8 offset=5
    local.get 0
    local.get 6
    i32.store8 offset=4
    local.get 5
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h63ea37767eb5b48bE (type 4) (param i32 i32) (result i32)
    local.get 0
    i64.load8_u
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h2c887a692950a213E)
  (func $_ZN4core6result13unwrap_failed17hf48c8310675f070eE (type 11) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.const 24
    i32.add
    i32.const 12
    i32.add
    i64.const 2
    i64.store align=4
    local.get 5
    i32.const 48
    i32.add
    i32.const 12
    i32.add
    i32.const 75
    i32.store
    local.get 5
    i32.const 2
    i32.store offset=28
    local.get 5
    i32.const 1055184
    i32.store offset=24
    local.get 5
    i32.const 76
    i32.store offset=52
    local.get 5
    local.get 5
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 5
    local.get 5
    i32.const 16
    i32.add
    i32.store offset=56
    local.get 5
    local.get 5
    i32.const 8
    i32.add
    i32.store offset=48
    local.get 5
    i32.const 24
    i32.add
    local.get 4
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN4core6option13expect_failed17h8f72e66e0b3163c7E (type 5) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 28
    i32.add
    i64.const 1
    i64.store align=4
    local.get 3
    i32.const 1
    i32.store offset=20
    local.get 3
    i32.const 1054960
    i32.store offset=16
    local.get 3
    i32.const 76
    i32.store offset=44
    local.get 3
    local.get 3
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 8
    i32.add
    i32.store offset=40
    local.get 3
    i32.const 16
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hac957ce827fb6e33E (type 4) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17hff4ffeb08667be0eE)
  (func $_ZN70_$LT$core..panic..location..Location$u20$as$u20$core..fmt..Display$GT$3fmt17h5deda3f3e9eada64E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 20
    i32.add
    i32.const 11
    i32.store
    local.get 2
    i32.const 12
    i32.add
    i32.const 11
    i32.store
    local.get 2
    i32.const 76
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    local.get 2
    local.get 0
    i32.const 12
    i32.add
    i32.store offset=16
    local.get 2
    local.get 0
    i32.const 8
    i32.add
    i32.store offset=8
    local.get 1
    i32.const 24
    i32.add
    i32.load
    local.set 0
    local.get 1
    i32.load offset=20
    local.set 1
    local.get 2
    i64.const 3
    i64.store offset=36 align=4
    local.get 2
    i32.const 3
    i32.store offset=28
    local.get 2
    i32.const 1054972
    i32.store offset=24
    local.get 2
    local.get 2
    i32.store offset=32
    local.get 1
    local.get 0
    local.get 2
    i32.const 24
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 0
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core5panic10panic_info9PanicInfo7payload17hf91a0647e61cb947E (type 2) (param i32 i32)
    local.get 0
    local.get 1
    i64.load align=4
    i64.store)
  (func $_ZN4core5panic10panic_info9PanicInfo7message17hdea9c15d299b73f9E (type 3) (param i32) (result i32)
    local.get 0
    i32.load offset=12)
  (func $_ZN4core5panic10panic_info9PanicInfo8location17h229cda8b7bd8b69eE (type 3) (param i32) (result i32)
    local.get 0
    i32.load offset=8)
  (func $_ZN4core5panic10panic_info9PanicInfo10can_unwind17h8d4f277fdc08a6caE (type 3) (param i32) (result i32)
    local.get 0
    i32.load8_u offset=16)
  (func $_ZN73_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hbe995edf73a99996E (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=20
      local.tee 4
      i32.const 1054996
      i32.const 12
      local.get 1
      i32.const 24
      i32.add
      i32.load
      local.tee 1
      i32.load offset=12
      call_indirect (type 6)
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=12
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 5
          i32.store offset=28
          local.get 2
          i32.const 77
          i32.store offset=36
          local.get 2
          local.get 2
          i32.const 28
          i32.add
          i32.store offset=32
          local.get 2
          i64.const 1
          i64.store offset=68 align=4
          local.get 2
          i32.const 2
          i32.store offset=60
          local.get 2
          i32.const 1055012
          i32.store offset=56
          local.get 2
          local.get 2
          i32.const 32
          i32.add
          i32.store offset=64
          local.get 4
          local.get 1
          local.get 2
          i32.const 56
          i32.add
          call $_ZN4core3fmt5write17h80c8117f546444b5E
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 2
        i32.const 8
        i32.add
        local.get 0
        i32.load
        local.tee 5
        local.get 0
        i32.load offset=4
        i32.const 12
        i32.add
        i32.load
        call_indirect (type 2)
        local.get 2
        i64.load offset=8
        i64.const -4493808902380553279
        i64.xor
        local.get 2
        i32.const 16
        i32.add
        i64.load
        i64.const -163230743173927068
        i64.xor
        i64.or
        i64.eqz
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 5
        i32.store offset=28
        local.get 2
        i32.const 78
        i32.store offset=36
        local.get 2
        local.get 2
        i32.const 28
        i32.add
        i32.store offset=32
        local.get 2
        i64.const 1
        i64.store offset=68 align=4
        local.get 2
        i32.const 2
        i32.store offset=60
        local.get 2
        i32.const 1055012
        i32.store offset=56
        local.get 2
        local.get 2
        i32.const 32
        i32.add
        i32.store offset=64
        local.get 4
        local.get 1
        local.get 2
        i32.const 56
        i32.add
        call $_ZN4core3fmt5write17h80c8117f546444b5E
        br_if 1 (;@1;)
      end
      local.get 0
      i32.load offset=8
      local.set 3
      local.get 2
      i32.const 52
      i32.add
      i32.const 11
      i32.store
      local.get 2
      i32.const 32
      i32.add
      i32.const 12
      i32.add
      i32.const 11
      i32.store
      local.get 2
      local.get 3
      i32.const 12
      i32.add
      i32.store offset=48
      local.get 2
      local.get 3
      i32.const 8
      i32.add
      i32.store offset=40
      local.get 2
      i32.const 76
      i32.store offset=36
      local.get 2
      local.get 3
      i32.store offset=32
      local.get 2
      i64.const 3
      i64.store offset=68 align=4
      local.get 2
      i32.const 3
      i32.store offset=60
      local.get 2
      i32.const 1054972
      i32.store offset=56
      local.get 2
      local.get 2
      i32.const 32
      i32.add
      i32.store offset=64
      local.get 4
      local.get 1
      local.get 2
      i32.const 56
      i32.add
      call $_ZN4core3fmt5write17h80c8117f546444b5E
      local.set 3
    end
    local.get 2
    i32.const 80
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h628701fbe6b33d3fE (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    local.get 1
    i32.const 24
    i32.add
    i32.load
    local.get 0
    i32.load
    call $_ZN4core3fmt5write17h80c8117f546444b5E)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h95bfb4d5d740b326E (type 4) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.tee 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17hff4ffeb08667be0eE)
  (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17hf7cbfbf8e026c195E (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    i32.const 0
    local.set 3
    loop  ;; label = @1
      local.get 2
      local.get 3
      i32.add
      i32.const 127
      i32.add
      i32.const 48
      i32.const 87
      local.get 0
      i32.const 15
      i32.and
      local.tee 4
      i32.const 10
      i32.lt_u
      select
      local.get 4
      i32.add
      i32.store8
      local.get 3
      i32.const -1
      i32.add
      local.set 3
      local.get 0
      i32.const 16
      i32.lt_u
      local.set 4
      local.get 0
      i32.const 4
      i32.shr_u
      local.set 0
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 3
      i32.const 128
      i32.add
      local.tee 0
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 128
      i32.const 1055292
      call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1055308
    i32.const 2
    local.get 2
    local.get 3
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 3
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core9panicking19assert_failed_inner17he4b24762864588bfE (type 13) (param i32 i32 i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 7
    global.set $__stack_pointer
    local.get 7
    local.get 2
    i32.store offset=12
    local.get 7
    local.get 1
    i32.store offset=8
    local.get 7
    local.get 4
    i32.store offset=20
    local.get 7
    local.get 3
    i32.store offset=16
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 255
            i32.and
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 0 (;@4;)
          end
          local.get 7
          i32.const 1055044
          i32.store offset=24
          i32.const 2
          local.set 2
          br 2 (;@1;)
        end
        local.get 7
        i32.const 1055046
        i32.store offset=24
        i32.const 2
        local.set 2
        br 1 (;@1;)
      end
      local.get 7
      i32.const 1055048
      i32.store offset=24
      i32.const 7
      local.set 2
    end
    local.get 7
    local.get 2
    i32.store offset=28
    block  ;; label = @1
      local.get 5
      i32.load
      br_if 0 (;@1;)
      local.get 7
      i32.const 76
      i32.add
      i32.const 75
      i32.store
      local.get 7
      i32.const 56
      i32.add
      i32.const 12
      i32.add
      i32.const 75
      i32.store
      local.get 7
      i32.const 88
      i32.add
      i32.const 12
      i32.add
      i64.const 3
      i64.store align=4
      local.get 7
      i32.const 4
      i32.store offset=92
      local.get 7
      i32.const 1055112
      i32.store offset=88
      local.get 7
      i32.const 76
      i32.store offset=60
      local.get 7
      local.get 7
      i32.const 56
      i32.add
      i32.store offset=96
      local.get 7
      local.get 7
      i32.const 16
      i32.add
      i32.store offset=72
      local.get 7
      local.get 7
      i32.const 8
      i32.add
      i32.store offset=64
      local.get 7
      local.get 7
      i32.const 24
      i32.add
      i32.store offset=56
      local.get 7
      i32.const 88
      i32.add
      local.get 6
      call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
      unreachable
    end
    local.get 7
    i32.const 32
    i32.add
    i32.const 16
    i32.add
    local.get 5
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 7
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 5
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 7
    local.get 5
    i64.load align=4
    i64.store offset=32
    local.get 7
    i32.const 88
    i32.add
    i32.const 12
    i32.add
    i64.const 4
    i64.store align=4
    local.get 7
    i32.const 84
    i32.add
    i32.const 79
    i32.store
    local.get 7
    i32.const 76
    i32.add
    i32.const 75
    i32.store
    local.get 7
    i32.const 56
    i32.add
    i32.const 12
    i32.add
    i32.const 75
    i32.store
    local.get 7
    i32.const 4
    i32.store offset=92
    local.get 7
    i32.const 1055148
    i32.store offset=88
    local.get 7
    i32.const 76
    i32.store offset=60
    local.get 7
    local.get 7
    i32.const 56
    i32.add
    i32.store offset=96
    local.get 7
    local.get 7
    i32.const 32
    i32.add
    i32.store offset=80
    local.get 7
    local.get 7
    i32.const 16
    i32.add
    i32.store offset=72
    local.get 7
    local.get 7
    i32.const 8
    i32.add
    i32.store offset=64
    local.get 7
    local.get 7
    i32.const 24
    i32.add
    i32.store offset=56
    local.get 7
    i32.const 88
    i32.add
    local.get 6
    call $_ZN4core9panicking9panic_fmt17h826facefad16f5a7E
    unreachable)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfd10ca601c4951bdE (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 4))
  (func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h341ff6928aa3d36bE (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    local.get 1
    i32.const 24
    i32.add
    i32.load
    local.get 0
    call $_ZN4core3fmt5write17h80c8117f546444b5E)
  (func $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hf382a5879dfb1e7eE (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 3
    local.get 0
    i32.load
    local.set 4
    local.get 0
    i32.load offset=8
    local.set 5
    i32.const 0
    local.set 6
    i32.const 0
    local.set 7
    i32.const 0
    local.set 8
    i32.const 0
    local.set 9
    block  ;; label = @1
      loop  ;; label = @2
        local.get 9
        i32.const 255
        i32.and
        br_if 1 (;@1;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 8
            local.get 2
            i32.gt_u
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 1
              local.get 8
              i32.add
              local.set 10
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  local.get 8
                  i32.sub
                  local.tee 11
                  i32.const 8
                  i32.lt_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 10
                        i32.const 3
                        i32.add
                        i32.const -4
                        i32.and
                        local.tee 0
                        local.get 10
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        local.get 10
                        i32.sub
                        local.tee 12
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 0
                        loop  ;; label = @11
                          local.get 10
                          local.get 0
                          i32.add
                          i32.load8_u
                          i32.const 10
                          i32.eq
                          br_if 5 (;@6;)
                          local.get 12
                          local.get 0
                          i32.const 1
                          i32.add
                          local.tee 0
                          i32.ne
                          br_if 0 (;@11;)
                        end
                        local.get 12
                        local.get 11
                        i32.const -8
                        i32.add
                        local.tee 13
                        i32.le_u
                        br_if 1 (;@9;)
                        br 2 (;@8;)
                      end
                      local.get 11
                      i32.const -8
                      i32.add
                      local.set 13
                      i32.const 0
                      local.set 12
                    end
                    loop  ;; label = @9
                      local.get 10
                      local.get 12
                      i32.add
                      local.tee 9
                      i32.load
                      local.tee 0
                      i32.const -1
                      i32.xor
                      local.get 0
                      i32.const 168430090
                      i32.xor
                      i32.const -16843009
                      i32.add
                      i32.and
                      i32.const -2139062144
                      i32.and
                      br_if 1 (;@8;)
                      local.get 9
                      i32.const 4
                      i32.add
                      i32.load
                      local.tee 0
                      i32.const -1
                      i32.xor
                      local.get 0
                      i32.const 168430090
                      i32.xor
                      i32.const -16843009
                      i32.add
                      i32.and
                      i32.const -2139062144
                      i32.and
                      br_if 1 (;@8;)
                      local.get 12
                      i32.const 8
                      i32.add
                      local.tee 12
                      local.get 13
                      i32.le_u
                      br_if 0 (;@9;)
                    end
                  end
                  block  ;; label = @8
                    local.get 11
                    local.get 12
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 2
                    local.set 8
                    br 4 (;@4;)
                  end
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 10
                      local.get 12
                      i32.add
                      i32.load8_u
                      i32.const 10
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 12
                      local.set 0
                      br 3 (;@6;)
                    end
                    local.get 11
                    local.get 12
                    i32.const 1
                    i32.add
                    local.tee 12
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 2
                  local.set 8
                  br 3 (;@4;)
                end
                block  ;; label = @7
                  local.get 8
                  local.get 2
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 2
                  local.set 8
                  br 3 (;@4;)
                end
                i32.const 0
                local.set 0
                loop  ;; label = @7
                  local.get 10
                  local.get 0
                  i32.add
                  i32.load8_u
                  i32.const 10
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 11
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 2
                local.set 8
                br 2 (;@4;)
              end
              local.get 8
              local.get 0
              i32.add
              local.tee 0
              i32.const 1
              i32.add
              local.set 8
              block  ;; label = @6
                local.get 0
                local.get 2
                i32.ge_u
                br_if 0 (;@6;)
                local.get 1
                local.get 0
                i32.add
                i32.load8_u
                i32.const 10
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 9
                local.get 8
                local.set 13
                local.get 8
                local.set 0
                br 3 (;@3;)
              end
              local.get 8
              local.get 2
              i32.le_u
              br_if 0 (;@5;)
            end
          end
          i32.const 1
          local.set 9
          local.get 7
          local.set 13
          local.get 2
          local.set 0
          local.get 7
          local.get 2
          i32.eq
          br_if 2 (;@1;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 5
            i32.load8_u
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.const 1055224
            i32.const 4
            local.get 3
            i32.load offset=12
            call_indirect (type 6)
            br_if 1 (;@3;)
          end
          local.get 1
          local.get 7
          i32.add
          local.set 12
          local.get 0
          local.get 7
          i32.sub
          local.set 10
          i32.const 0
          local.set 11
          block  ;; label = @4
            local.get 0
            local.get 7
            i32.eq
            br_if 0 (;@4;)
            local.get 10
            local.get 12
            i32.add
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 10
            i32.eq
            local.set 11
          end
          local.get 5
          local.get 11
          i32.store8
          local.get 13
          local.set 7
          local.get 4
          local.get 12
          local.get 10
          local.get 3
          i32.load offset=12
          call_indirect (type 6)
          i32.eqz
          br_if 1 (;@2;)
        end
      end
      i32.const 1
      local.set 6
    end
    local.get 6)
  (func $_ZN4core3fmt8builders10DebugTuple5field17h54df303e0fa79f0cE (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load
        local.set 4
        i32.const 1
        local.set 5
        br 1 (;@1;)
      end
      local.get 0
      i32.load
      local.set 4
      block  ;; label = @2
        local.get 0
        i32.const 4
        i32.add
        i32.load
        local.tee 6
        i32.load offset=28
        local.tee 7
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 5
        local.get 6
        i32.load offset=20
        i32.const 1055231
        i32.const 1055241
        local.get 4
        select
        i32.const 2
        i32.const 1
        local.get 4
        select
        local.get 6
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
        local.get 1
        local.get 6
        local.get 2
        i32.load offset=12
        call_indirect (type 4)
        local.set 5
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 6
          i32.load offset=20
          i32.const 1055242
          i32.const 2
          local.get 6
          i32.const 24
          i32.add
          i32.load
          i32.load offset=12
          call_indirect (type 6)
          i32.eqz
          br_if 0 (;@3;)
          i32.const 1
          local.set 5
          i32.const 0
          local.set 4
          br 2 (;@1;)
        end
        local.get 6
        i32.load offset=28
        local.set 7
      end
      i32.const 1
      local.set 5
      local.get 3
      i32.const 1
      i32.store8 offset=23
      local.get 3
      i32.const 48
      i32.add
      i32.const 1055200
      i32.store
      local.get 3
      local.get 6
      i64.load offset=20 align=4
      i64.store offset=8
      local.get 3
      local.get 3
      i32.const 23
      i32.add
      i32.store offset=16
      local.get 3
      local.get 6
      i64.load offset=8 align=4
      i64.store offset=32
      local.get 6
      i64.load align=4
      local.set 8
      local.get 3
      local.get 7
      i32.store offset=52
      local.get 3
      local.get 6
      i32.load offset=16
      i32.store offset=40
      local.get 3
      local.get 6
      i32.load8_u offset=32
      i32.store8 offset=56
      local.get 3
      local.get 8
      i64.store offset=24
      local.get 3
      local.get 3
      i32.const 8
      i32.add
      i32.store offset=44
      local.get 1
      local.get 3
      i32.const 24
      i32.add
      local.get 2
      i32.load offset=12
      call_indirect (type 4)
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=44
      i32.const 1055236
      i32.const 2
      local.get 3
      i32.load offset=48
      i32.load offset=12
      call_indirect (type 6)
      local.set 5
    end
    local.get 0
    local.get 5
    i32.store8 offset=8
    local.get 0
    local.get 4
    i32.const 1
    i32.add
    i32.store
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt8builders8DebugSet5entry17h7150245ca659dcacE (type 6) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core3fmt8builders10DebugInner5entry17h3d85131a34f20280E
    local.get 0)
  (func $_ZN4core3fmt8builders9DebugList6finish17hd58a034686c0a295E (type 3) (param i32) (result i32)
    (local i32)
    i32.const 1
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 0
      i32.load offset=20
      i32.const 1055264
      i32.const 1
      local.get 0
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 6)
      local.set 1
    end
    local.get 1)
  (func $_ZN4core3fmt5Write10write_char17he379bb53c9daf0b9E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 1
    end
    local.get 0
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hf382a5879dfb1e7eE
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN4core3fmt5Write9write_fmt17h457cd451a20d6529E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1055512
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h76913d7c9fce1378E (type 6) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 2
    call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hf382a5879dfb1e7eE)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h8871d9d7c5578d78E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 1
    end
    local.get 0
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hf382a5879dfb1e7eE
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h9b33e863e98a54a9E (type 4) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    i32.const 1055512
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN4core3str5count14do_count_chars17he3295d89edff7ffdE (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 3
        i32.add
        i32.const -4
        i32.and
        local.tee 2
        local.get 0
        i32.sub
        local.tee 3
        local.get 1
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.sub
        local.tee 4
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 3
        i32.and
        local.set 5
        i32.const 0
        local.set 6
        i32.const 0
        local.set 1
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.eq
          br_if 0 (;@3;)
          local.get 3
          i32.const 3
          i32.and
          local.set 7
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              local.get 0
              i32.const -1
              i32.xor
              i32.add
              i32.const 3
              i32.ge_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 1
              i32.const 0
              local.set 8
              br 1 (;@4;)
            end
            local.get 3
            i32.const -4
            i32.and
            local.set 9
            i32.const 0
            local.set 1
            i32.const 0
            local.set 8
            loop  ;; label = @5
              local.get 1
              local.get 0
              local.get 8
              i32.add
              local.tee 2
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 1
              local.get 9
              local.get 8
              i32.const 4
              i32.add
              local.tee 8
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 8
          i32.add
          local.set 2
          loop  ;; label = @4
            local.get 1
            local.get 2
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 7
            i32.const -1
            i32.add
            local.tee 7
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 3
        i32.add
        local.set 8
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          local.get 4
          i32.const -4
          i32.and
          i32.add
          local.tee 2
          i32.load8_s
          i32.const -65
          i32.gt_s
          local.set 6
          local.get 5
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=1
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
          local.get 5
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=2
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
        end
        local.get 4
        i32.const 2
        i32.shr_u
        local.set 9
        local.get 6
        local.get 1
        i32.add
        local.set 7
        loop  ;; label = @3
          local.get 8
          local.set 4
          local.get 9
          i32.eqz
          br_if 2 (;@1;)
          local.get 9
          i32.const 192
          local.get 9
          i32.const 192
          i32.lt_u
          select
          local.tee 3
          i32.const 3
          i32.and
          local.set 6
          local.get 3
          i32.const 2
          i32.shl
          local.set 5
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.const 252
              i32.and
              local.tee 10
              br_if 0 (;@5;)
              i32.const 0
              local.set 2
              br 1 (;@4;)
            end
            local.get 4
            local.get 10
            i32.const 2
            i32.shl
            i32.add
            local.set 0
            i32.const 0
            local.set 2
            local.get 4
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.eqz
              br_if 1 (;@4;)
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.tee 8
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 8
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.const 8
              i32.add
              i32.load
              local.tee 8
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 8
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.tee 8
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 8
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.load
              local.tee 8
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 8
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 2
              i32.add
              i32.add
              i32.add
              i32.add
              local.set 2
              local.get 1
              i32.const 16
              i32.add
              local.tee 1
              local.get 0
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 9
          local.get 3
          i32.sub
          local.set 9
          local.get 4
          local.get 5
          i32.add
          local.set 8
          local.get 2
          i32.const 8
          i32.shr_u
          i32.const 16711935
          i32.and
          local.get 2
          i32.const 16711935
          i32.and
          i32.add
          i32.const 65537
          i32.mul
          i32.const 16
          i32.shr_u
          local.get 7
          i32.add
          local.set 7
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            br 1 (;@3;)
          end
          local.get 4
          local.get 10
          i32.const 2
          i32.shl
          i32.add
          local.tee 2
          i32.load
          local.tee 1
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 1
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.set 1
          local.get 6
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          local.tee 8
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 8
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
          local.get 6
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=8
          local.tee 2
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 2
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
        end
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 459007
        i32.and
        local.get 1
        i32.const 16711935
        i32.and
        i32.add
        i32.const 65537
        i32.mul
        i32.const 16
        i32.shr_u
        local.get 7
        i32.add
        local.set 7
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 1
      i32.const 3
      i32.and
      local.set 8
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 4
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 7
          i32.const 0
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const -4
        i32.and
        local.set 9
        i32.const 0
        local.set 7
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 7
          local.get 0
          local.get 2
          i32.add
          local.tee 1
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 1
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 2
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 3
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 7
          local.get 9
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 8
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 7
        local.get 1
        i32.load8_s
        i32.const -65
        i32.gt_s
        i32.add
        local.set 7
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 8
        i32.const -1
        i32.add
        local.tee 8
        br_if 0 (;@2;)
      end
    end
    local.get 7)
  (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h75035d5f44a85a07E (type 10) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          i32.const 1
          local.set 5
          local.get 0
          local.get 2
          local.get 1
          i32.load offset=16
          call_indirect (type 4)
          br_if 1 (;@2;)
        end
        local.get 3
        br_if 1 (;@1;)
        i32.const 0
        local.set 5
      end
      local.get 5
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 6))
  (func $_ZN4core3fmt9Formatter9write_fmt17h8b1fb458f4c75394E (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.const 24
    i32.add
    i32.load
    local.set 3
    local.get 0
    i32.load offset=20
    local.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 0
    local.get 3
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17h80c8117f546444b5E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN4core3fmt9Formatter15debug_lower_hex17h664ac1e13fe0f150E (type 3) (param i32) (result i32)
    local.get 0
    i32.load8_u offset=28
    i32.const 16
    i32.and
    i32.const 4
    i32.shr_u)
  (func $_ZN4core3fmt9Formatter15debug_upper_hex17hb39a5ad72f656bb3E (type 3) (param i32) (result i32)
    local.get 0
    i32.load8_u offset=28
    i32.const 32
    i32.and
    i32.const 5
    i32.shr_u)
  (func $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h3052256a61e44907E (type 10) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 6)
    i32.store8 offset=8
    local.get 5
    local.get 0
    i32.store offset=4
    local.get 5
    local.get 2
    i32.eqz
    i32.store8 offset=9
    local.get 5
    i32.const 0
    i32.store
    local.get 5
    local.get 3
    local.get 4
    call $_ZN4core3fmt8builders10DebugTuple5field17h54df303e0fa79f0cE
    local.set 0
    local.get 5
    i32.load8_u offset=8
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 1
        br_if 0 (;@2;)
        local.get 2
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 0
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 2
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=4
      local.set 2
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 5
        i32.load8_u offset=9
        i32.const 255
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        local.get 2
        i32.load offset=20
        i32.const 1055244
        i32.const 1
        local.get 2
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
      end
      local.get 2
      i32.load offset=20
      i32.const 1054944
      i32.const 1
      local.get 2
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 6)
      local.set 0
    end
    local.get 5
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt9Formatter25debug_tuple_field2_finish17h98426a452fcf5ad4E (type 14) (param i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 7
    global.set $__stack_pointer
    local.get 7
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 6)
    i32.store8 offset=8
    local.get 7
    local.get 0
    i32.store offset=4
    local.get 7
    local.get 2
    i32.eqz
    i32.store8 offset=9
    local.get 7
    i32.const 0
    i32.store
    local.get 7
    local.get 3
    local.get 4
    call $_ZN4core3fmt8builders10DebugTuple5field17h54df303e0fa79f0cE
    local.get 5
    local.get 6
    call $_ZN4core3fmt8builders10DebugTuple5field17h54df303e0fa79f0cE
    local.set 0
    local.get 7
    i32.load8_u offset=8
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 1
        br_if 0 (;@2;)
        local.get 2
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 0
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 2
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      local.get 7
      i32.load offset=4
      local.set 2
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 7
        i32.load8_u offset=9
        i32.const 255
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        local.get 2
        i32.load offset=20
        i32.const 1055244
        i32.const 1
        local.get 2
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
      end
      local.get 2
      i32.load offset=20
      i32.const 1054944
      i32.const 1
      local.get 2
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 6)
      local.set 0
    end
    local.get 7
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt9Formatter10debug_list17h5721f0bd814d30e6E (type 2) (param i32 i32)
    (local i32)
    local.get 1
    i32.load offset=20
    i32.const 1054969
    i32.const 1
    local.get 1
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 6)
    local.set 2
    local.get 0
    i32.const 0
    i32.store8 offset=5
    local.get 0
    local.get 2
    i32.store8 offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17h517c110f608bb8f2E (type 4) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load8_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 1055536
      i32.const 5
      call $_ZN4core3fmt9Formatter3pad17hff4ffeb08667be0eE
      return
    end
    local.get 1
    i32.const 1055541
    i32.const 4
    call $_ZN4core3fmt9Formatter3pad17hff4ffeb08667be0eE)
  (func $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h8ca672917709e7afE (type 6) (param i32 i32 i32) (result i32)
    local.get 2
    local.get 0
    local.get 1
    call $_ZN4core3fmt9Formatter3pad17hff4ffeb08667be0eE)
  (func $_ZN4core5slice6memchr14memchr_aligned17h44220a3c88e412c1E (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 3
            i32.add
            i32.const -4
            i32.and
            local.tee 4
            local.get 2
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            local.get 2
            i32.sub
            local.tee 4
            local.get 3
            local.get 4
            local.get 3
            i32.lt_u
            select
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            local.get 1
            i32.const 255
            i32.and
            local.set 6
            i32.const 1
            local.set 7
            loop  ;; label = @5
              local.get 2
              local.get 5
              i32.add
              i32.load8_u
              local.get 6
              i32.eq
              br_if 4 (;@1;)
              local.get 4
              local.get 5
              i32.const 1
              i32.add
              local.tee 5
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 4
            local.get 3
            i32.const -8
            i32.add
            local.tee 8
            i32.gt_u
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          local.get 3
          i32.const -8
          i32.add
          local.set 8
          i32.const 0
          local.set 4
        end
        local.get 1
        i32.const 255
        i32.and
        i32.const 16843009
        i32.mul
        local.set 5
        loop  ;; label = @3
          local.get 2
          local.get 4
          i32.add
          local.tee 7
          i32.load
          local.get 5
          i32.xor
          local.tee 6
          i32.const -1
          i32.xor
          local.get 6
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 7
          i32.const 4
          i32.add
          i32.load
          local.get 5
          i32.xor
          local.tee 6
          i32.const -1
          i32.xor
          local.get 6
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 4
          i32.const 8
          i32.add
          local.tee 4
          local.get 8
          i32.le_u
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.set 7
      block  ;; label = @2
        local.get 4
        local.get 3
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        i32.const 255
        i32.and
        local.set 5
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            local.get 4
            i32.add
            i32.load8_u
            local.get 5
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.set 5
            i32.const 1
            local.set 7
            br 3 (;@1;)
          end
          local.get 3
          local.get 4
          i32.const 1
          i32.add
          local.tee 4
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 3
      local.set 5
    end
    local.get 0
    local.get 5
    i32.store offset=4
    local.get 0
    local.get 7
    i32.store)
  (func $_ZN4core5slice6memchr7memrchr17h53c799eab43a25c3E (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    local.get 3
    i32.const 0
    local.get 3
    local.get 2
    i32.const 3
    i32.add
    i32.const -4
    i32.and
    local.get 2
    i32.sub
    local.tee 4
    i32.sub
    i32.const 7
    i32.and
    local.get 3
    local.get 4
    i32.lt_u
    select
    local.tee 5
    i32.sub
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            local.get 5
            i32.lt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.add
              local.tee 5
              local.get 2
              local.get 6
              i32.add
              local.tee 7
              i32.sub
              local.set 8
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -1
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -2
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -3
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -4
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -5
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -6
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -7
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                local.get 8
                i32.const -8
                i32.add
                local.set 4
              end
              local.get 4
              local.get 6
              i32.add
              local.set 4
              br 3 (;@2;)
            end
            local.get 4
            local.get 3
            local.get 3
            local.get 4
            i32.gt_u
            select
            local.set 7
            local.get 1
            i32.const 255
            i32.and
            i32.const 16843009
            i32.mul
            local.set 5
            loop  ;; label = @5
              local.get 6
              local.tee 4
              local.get 7
              i32.le_u
              br_if 2 (;@3;)
              local.get 2
              local.get 4
              i32.add
              local.tee 8
              i32.const -8
              i32.add
              i32.load
              local.get 5
              i32.xor
              local.tee 6
              i32.const -1
              i32.xor
              local.get 6
              i32.const -16843009
              i32.add
              i32.and
              i32.const -2139062144
              i32.and
              br_if 2 (;@3;)
              local.get 4
              i32.const -8
              i32.add
              local.set 6
              local.get 8
              i32.const -4
              i32.add
              i32.load
              local.get 5
              i32.xor
              local.tee 8
              i32.const -1
              i32.xor
              local.get 8
              i32.const -16843009
              i32.add
              i32.and
              i32.const -2139062144
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 6
          local.get 3
          i32.const 1055580
          call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
          unreachable
        end
        block  ;; label = @3
          local.get 4
          local.get 3
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          i32.const -1
          i32.add
          local.set 5
          local.get 1
          i32.const 255
          i32.and
          local.set 8
          loop  ;; label = @4
            block  ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              br 4 (;@1;)
            end
            local.get 5
            local.get 4
            i32.add
            local.set 6
            local.get 4
            i32.const -1
            i32.add
            local.set 4
            local.get 6
            i32.load8_u
            local.get 8
            i32.eq
            br_if 2 (;@2;)
            br 0 (;@4;)
          end
        end
        local.get 4
        local.get 3
        i32.const 1055596
        call $_ZN4core5slice5index24slice_end_index_len_fail17h392bb1693dec020aE
        unreachable
      end
      i32.const 1
      local.set 6
    end
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 6
    i32.store)
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$3fmt17h827476b06538be7cE (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      i32.const 48
      i32.const 55
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 10
      i32.lt_u
      select
      local.get 4
      i32.add
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 255
      i32.and
      local.tee 4
      i32.const 4
      i32.shr_u
      local.set 3
      local.get 4
      i32.const 16
      i32.ge_u
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1055292
      call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1055308
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$3fmt17hf3b2ed3d26336b39E (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      i32.const 48
      i32.const 87
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 10
      i32.lt_u
      select
      local.get 4
      i32.add
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 255
      i32.and
      local.tee 4
      i32.const 4
      i32.shr_u
      local.set 3
      local.get 4
      i32.const 16
      i32.ge_u
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1055292
      call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1055308
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt3num49_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u8$GT$3fmt17h51d0d078157a111aE (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load offset=28
            local.tee 3
            i32.const 16
            i32.and
            br_if 0 (;@4;)
            local.get 3
            i32.const 32
            i32.and
            br_if 1 (;@3;)
            local.get 0
            i64.load8_u
            i32.const 1
            local.get 1
            call $_ZN4core3fmt3num3imp7fmt_u6417h2c887a692950a213E
            local.set 0
            br 3 (;@1;)
          end
          local.get 0
          i32.load8_u
          local.set 3
          i32.const 0
          local.set 0
          loop  ;; label = @4
            local.get 2
            local.get 0
            i32.add
            i32.const 127
            i32.add
            i32.const 48
            i32.const 87
            local.get 3
            i32.const 15
            i32.and
            local.tee 4
            i32.const 10
            i32.lt_u
            select
            local.get 4
            i32.add
            i32.store8
            local.get 0
            i32.const -1
            i32.add
            local.set 0
            local.get 3
            i32.const 255
            i32.and
            local.tee 4
            i32.const 4
            i32.shr_u
            local.set 3
            local.get 4
            i32.const 16
            i32.ge_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 0
        i32.load8_u
        local.set 3
        i32.const 0
        local.set 0
        loop  ;; label = @3
          local.get 2
          local.get 0
          i32.add
          i32.const 127
          i32.add
          i32.const 48
          i32.const 55
          local.get 3
          i32.const 15
          i32.and
          local.tee 4
          i32.const 10
          i32.lt_u
          select
          local.get 4
          i32.add
          i32.store8
          local.get 0
          i32.const -1
          i32.add
          local.set 0
          local.get 3
          i32.const 255
          i32.and
          local.tee 4
          i32.const 4
          i32.shr_u
          local.set 3
          local.get 4
          i32.const 16
          i32.ge_u
          br_if 0 (;@3;)
        end
        block  ;; label = @3
          local.get 0
          i32.const 128
          i32.add
          local.tee 3
          i32.const 129
          i32.lt_u
          br_if 0 (;@3;)
          local.get 3
          i32.const 128
          i32.const 1055292
          call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
          unreachable
        end
        local.get 1
        i32.const 1
        i32.const 1055308
        i32.const 2
        local.get 2
        local.get 0
        i32.add
        i32.const 128
        i32.add
        i32.const 0
        local.get 0
        i32.sub
        call $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        i32.const 128
        i32.add
        local.tee 3
        i32.const 129
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 128
        i32.const 1055292
        call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
        unreachable
      end
      local.get 1
      i32.const 1
      i32.const 1055308
      i32.const 2
      local.get 2
      local.get 0
      i32.add
      i32.const 128
      i32.add
      i32.const 0
      local.get 0
      i32.sub
      call $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E
      local.set 0
    end
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt3num3imp7fmt_u6417h2c887a692950a213E (type 15) (param i64 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 39
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.const 10000
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 39
      local.set 4
      loop  ;; label = @2
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        local.get 0
        i64.const 10000
        i64.div_u
        local.tee 5
        i64.const 10000
        i64.mul
        i64.sub
        i32.wrap_i64
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.const 1055310
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1055310
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 4
        i32.const -4
        i32.add
        local.set 4
        local.get 0
        i64.const 99999999
        i64.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 5
      i32.wrap_i64
      local.tee 6
      i32.const 99
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -2
      i32.add
      local.tee 4
      i32.add
      local.get 5
      i32.wrap_i64
      local.tee 6
      local.get 6
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 6
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1055310
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.const -2
        i32.add
        local.tee 4
        i32.add
        local.get 6
        i32.const 1
        i32.shl
        i32.const 1055310
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -1
      i32.add
      local.tee 4
      i32.add
      local.get 6
      i32.const 48
      i32.add
      i32.store8
    end
    local.get 2
    local.get 1
    i32.const 1054944
    i32.const 0
    local.get 3
    i32.const 9
    i32.add
    local.get 4
    i32.add
    i32.const 39
    local.get 4
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E
    local.set 4
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h430f08a50696f267E (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    i32.const 0
    local.set 3
    loop  ;; label = @1
      local.get 2
      local.get 3
      i32.add
      i32.const 127
      i32.add
      i32.const 48
      i32.const 55
      local.get 0
      i32.const 15
      i32.and
      local.tee 4
      i32.const 10
      i32.lt_u
      select
      local.get 4
      i32.add
      i32.store8
      local.get 3
      i32.const -1
      i32.add
      local.set 3
      local.get 0
      i32.const 16
      i32.lt_u
      local.set 4
      local.get 0
      i32.const 4
      i32.shr_u
      local.set 0
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 3
      i32.const 128
      i32.add
      local.tee 0
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 128
      i32.const 1055292
      call $_ZN4core5slice5index26slice_start_index_len_fail17h0d54849012697d98E
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1055308
    i32.const 2
    local.get 2
    local.get 3
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 3
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h0a725a60906c4eb7E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17hfe94f4467bb0677fE (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.tee 0
    i64.extend_i32_u
    i64.const 0
    local.get 0
    i64.extend_i32_s
    i64.sub
    local.get 0
    i32.const -1
    i32.gt_s
    local.tee 0
    select
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h2c887a692950a213E)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7a118ed4f4fd1b61E (type 4) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN4core3fmt3num49_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u8$GT$3fmt17h51d0d078157a111aE)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hf720a13b210da41eE (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        i32.load8_u
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        i32.const 1055968
        i32.const 4
        local.get 1
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 6)
        local.set 0
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 2
      local.get 3
      i32.const 1
      i32.add
      i32.store offset=12
      local.get 2
      local.get 1
      i32.load offset=20
      i32.const 1055972
      i32.const 4
      local.get 1
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 6)
      i32.store8 offset=24
      local.get 2
      local.get 1
      i32.store offset=20
      local.get 2
      i32.const 0
      i32.store8 offset=25
      local.get 2
      i32.const 0
      i32.store offset=16
      local.get 2
      i32.const 16
      i32.add
      local.get 2
      i32.const 12
      i32.add
      i32.const 1055248
      call $_ZN4core3fmt8builders10DebugTuple5field17h54df303e0fa79f0cE
      local.set 1
      local.get 2
      i32.load8_u offset=24
      local.set 3
      block  ;; label = @2
        local.get 1
        i32.load
        local.tee 1
        br_if 0 (;@2;)
        local.get 3
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 0
        br 1 (;@1;)
      end
      local.get 3
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      local.get 2
      i32.load offset=20
      local.set 3
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        i32.load8_u offset=25
        i32.const 255
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        local.get 3
        i32.load offset=20
        i32.const 1055244
        i32.const 1
        local.get 3
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
      end
      local.get 3
      i32.load offset=20
      i32.const 1054944
      i32.const 1
      local.get 3
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 6)
      local.set 0
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN64_$LT$core..str..error..Utf8Error$u20$as$u20$core..fmt..Debug$GT$3fmt17hcea524ead953dc7bE (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.const 4
    i32.add
    i32.store offset=4
    local.get 1
    i32.load offset=20
    i32.const 1055992
    i32.const 9
    local.get 1
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 6)
    local.set 3
    local.get 2
    i32.const 0
    i32.store8 offset=13
    local.get 2
    local.get 3
    i32.store8 offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    i32.const 1056001
    i32.const 11
    local.get 0
    i32.const 1055976
    call $_ZN4core3fmt8builders11DebugStruct5field17h83f20f9cee1d2b6fE
    i32.const 1056012
    i32.const 9
    local.get 2
    i32.const 4
    i32.add
    i32.const 1056024
    call $_ZN4core3fmt8builders11DebugStruct5field17h83f20f9cee1d2b6fE
    local.set 3
    local.get 2
    i32.load8_u offset=12
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load8_u offset=13
        br_if 0 (;@2;)
        local.get 0
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 1
        br 1 (;@1;)
      end
      i32.const 1
      local.set 1
      local.get 0
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.load
        local.tee 1
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        i32.const 1055239
        i32.const 2
        local.get 1
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 6)
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=20
      i32.const 1055238
      i32.const 1
      local.get 1
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 6)
      local.set 1
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h154411717ad9e65aE (type 4) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1056040
    i32.const 11
    local.get 1
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 6))
  (table (;0;) 92 92 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "__main_void" (func $__main_void))
  (elem (;0;) (i32.const 1) func $_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17had06bfe0e3f694afE $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h51f1d5e4cd316363E $_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h6fef827fcb4e5510E $_ZN10hello_rust4main17h6d1faf4eeb560262E $_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hcd17213d8f130a4eE $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17hfe94f4467bb0677fE $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17h3effdd62e9553808E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hda2d5208ab8b8d7fE $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17h2e67c29fe94fefb3E $_ZN91_$LT$std..sys_common..backtrace.._print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17hea32b2f7b995831dE $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4fbd4b654b964086E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6c8cb4c347fceb98E $_ZN73_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hbe995edf73a99996E $_ZN3std5alloc24default_alloc_error_hook17ha3291554c6d119e3E $_ZN4core3ptr100drop_in_place$LT$$RF$mut$u20$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17hc678b1c1755486caE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h9de6b261f02e625bE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h58c44d9bb0977d8eE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h5b77f01b163e69a3E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h3726bedafbdb8637E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hf1f0c648386167e3E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h751c0741d29bc5ffE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h631352d3d575f296E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hc4e8266d1f346c62E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h8a4739c93ba0b641E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h3fc94b77ededba77E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2301b060ccf78942E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h7c22f686d2d0e8d8E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h43b10d22ac27745bE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h235252d731a920e1E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0e78180a9f293deeE $_ZN4core3ptr29drop_in_place$LT$$LP$$RP$$GT$17hb98729e73ea57a1cE $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17hbe726ced2502b98bE $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17he92acc4b62fae97eE $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h37c8a55fa99d45b0E $_ZN4core3fmt5Write10write_char17hffc835159d6a6f20E $_ZN4core3fmt5Write9write_fmt17h6b7e3003f3f69473E $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hd5407d2c62c31640E $_ZN4core3fmt5Write10write_char17h582fe3f8a927f01aE $_ZN4core3fmt5Write9write_fmt17h00b558ecd4608885E $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h96fe6309f626e056E $_ZN4core3fmt5Write10write_char17h64c6c20879db5d63E $_ZN4core3fmt5Write9write_fmt17h7008031b2f3a175fE $_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h472112f9865843b5E $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5write17hdf498821c4941d50E $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$14write_vectored17h48e268dc6dc740c0E $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$17is_write_vectored17h985944220e07e3e0E $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5flush17h6e162bd2eab0ec7cE $_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$9write_all17h073245eeb5f3a97dE $_ZN3std2io5Write18write_all_vectored17he6289fffadcea60eE $_ZN3std2io5Write9write_fmt17h0c13bd5dc713ad26E $_ZN64_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$5write17h3a378ee0bcdd7f43E $_ZN64_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$14write_vectored17h1297b0f22f014a75E $_ZN64_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$17is_write_vectored17h36803292745c3d05E $_ZN64_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$5flush17hb9ed6af4a99a6e9cE $_ZN3std2io5Write9write_all17hdd8f2f9fc62d1156E $_ZN3std2io5Write18write_all_vectored17h496869c8cdf17aadE $_ZN3std2io5Write9write_fmt17he644c9ec16dca596E $_ZN4core3ptr39drop_in_place$LT$std..path..PathBuf$GT$17hcd41e3e78ccde51eE $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hbee2961531151bddE $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h644e479311ce68f2E $_ZN93_$LT$std..panicking..begin_panic_handler..StrPanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$8take_box17h4653026584ff3204E $_ZN93_$LT$std..panicking..begin_panic_handler..StrPanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$3get17he8cc0efc923178bfE $_ZN4core3ptr70drop_in_place$LT$std..panicking..begin_panic_handler..PanicPayload$GT$17hd62d624acfbbc3d7E $_ZN90_$LT$std..panicking..begin_panic_handler..PanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$8take_box17h888193ef09bb7434E $_ZN90_$LT$std..panicking..begin_panic_handler..PanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$3get17h01c47134cac61165E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hb97b6b38134b6171E $_ZN64_$LT$core..str..error..Utf8Error$u20$as$u20$core..fmt..Debug$GT$3fmt17hcea524ead953dc7bE $_ZN4core3ptr26drop_in_place$LT$usize$GT$17h8a70431a17b00a9dE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h2e17edb63ca4ceefE $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h360a46831ba2dfccE $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h154411717ad9e65aE $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h57e5d6d92df4f277E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h53f1661e1d3ca33dE $_ZN4core3ops8function6FnOnce9call_once17h6f4abb2291c2f20eE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfd10ca601c4951bdE $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hac957ce827fb6e33E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h628701fbe6b33d3fE $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h95bfb4d5d740b326E $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h341ff6928aa3d36bE $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17hf7a381062dad12b3E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h9296ce6d0b4dad2bE $_ZN4core3ptr102drop_in_place$LT$$RF$core..iter..adapters..copied..Copied$LT$core..slice..iter..Iter$LT$u8$GT$$GT$$GT$17h961389ecbf7edbd3E $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hf382a5879dfb1e7eE $_ZN4core3fmt5Write10write_char17he379bb53c9daf0b9E $_ZN4core3fmt5Write9write_fmt17h457cd451a20d6529E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7a118ed4f4fd1b61E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h76913d7c9fce1378E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h8871d9d7c5578d78E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h9b33e863e98a54a9E $_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17h7c698cc16fb44439E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hf720a13b210da41eE)
  (data $.rodata (i32.const 1048576) "\01\00\00\00\04\00\00\00\04\00\00\00\02\00\00\00\03\00\00\00\03\00\00\00Hello, wasker\0a\00\00\18\00\10\00\0e\00\00\00invalid args0\00\10\00\0c\00\00\00/rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/core/src/fmt/mod.rs\00D\00\10\00K\00\00\00+\01\00\00\0d\00\00\00called `Option::unwrap()` on a `None` value()\00\00\00\0f\00\00\00\04\00\00\00\04\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\0f\00\00\00\04\00\00\00\04\00\00\00\13\00\00\00\14\00\00\00\15\00\00\00\0f\00\00\00\04\00\00\00\04\00\00\00\16\00\00\00\17\00\00\00\18\00\00\00\0f\00\00\00\04\00\00\00\04\00\00\00\19\00\00\00\1a\00\00\00\1b\00\00\00\00assertion failed: mid <= self.len()\0f\00\00\00\04\00\00\00\04\00\00\00\1c\00\00\00internal error: entered unreachable code/rustc/5680fa18feaa87f3ff04063800aec256c3d4b4be/library/alloc/src/vec/mod.rs\8c\01\10\00L\00\00\00\c9\07\00\00$\00\00\00OkErr\00\00\00\0f\00\00\00\04\00\00\00\04\00\00\00\1d\00\00\00\0f\00\00\00\04\00\00\00\04\00\00\00\1e\00\00\00mainfatal runtime error: unwrap failed: CString::new(\22main\22) = \0a\14\02\10\00;\00\00\00O\02\10\00\01\00\00\00library/std/src/rt.rs\00\00\00`\02\10\00\15\00\00\00r\00\00\00\0d\00\00\00library/std/src/thread/mod.rsfailed to generate unique thread ID: bitspace exhausted\a5\02\10\007\00\00\00\88\02\10\00\1d\00\00\00J\04\00\00\0d\00\00\00RUST_BACKTRACEcalled `Result::unwrap()` on an `Err` valuefailed to write the buffered data\00\00-\03\10\00!\00\00\00\17\00\00\000\01\10\00\00\00\00\00library/std/src/io/buffered/linewritershim.rs\00\00\00d\03\10\00-\00\00\00\01\01\00\00)\00\00\00entity not foundpermission deniedconnection refusedconnection resethost unreachablenetwork unreachableconnection abortednot connectedaddress in useaddress not availablenetwork downbroken pipeentity already existsoperation would blocknot a directoryis a directorydirectory not emptyread-only filesystem or storage mediumfilesystem loop or indirection limit (e.g. symlink loop)stale network file handleinvalid input parameterinvalid datatimed outwrite zerono storage spaceseek on unseekable filefilesystem quota exceededfile too largeresource busyexecutable file busydeadlockcross-device link or renametoo many linksinvalid filenameargument list too longoperation interruptedunsupportedunexpected end of fileout of memoryother erroruncategorized error (os error )\00\00\000\01\10\00\00\00\00\00\91\06\10\00\0b\00\00\00\9c\06\10\00\01\00\00\00already borrowed\1f\00\00\00\00\00\00\00\01\00\00\00 \00\00\00library/std/src/io/stdio.rs\00\d8\06\10\00\1b\00\00\00}\02\00\00\13\00\00\00\d8\06\10\00\1b\00\00\00\ea\02\00\00\14\00\00\00failed printing to : \00\00\00\14\07\10\00\13\00\00\00'\07\10\00\02\00\00\00\d8\06\10\00\1b\00\00\00\fb\03\00\00\09\00\00\00stdoutlibrary/std/src/io/mod.rs\00R\07\10\00\19\00\00\00C\05\00\00\16\00\00\00advancing io slices beyond their length\00|\07\10\00'\00\00\00R\07\10\00\19\00\00\00E\05\00\00\0d\00\00\00advancing IoSlice beyond its length\00\bc\07\10\00#\00\00\00library/std/src/sys/wasi/io.rs\00\00\e8\07\10\00\1e\00\00\00\17\00\00\00\0d\00\00\00failed to write whole buffer\18\08\10\00\1c\00\00\00\17\00\00\00R\07\10\00\19\00\00\00-\06\00\00!\00\00\00!\00\00\00\0c\00\00\00\04\00\00\00\22\00\00\00#\00\00\00$\00\00\00formatter error\00h\08\10\00\0f\00\00\00(\00\00\00!\00\00\00\0c\00\00\00\04\00\00\00%\00\00\00&\00\00\00'\00\00\00!\00\00\00\0c\00\00\00\04\00\00\00(\00\00\00)\00\00\00*\00\00\00library/std/src/panic.rs\b4\08\10\00\18\00\00\00\f5\00\00\00\12\00\00\00library/std/src/sync/once.rs\dc\08\10\00\1c\00\00\00\95\00\00\002\00\00\00\dc\08\10\00\1c\00\00\00\d0\00\00\00\14\00\00\00\dc\08\10\00\1c\00\00\00\d0\00\00\001\00\00\00lock count overflow in reentrant mutexlibrary/std/src/sync/remutex.rs\00\00\00N\09\10\00\1f\00\00\00\91\00\00\00\0e\00\00\00file name contained an unexpected NUL byte\00\00\80\09\10\00*\00\00\00\14\00\00\00\02\00\00\00\ac\09\10\00stack backtrace:\0a\00\00\00\c0\09\10\00\11\00\00\00note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.\0a\dc\09\10\00X\00\00\00library/std/src/sys_common/thread_info.rs\00\00\00<\0a\10\00)\00\00\00\16\00\00\003\00\00\00fatal runtime error: assertion failed: thread_info.is_none()\0a\00\00\00x\0a\10\00=\00\00\00<\0a\10\00)\00\00\00+\00\00\00+\00\00\00memory allocation of  bytes failed\0a\00\d0\0a\10\00\15\00\00\00\e5\0a\10\00\0e\00\00\00 bytes failed\00\00\00\d0\0a\10\00\15\00\00\00\04\0b\10\00\0d\00\00\00library/std/src/alloc.rs$\0b\10\00\18\00\00\00U\01\00\00\09\00\00\00library/std/src/panicking.rsL\0b\10\00\1c\00\00\00\f7\00\00\00$\00\00\00Box<dyn Any><unnamed>\00\00\00+\00\00\00\0c\00\00\00\04\00\00\00,\00\00\00-\00\00\00.\00\00\00/\00\00\000\00\00\001\00\00\002\00\00\00\1f\00\00\00\00\00\00\00\01\00\00\003\00\00\004\00\00\005\00\00\006\00\00\007\00\00\008\00\00\009\00\00\00thread '' panicked at '', \00\00\e0\0b\10\00\08\00\00\00\e8\0b\10\00\0f\00\00\00\f7\0b\10\00\03\00\00\00O\02\10\00\01\00\00\00note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace\0a\00\00\1c\0c\10\00N\00\00\00L\0b\10\00\1c\00\00\00O\02\00\00\1f\00\00\00L\0b\10\00\1c\00\00\00P\02\00\00\1e\00\00\00:\00\00\00\0c\00\00\00\04\00\00\00;\00\00\00\0f\00\00\00\08\00\00\00\04\00\00\00<\00\00\00\0f\00\00\00\08\00\00\00\04\00\00\00=\00\00\00>\00\00\00?\00\00\00\10\00\00\00\04\00\00\00@\00\00\00A\00\00\00\1f\00\00\00\00\00\00\00\01\00\00\00B\00\00\00\0apanicked after panic::always_abort(), aborting.\0a\00\00\000\01\10\00\00\00\00\00\ec\0c\10\001\00\00\00thread panicked while processing panic. aborting.\0a\00\000\0d\10\002\00\00\00thread caused non-unwinding panic. aborting.\0a\00\00\00l\0d\10\00-\00\00\00fatal runtime error: failed to initiate panic, error \00\00\00\a4\0d\10\005\00\00\00O\02\10\00\01\00\00\00cannot recursively acquire mutex\ec\0d\10\00 \00\00\00library/std/src/sys/wasi/../unsupported/locks/mutex.rs\00\00\14\0e\10\006\00\00\00\14\00\00\00\09\00\00\00fatal runtime error: rwlock locked for writing\0a\00\5c\0e\10\00/\00\00\00\0f\00\00\00\08\00\00\00\04\00\00\00C\00\00\00library/std/src/sys/wasi/os.rs\00\00\a4\0e\10\00\1e\00\00\00C\00\00\006\00\00\00strerror_r failure\00\00\d4\0e\10\00\12\00\00\00\a4\0e\10\00\1e\00\00\00A\00\00\00\0d\00\00\00\08\00\0e\00\0f\00?\00\02\00@\005\00\0d\00\04\00\03\00,\00\1b\00\1c\00I\00\14\00\06\004\000\00Once instance has previously been poisoned\00\00$\0f\10\00*\00\00\00one-time initialization may not be performed recursivelyX\0f\10\008\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\10\00\00\00\10\00\00\00\13\00\00\00\12\00\00\00\0d\00\00\00\0e\00\00\00\15\00\00\00\0c\00\00\00\0b\00\00\00\15\00\00\00\15\00\00\00\0f\00\00\00\0e\00\00\00\13\00\00\00&\00\00\008\00\00\00\19\00\00\00\17\00\00\00\0c\00\00\00\09\00\00\00\0a\00\00\00\10\00\00\00\17\00\00\00\19\00\00\00\0e\00\00\00\0d\00\00\00\14\00\00\00\08\00\00\00\1b\00\00\00\0e\00\00\00\10\00\00\00\16\00\00\00\15\00\00\00\0b\00\00\00\16\00\00\00\0d\00\00\00\0b\00\00\00\13\00\00\00\a4\03\10\00\b4\03\10\00\c5\03\10\00\d7\03\10\00\e7\03\10\00\f7\03\10\00\0a\04\10\00\1c\04\10\00)\04\10\007\04\10\00L\04\10\00X\04\10\00c\04\10\00x\04\10\00\8d\04\10\00\9c\04\10\00\aa\04\10\00\bd\04\10\00\e3\04\10\00\1b\05\10\004\05\10\00K\05\10\00W\05\10\00`\05\10\00j\05\10\00z\05\10\00\91\05\10\00\aa\05\10\00\b8\05\10\00\c5\05\10\00\d9\05\10\00\e1\05\10\00\fc\05\10\00\0a\06\10\00\1a\06\10\000\06\10\00E\06\10\00P\06\10\00f\06\10\00s\06\10\00~\06\10\00/\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Link has been severed\00Protocol error\00Bad message\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Operation already in progress\00Operation in progress\00Stale file handle\00Quota exceeded\00Multihop attempted\00Capabilities insufficient\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00u\02N\00\d6\01\e2\04\b9\04\18\01\8e\05\ed\02\16\04\f2\00\97\03\01\038\05\af\01\82\01O\03/\04\1e\00\d4\05\a2\00\12\03\1e\03\c2\01\de\03\08\00\ac\05\00\01d\02\f1\01e\054\02\8c\02\cf\02-\03L\04\e3\05\9f\02\f8\04\1c\05\08\05\b1\02K\05\15\02x\00R\02<\03\f1\03\e4\00\c3\03}\04\cc\00\aa\03y\05$\02n\01m\03\22\04\ab\04D\00\fb\01\ae\00\83\03`\00\e5\01\07\04\94\04^\04+\00X\019\01\92\00\c2\05\9b\01C\02F\01\f6\05\00\00D\00\00\00\04\00\00\00\04\00\00\00E\00\00\00library/alloc/src/raw_vec.rscapacity overflow\00\00\00\c8\17\10\00\11\00\00\00\ac\17\10\00\1c\00\00\00\0c\02\00\00\05\00\00\00called `Option::unwrap()` on a `None` valuelibrary/alloc/src/ffi/c_str.rs\00\00\00\1f\18\10\00\1e\00\00\00\1b\01\00\007\00\00\00called `Result::unwrap()` on an `Err` value\00F\00\00\00\00\00\00\00\01\00\00\00G\00\00\00library/alloc/src/sync.rs\00\00\00\8c\18\10\00\19\00\00\00[\01\00\002\00\00\00NulErrorD\00\00\00\04\00\00\00\04\00\00\00H\00\00\00D\00\00\00\04\00\00\00\04\00\00\00I\00\00\00)BorrowMutError\00\e0\18\10\00\00\00\00\00:[\00\00\e0\18\10\00\00\00\00\00\f8\18\10\00\01\00\00\00\f8\18\10\00\01\00\00\00panicked at '',  \19\10\00\01\00\00\00!\19\10\00\03\00\00\00P\00\00\00\00\00\00\00\01\00\00\00Q\00\00\00==!=matchesassertion failed: `(left  right)`\0a  left: ``,\0a right: ``\00O\19\10\00\19\00\00\00h\19\10\00\12\00\00\00z\19\10\00\0c\00\00\00\86\19\10\00\01\00\00\00`: \00O\19\10\00\19\00\00\00h\19\10\00\12\00\00\00z\19\10\00\0c\00\00\00\a8\19\10\00\03\00\00\00: \00\00\e0\18\10\00\00\00\00\00\cc\19\10\00\02\00\00\00R\00\00\00\0c\00\00\00\04\00\00\00S\00\00\00T\00\00\00U\00\00\00     { ,  {\0a,\0a} }((\0a,\0a\00\00R\00\00\00\04\00\00\00\04\00\00\00V\00\00\00]library/core/src/fmt/num.rs!\1a\10\00\1b\00\00\00i\00\00\00\14\00\00\000x00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\00\00R\00\00\00\04\00\00\00\04\00\00\00W\00\00\00X\00\00\00Y\00\00\00falsetruelibrary/core/src/slice/memchr.rs\00\00\009\1b\10\00 \00\00\00\91\00\00\00\1a\00\00\009\1b\10\00 \00\00\00\ad\00\00\00\05\00\00\00range start index  out of range for slice of length |\1b\10\00\12\00\00\00\8e\1b\10\00\22\00\00\00range end index \c0\1b\10\00\10\00\00\00\8e\1b\10\00\22\00\00\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\00\00\00\00\00\00\00\00\00\00\00NoneSomeR\00\00\00\04\00\00\00\04\00\00\00Z\00\00\00Utf8Errorvalid_up_toerror_len\00\00\00R\00\00\00\04\00\00\00\04\00\00\00[\00\00\00LayoutError")
  (data $.data (i32.const 1056052) "\01\00\00\00\ff\ff\ff\ff\e0\10\10\00"))
