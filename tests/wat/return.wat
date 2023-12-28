;; Test `return` operator
(module
  (type (;0;) (func (param i32 i32 i32 i32) (result i32)))

  ;; Import fd_write function
  (import "wasi_snapshot_preview1" "fd_write" (func $fd_write (type 0)))

  ;; Define a single page memory of 64KB.
  (memory $0 1)

  ;; Store the Hello World (null terminated) string at byte offset 0
  (data (i32.const 16) "Test Passed\n")
  (data (i32.const 32) "#Test Failed\n")

  ;; Debug function
  (func $printSuccess
    (call $fd_write
            (i32.const 1) ;; file_descriptor - 1 for stdout
            (i32.const 0) ;; *iovs - The pointer to the iov array, which is stored at memory location 0
            (i32.const 1) ;; iovs_len - We're printing 1 string stored in an iov - so one.
            (i32.const 128) ;; nwritten - A place in memory to store the number of bytes written
    )
  )

  (func $printFail
    (call $fd_write
            (i32.const 1) ;; file_descriptor - 1 for stdout
            (i32.const 8) ;; *iovs - The pointer to the iov array, which is stored at memory location 0
            (i32.const 1) ;; iovs_len - We're printing 1 string stored in an iov - so one.
            (i32.const 128) ;; nwritten - A place in memory to store the number of bytes written
    )
  )

  (func $assert_test_i32 (param $expected i32) (param $result i32)
    local.get $expected
    local.get $result
    i32.eq
    (if
      (then
        (call $printSuccess)
      )
      (else
        (call $printFail)
      )
    )
  )

  (func $assert_test_i64 (param $expected i64) (param $result i64)
    local.get $expected
    local.get $result
    i64.eq
    (if
      (then
        (call $printSuccess)
      )
      (else
        (call $printFail)
      )
    )
  )

  ;; TODO
  ;; untested functions
  ;; type-f32-value
  ;; type-f64-value
  ;; nullary
  ;; unary
  ;; as-block-first
  ;; as-block-mid
  ;; as-block-last
  ;; as-br_if-cond
  ;; as-br_table-index
  ;; as-br_table-value
  ;; as-br_table-value-index

  (func $dummy)
  (func $type-i32-value (result i32)
    (block (result i32) (i32.ctz (return (i32.const 1))))
  )
  (func $type-i64-value (result i64)
    (block (result i64) (i64.ctz (return (i64.const 2))))
  )

  (func $as-func-first (result i32)
    (return (i32.const 1)) (i32.const 2)
  )
  (func $as-func-mid (result i32)
    (call $dummy) (return (i32.const 2)) (i32.const 3)
  )
  (func $as-func-value (result i32)
    (nop) (call $dummy) (return (i32.const 3))
  )
  (func $as-block-value (result i32)
    (block (result i32) (nop) (call $dummy) (return (i32.const 2)))
  )
  (func $as-loop-first (result i32)
    (loop (result i32) (return (i32.const 3)) (i32.const 2))
  )
  (func $as-loop-mid (result i32)
    (loop (result i32) (call $dummy) (return (i32.const 4)) (i32.const 2))
  )
  (func $as-loop-last (result i32)
    (loop (result i32) (nop) (call $dummy) (return (i32.const 5)))
  )
  (func $as-br-value (result i32)
    (block (result i32) (br 0 (return (i32.const 9))))
  )
  (func $as-br-if-value (result i32)
    (block (result i32)
      (drop (br_if 0 (return (i32.const 8)) (i32.const 1))) (i32.const 7)
    )
  )
  (func $as-br-if-value-cond (result i32)
    (block (result i32)
      (drop (br_if 0 (i32.const 6) (return (i32.const 9)))) (i32.const 7)
    )
  )
  (func $as-br_table-value (result i32)
    (block (result i32)
      (br_table 0 0 0 (return (i32.const 10)) (i32.const 1)) (i32.const 7)
    )
  )
  (func $as-br_table-value-index (result i32)
    (block (result i32)
      (br_table 0 0 (i32.const 6) (return (i32.const 11))) (i32.const 7)
    )
  )
  (func $as-return-value (result i64)
    (return (return (i64.const 7)))
  )

  (func $as-if-cond (result i32)
    (if (result i32)
      (return (i32.const 2)) (then (i32.const 0)) (else (i32.const 1))
    )
  )
  (func $as-if-then (param i32 i32) (result i32)
    (if (result i32)
      (local.get 0) (then (return (i32.const 3))) (else (local.get 1))
    )
  )
  (func $as-if-else (param i32 i32) (result i32)
    (if (result i32)
      (local.get 0) (then (local.get 1)) (else (return (i32.const 4)))
    )
  )
  (func $as-select-first (param i32 i32) (result i32)
    (select (return (i32.const 5)) (local.get 0) (local.get 1))
  )
  (func $as-select-second (param i32 i32) (result i32)
    (select (local.get 0) (return (i32.const 6)) (local.get 1))
  )
  (func $as-select-cond (result i32)
    (select (i32.const 0) (i32.const 1) (return (i32.const 7)))
  )

  (func $f (param i32 i32 i32) (result i32) (i32.const -1))
  (func $as-call-first (result i32)
    (call $f (return (i32.const 12)) (i32.const 2) (i32.const 3))
  )
  (func $as-call-mid (result i32)
    (call $f (i32.const 1) (return (i32.const 13)) (i32.const 3))
  )
  (func $as-call-last (result i32)
    (call $f (i32.const 1) (i32.const 2) (return (i32.const 14)))
  )
  (func $as-br_table-index (result i64)
    (block (br_table 0 0 0 (return (i64.const 9)))) (i64.const -1)
  )
  (global $a (mut i32) (i32.const 0))
  (func $as-global.set-value (result i32)
    (global.set $a (return (i32.const 1)))
  )

  (func (export "_start")
    ;; iov.iov_base and iov.iov_len for "success"
    (i32.store (i32.const 0) (i32.const 16)) 
    (i32.store (i32.const 4) (i32.const 12))
    ;; iov.iov_base and iov.iov_len for "success"
    (i32.store (i32.const 8) (i32.const 32)) 
    (i32.store (i32.const 12) (i32.const 13))
    (call $assert_test_i32 (call $type-i32-value) (i32.const 1))
    (call $assert_test_i64 (call $type-i64-value) (i64.const 2))
    (call $assert_test_i32 (call $as-func-first) (i32.const 1))
    (call $assert_test_i32 (call $as-func-mid) (i32.const 2))
    (call $assert_test_i32 (call $as-func-value) (i32.const 3))
    (call $assert_test_i32 (call $as-loop-first) (i32.const 3))
    (call $assert_test_i32 (call $as-loop-mid) (i32.const 4))
    (call $assert_test_i32 (call $as-loop-last) (i32.const 5))
    (call $assert_test_i32 (call $as-br-value) (i32.const 9))
    (call $assert_test_i32 (call $as-br-if-value) (i32.const 8))
    (call $assert_test_i32 (call $as-br-if-value-cond) (i32.const 9))
    (call $assert_test_i32 (call $as-br_table-value) (i32.const 10))
    (call $assert_test_i32 (call $as-br_table-value-index) (i32.const 11))
    (call $assert_test_i64 (call $as-return-value) (i64.const 7))
    (call $assert_test_i32 (call $as-if-cond) (i32.const 2))
    (call $assert_test_i32 (call $as-if-then (i32.const 1) (i32.const 6)) (i32.const 3))
    (call $assert_test_i32 (call $as-if-then (i32.const 0) (i32.const 6)) (i32.const 6))
    (call $assert_test_i32 (call $as-if-else (i32.const 0) (i32.const 6)) (i32.const 4))
    (call $assert_test_i32 (call $as-if-else (i32.const 1) (i32.const 6)) (i32.const 6))
    (call $assert_test_i32 (call $as-select-first (i32.const 0) (i32.const 6)) (i32.const 5))
    (call $assert_test_i32 (call $as-select-first (i32.const 1) (i32.const 6)) (i32.const 5))
    (call $assert_test_i32 (call $as-select-second (i32.const 0) (i32.const 6)) (i32.const 6))
    (call $assert_test_i32 (call $as-select-second (i32.const 1) (i32.const 6)) (i32.const 6))
    (call $assert_test_i32 (call $as-select-cond) (i32.const 7))
    (call $assert_test_i32 (call $as-call-first) (i32.const 12))
    (call $assert_test_i32 (call $as-call-mid) (i32.const 13))
    (call $assert_test_i32 (call $as-call-last) (i32.const 14))
    (call $assert_test_i64 (call $as-br_table-index) (i64.const 9));; Fail
  )
)