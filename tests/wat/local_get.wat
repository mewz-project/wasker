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
  (func $assert_test_f32 (param $expected f32) (param $result f32)
    local.get $expected
    local.get $result
    f32.eq
    (if
      (then
        (call $printSuccess)
      )
      (else
        (call $printFail)
      )
    )
  )
  (func $assert_test_f64 (param $expected f64) (param $result f64)
    local.get $expected
    local.get $result
    f64.eq
    (if
      (then
        (call $printSuccess)
      )
      (else
        (call $printFail)
      )
    )
  )
  (func $type-local-i32 (result i32) (local i32) (local.get 0))
  (func $type-local-i64 (result i64) (local i64) (local.get 0))
  (func $type-local-f32 (result f32) (local f32) (local.get 0))
  (func $type-local-f64 (result f64) (local f64) (local.get 0))

  (func $type-param-i32 (param i32) (result i32) (local.get 0))
  (func $type-param-i64 (param i64) (result i64) (local.get 0))
  (func $type-param-f32 (param f32) (result f32) (local.get 0))
  (func $type-param-f64 (param f64) (result f64) (local.get 0))

  (func $as-block-value (param i32) (result i32)
    (block (result i32) (local.get 0))
  )
  (func $as-loop-value (param i32) (result i32)
    (loop (result i32) (local.get 0))
  )
  (func $as-br-value (param i32) (result i32)
    (block (result i32) (br 0 (local.get 0)))
  )
  (func $as-br_if-value (param i32) (result i32)
    (block $l0 (result i32) (br_if $l0 (local.get 0) (i32.const 1)))
  )

  (func $as-br_if-value-cond (param i32) (result i32)
    (block (result i32)
      (br_if 0 (local.get 0) (local.get 0))
    )
  )
  (func $as-br_table-value (param i32) (result i32)
    (block
      (block
        (block
          (br_table 0 1 2 (local.get 0))
          (return (i32.const 0))
        )
        (return (i32.const 1))
      )
      (return (i32.const 2))
    )
    (i32.const 3)
  )

  (func $as-return-value (param i32) (result i32)
    (return (local.get 0))
  )

  (func $as-if-then (param i32) (result i32)
    (if (result i32) (local.get 0) (then (local.get 0)) (else (i32.const 0)))
  )
  (func $as-if-else (param i32) (result i32)
    (if (result i32) (local.get 0) (then (i32.const 1)) (else (local.get 0)))
  )
  
  (func (export "_start")
    (call $assert_test_i32 (call $type-local-i32) (i32.const 0))
    (call $assert_test_i64 (call $type-local-i64) (i64.const 0))
    (call $assert_test_f32 (call $type-local-f32) (f32.const 0))
    (call $assert_test_f64 (call $type-local-f64) (f64.const 0))

    (call $assert_test_i32 (call $type-param-i32 (i32.const 2)) (i32.const 2))
    (call $assert_test_i64 (call $type-param-i64 (i64.const 3)) (i64.const 3))
    (call $assert_test_f32 (call $type-param-f32 (f32.const 4.4)) (f32.const 4.4))
    (call $assert_test_f64 (call $type-param-f64 (f64.const 5.5)) (f64.const 5.5))

    (call $assert_test_i32 (call $as-block-value (i32.const 6)) (i32.const 6))
    (call $assert_test_i32 (call $as-loop-value (i32.const 7)) (i32.const 7))

    (call $assert_test_i32 (call $as-br-value (i32.const 8)) (i32.const 8))
    (call $assert_test_i32 (call $as-br_if-value (i32.const 9)) (i32.const 9))
    (call $assert_test_i32 (call $as-br_if-value-cond (i32.const 10)) (i32.const 10))
    (call $assert_test_i32 (call $as-br_table-value (i32.const 1)) (i32.const 2))

    (call $assert_test_i32 (call $as-return-value (i32.const 0)) (i32.const 0))

    (call $assert_test_i32 (call $as-if-then (i32.const 1)) (i32.const 1))
    (call $assert_test_i32 (call $as-if-else (i32.const 0)) (i32.const 0))
  )
)