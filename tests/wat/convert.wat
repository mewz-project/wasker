(module
  ;; Import our myprint function
  (import "myenv" "print" (func $print (param i64 i32)))

  ;; Define a single page memory of 64KB.
  (memory $0 1)

  ;; Store the Hello World (null terminated) string at byte offset 0
  (data (i32.const 0) "Test Passed\n")
  (data (i32.const 16) "# Test Failed\n")

  ;; Debug function
  (func $printd (param $len i32)
    i64.const 0
    (local.get $len)
    (call $print)
  )
  
  (func $printSuccess
    ;;i64.const 0
    ;;i32.const 12
    ;;(call $print)
  )

  (func $printFail
    i64.const 16
    i32.const 14
    (call $print)
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
  (func $i64.extend_i32_s (param $x i32) (result i64) (i64.extend_i32_s (local.get $x)))
  (func $i64.extend_i32_u (param $x i32) (result i64) (i64.extend_i32_u (local.get $x)))
  (func $i32.wrap_i64 (param $x i64) (result i32) (i32.wrap_i64 (local.get $x)))
  (func (export "_start")
    (call $assert_test_i64 (call $i64.extend_i32_s (i32.const 0)) (i64.const 0))
    (call $assert_test_i64 (call $i64.extend_i32_s (i32.const 10000)) (i64.const 10000))
    (call $assert_test_i64 (call $i64.extend_i32_s (i32.const -10000)) (i64.const -10000))
    (call $assert_test_i64 (call $i64.extend_i32_s (i32.const -1)) (i64.const -1))
    (call $assert_test_i64 (call $i64.extend_i32_s (i32.const 0x7fffffff)) (i64.const 0x000000007fffffff))
    (call $assert_test_i64 (call $i64.extend_i32_s (i32.const 0x80000000)) (i64.const 0xffffffff80000000))

    (call $assert_test_i64 (call $i64.extend_i32_u (i32.const 0)) (i64.const 0))
    (call $assert_test_i64 (call $i64.extend_i32_u (i32.const 10000)) (i64.const 10000))
    (call $assert_test_i64 (call $i64.extend_i32_u (i32.const -10000)) (i64.const 0x00000000ffffd8f0))
    (call $assert_test_i64 (call $i64.extend_i32_u (i32.const -1)) (i64.const 0xffffffff))
    (call $assert_test_i64 (call $i64.extend_i32_u (i32.const 0x7fffffff)) (i64.const 0x000000007fffffff))
    (call $assert_test_i64 (call $i64.extend_i32_u (i32.const 0x80000000)) (i64.const 0x0000000080000000))

    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const -1)) (i32.const -1))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const -100000)) (i32.const -100000))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 0x80000000)) (i32.const 0x80000000))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 0xffffffff7fffffff)) (i32.const 0x7fffffff))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 0xffffffff00000000)) (i32.const 0x00000000))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 0xfffffffeffffffff)) (i32.const 0xffffffff))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 0xffffffff00000001)) (i32.const 0x00000001))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 0)) (i32.const 0))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 1311768467463790320)) (i32.const 0x9abcdef0))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 0x00000000ffffffff)) (i32.const 0xffffffff))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 0x0000000100000000)) (i32.const 0x00000000))
    (call $assert_test_i32 (call $i32.wrap_i64 (i64.const 0x0000000100000001)) (i32.const 0x00000001))
  )
)