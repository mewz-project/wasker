;; Test `return` operator
(module

  ;; Import our myprint function
  (import "myenv" "print" (func $print (param i64 i32)))

  ;; Define a single page memory of 64KB.
  (memory $0 1)

  ;; Store the Hello World (null terminated) string at byte offset 0
  (data (i32.const 0) "Test Passed\n")
  (data (i32.const 16) "Test Failed\n")

  ;; Debug function
  (func $printd (param $len i32)
    i64.const 0
    (local.get $len)
    (call $print)
  )

  (func $printSuccess
    i64.const 0
    i32.const 12
    (call $print)
  )

  (func $printFail
    i64.const 16
    i32.const 12
    (call $print)
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

  (func $select-i32 (param i32 i32 i32) (result i32)
    (select (local.get 0) (local.get 1) (local.get 2))
  )
  (func $select-i64 (param i64 i64 i32) (result i64)
    (select (local.get 0) (local.get 1) (local.get 2))
  )

  (func $test_select
    (call $assert_test_i32 (call $select-i32 (i32.const 1) (i32.const 2) (i32.const 1)) (i32.const 1))
    (call $assert_test_i32 (call $select-i32 (i32.const 1) (i32.const 2) (i32.const 0)) (i32.const 2))
    (call $assert_test_i32 (call $select-i32 (i32.const 2) (i32.const 1) (i32.const 0)) (i32.const 1))
    (call $assert_test_i64 (call $select-i64 (i64.const 2) (i64.const 1) (i32.const 1)) (i64.const 2))
    (call $assert_test_i64 (call $select-i64 (i64.const 2) (i64.const 1) (i32.const -1)) (i64.const 2))
    (call $assert_test_i64 (call $select-i64 (i64.const 2) (i64.const 1) (i32.const 0xf0f0f0f0)) (i64.const 2))
  )
  
  (func (export "_start")
    (call $test_select)
  )
)