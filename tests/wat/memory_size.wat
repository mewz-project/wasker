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

  (func $size (result i32) (memory.size))
  (func $grow (param $sz i32) (result i32) (memory.grow (local.get $sz)))

  (func $test_size
    (call $assert_test_i32 (call $size) (i32.const 1))
    (call $assert_test_i32 (call $grow (i32.const 1)) (i32.const 1))
    (call $assert_test_i32 (call $size) (i32.const 2))
    (call $assert_test_i32 (call $grow (i32.const 4)) (i32.const 2))
    (call $assert_test_i32 (call $size) (i32.const 6))
    (call $assert_test_i32 (call $grow (i32.const 0)) (i32.const 6))
    (call $assert_test_i32 (call $size) (i32.const 6))
  )
  
  (func (export "_start")
    (call $test_size)
  )
)