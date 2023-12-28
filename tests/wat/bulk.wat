;; hello_world.wat

(module

  ;; Import our myprint function
  (import "myenv" "print" (func $print (param i64 i32)))

  (memory $0 1)
  (data (i32.const 40) "Test Passed\n")
  (data (i32.const 56) "#Test Failed\n")

  ;; Debug function
  (func $printd (param $len i32)
    i64.const 0
    (local.get $len)
    (call $print)
  )

  (func $printSuccess
    i64.const 40
    i32.const 12
    (call $print)
  )

  (func $printFail
    i64.const 56
    i32.const 13
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
  (func $fill (param i32 i32 i32)
    (memory.fill
      (local.get 0)
      (local.get 1)
      (local.get 2))
  )

  (func $load8_u (param i32) (result i32)
    (i32.load8_u (local.get 0))
  )

  ;; Entrypoint
	(func (export "_start")
    ;; Basic fill test.
    (call $fill (i32.const 1) (i32.const 0xff) (i32.const 3))
    (call $assert_test_i32 (call $load8_u (i32.const 0)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 1)) (i32.const 0xff))
    (call $assert_test_i32 (call $load8_u (i32.const 2)) (i32.const 0xff))
    (call $assert_test_i32 (call $load8_u (i32.const 3)) (i32.const 0xff))
    (call $assert_test_i32 (call $load8_u (i32.const 4)) (i32.const 0))

    ;; Fill value is stored as a byte.
    (call $fill (i32.const 0) (i32.const 0xbbaa) (i32.const 2))
    (call $assert_test_i32 (call $load8_u (i32.const 0)) (i32.const 0xaa))
    (call $assert_test_i32 (call $load8_u (i32.const 1)) (i32.const 0xaa))

    ;; Fill all of memory
    (call $fill (i32.const 0) (i32.const 0) (i32.const 0x10000))
    (call $assert_test_i32 (call $load8_u (i32.const 0xff00)) (i32.const 0))
    (call $assert_test_i32 (call $load8_u (i32.const 0xffff)) (i32.const 0))
	)
)