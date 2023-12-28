(module

  ;; Import our myprint function
  (import "myenv" "print" (func $print (param i64 i32)))

  ;; Define a single page memory of 64KB.
  (memory $0 1)

  ;; Store the Hello World (null terminated) string at byte offset 0
  (data (i32.const 0) "Test Passed\n")
  (data (i32.const 16) "#Test Failed\n")

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
    i32.const 13
    (call $print)
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
  ;;(func $abs (param $x f64) (result f64) (f64.abs (local.get $x)))
  (func $neg (param $x f64) (result f64) (f64.neg (local.get $x)))
  ;;(func $copysign (param $x f64) (param $y f64) (result f64) (f64.copysign (local.get $x) (local.get $y)))

  (func (export "_start")
    (call $assert_test_f64 (call $neg (f64.const -0x0p+0)) (f64.const 0x0p+0))
    (call $assert_test_f64 (call $neg (f64.const 0x0p+0)) (f64.const -0x0p+0))
    (call $assert_test_f64 (call $neg (f64.const -0x0.0000000000001p-1022)) (f64.const 0x0.0000000000001p-1022))
    (call $assert_test_f64 (call $neg (f64.const 0x0.0000000000001p-1022)) (f64.const -0x0.0000000000001p-1022))
    (call $assert_test_f64 (call $neg (f64.const -0x1p-1022)) (f64.const 0x1p-1022))
    (call $assert_test_f64 (call $neg (f64.const 0x1p-1022)) (f64.const -0x1p-1022))
    (call $assert_test_f64 (call $neg (f64.const -0x1p-1)) (f64.const 0x1p-1))
    (call $assert_test_f64 (call $neg (f64.const 0x1p-1)) (f64.const -0x1p-1))
    (call $assert_test_f64 (call $neg (f64.const -0x1p+0)) (f64.const 0x1p+0))
    (call $assert_test_f64 (call $neg (f64.const 0x1p+0)) (f64.const -0x1p+0))
    (call $assert_test_f64 (call $neg (f64.const -0x1.921fb54442d18p+2)) (f64.const 0x1.921fb54442d18p+2))
    (call $assert_test_f64 (call $neg (f64.const 0x1.921fb54442d18p+2)) (f64.const -0x1.921fb54442d18p+2))
    (call $assert_test_f64 (call $neg (f64.const -0x1.fffffffffffffp+1023)) (f64.const 0x1.fffffffffffffp+1023))
    (call $assert_test_f64 (call $neg (f64.const 0x1.fffffffffffffp+1023)) (f64.const -0x1.fffffffffffffp+1023))
    (call $assert_test_f64 (call $neg (f64.const -inf)) (f64.const inf))
    (call $assert_test_f64 (call $neg (f64.const inf)) (f64.const -inf))
    ;;(call $assert_test_f64 (call $neg (f64.const -nan)) (f64.const nan))
    ;;(call $assert_test_f64 (call $neg (f64.const nan)) (f64.const -nan))
  )
)