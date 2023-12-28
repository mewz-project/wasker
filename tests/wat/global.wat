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
  
  (global $x (mut i32) (i32.const -12))
  (global (;7;) (mut f32) (f32.const -13))
  (global (;8;) (mut f64) (f64.const -14))
  (global $y (mut i64) (i64.const -15))

  (func $get-x (result i32) (global.get $x))
  (func $get-y (result i64) (global.get $y))
  (func $set-x (param i32) (global.set $x (local.get 0)))
  (func $set-y (param i64) (global.set $y (local.get 0)))

  (func $as-select-first (result i32)
    (select (global.get $x) (i32.const 2) (i32.const 3))
  )
  (func $as-select-mid (result i32)
    (select (i32.const 2) (global.get $x) (i32.const 3))
  )
  (func $as-select-last (result i32)
    (select (i32.const 2) (i32.const 3) (global.get $x))
  )

  
  (func (export "_start")
    (call $assert_test_i32 (call $get-x) (i32.const -12))
    (call $assert_test_i64 (call $get-y) (i64.const -15))
    (call $set-x (i32.const 6))
    (call $set-y (i64.const 7))
    (call $assert_test_i32 (call $get-x) (i32.const 6))
    (call $assert_test_i64 (call $get-y) (i64.const 7))
    (call $assert_test_i32 (call $as-select-first) (i32.const 6))
    (call $assert_test_i32 (call $as-select-mid) (i32.const 2))
    (call $assert_test_i32 (call $as-select-last) (i32.const 2))
  )
)