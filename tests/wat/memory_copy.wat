;; Test `return` operator
(module

  ;; Import our myprint function
  (import "myenv" "print" (func $print (param i64 i32)))

  ;; Define a single page memory of 64KB.
  (memory $0 1)

  ;; Store the Hello World (null terminated) string at byte offset 0
  (data (i32.const 0) "Test Passed\n")
  (data (i32.const 16) "#Test Failed\n")
  (data (i32.const 32) "\03\01\04\01")
  (data (i32.const 42) "\07\05\02\03\06")

  ;; Debug function
  (func $printSuccess
    i64.const 0
    i32.const 12
    (call $print)
  )

  (func $printFail
    i64.const 16
    i32.const 16
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

  (func $load8_u (param i32) (result i32)
    (i32.load8_u (local.get 0))
  )
  (func $copy
    (memory.copy (i32.const 36) (i32.const 32) (i32.const 2))
    (memory.copy (i32.const 48) (i32.const 42) (i32.const 3))
  )

  (func $test_init
    (call $assert_test_i32 (call $load8_u (i32.const 30)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 31)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 32)) (i32.const 3))
    (call $assert_test_i32 (call $load8_u (i32.const 33)) (i32.const 1))
    (call $assert_test_i32 (call $load8_u (i32.const 34)) (i32.const 4))
    (call $assert_test_i32 (call $load8_u (i32.const 35)) (i32.const 1))
    (call $assert_test_i32 (call $load8_u (i32.const 36)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 37)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 38)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 39)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 40)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 41)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 42)) (i32.const 7))
    (call $assert_test_i32 (call $load8_u (i32.const 43)) (i32.const 5))
    (call $assert_test_i32 (call $load8_u (i32.const 44)) (i32.const 2))
    (call $assert_test_i32 (call $load8_u (i32.const 45)) (i32.const 3))
    (call $assert_test_i32 (call $load8_u (i32.const 46)) (i32.const 6))
    (call $assert_test_i32 (call $load8_u (i32.const 47)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 48)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 49)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 50)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 51)) (i32.const 0))
  )  
  (func $test_copied
    (call $assert_test_i32 (call $load8_u (i32.const 30)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 31)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 32)) (i32.const 3))
    (call $assert_test_i32 (call $load8_u (i32.const 33)) (i32.const 1))
    (call $assert_test_i32 (call $load8_u (i32.const 34)) (i32.const 4))
    (call $assert_test_i32 (call $load8_u (i32.const 35)) (i32.const 1))
    (call $assert_test_i32 (call $load8_u (i32.const 36)) (i32.const 3))
    (call $assert_test_i32 (call $load8_u (i32.const 37)) (i32.const 1))
    (call $assert_test_i32 (call $load8_u (i32.const 38)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 39)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 40)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 41)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 42)) (i32.const 7))
    (call $assert_test_i32 (call $load8_u (i32.const 43)) (i32.const 5))
    (call $assert_test_i32 (call $load8_u (i32.const 44)) (i32.const 2))
    (call $assert_test_i32 (call $load8_u (i32.const 45)) (i32.const 3))
    (call $assert_test_i32 (call $load8_u (i32.const 46)) (i32.const 6))
    (call $assert_test_i32 (call $load8_u (i32.const 47)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 48)) (i32.const 7))
    (call $assert_test_i32 (call $load8_u (i32.const 49)) (i32.const 5))
    (call $assert_test_i32 (call $load8_u (i32.const 50)) (i32.const 2))
    (call $assert_test_i32 (call $load8_u (i32.const 51)) (i32.const 0))
  )  
  (func (export "_start")
    (call $test_init)
    (call $copy)
    (call $test_copied)
  )
)