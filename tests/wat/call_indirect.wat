;; hello_world.wat

(module

  ;; Import our myprint function
  (import "myenv" "print" (func $print (param i64 i32)))

  (data (i32.const 0) "Test Passed\n")
  (data (i32.const 16) "Test Failed\n")

  ;; Define a single page memory of 64KB.
  (memory $0 1)
  (type $proc (func))
  (type $out-i32 (func (result i32)))
  (type $out-i64 (func (result i64)))
  (type $out-f32 (func (result f32)))
  (type $out-f64 (func (result f64)))
  (type $over-i32 (func (param i32) (result i32)))
  (type $over-i64 (func (param i64) (result i64)))
  (type $over-f32 (func (param f32) (result f32)))
  (type $over-f64 (func (param f64) (result f64)))
  (type $f32-i32 (func (param f32 i32) (result i32)))
  (type $i32-i64 (func (param i32 i64) (result i64)))
  (type $f64-f32 (func (param f64 f32) (result f32)))
  (type $i64-f64 (func (param i64 f64) (result f64)))
  (type $over-i32-duplicate (func (param i32) (result i32)))
  (type $over-i64-duplicate (func (param i64) (result i64)))
  (type $over-f32-duplicate (func (param f32) (result f32)))
  (type $over-f64-duplicate (func (param f64) (result f64)))

  (func $const-i32 (type $out-i32) (i32.const 0x132))
  (func $const-i64 (type $out-i64) (i64.const 0x164))
  (func $const-f32 (type $out-f32) (f32.const 0xf32))
  (func $const-f64 (type $out-f64) (f64.const 0xf64))
  (func $id-i32 (type $over-i32) (local.get 0))
  (func $id-i64 (type $over-i64) (local.get 0))
  (func $id-f32 (type $over-f32) (local.get 0))
  (func $id-f64 (type $over-f64) (local.get 0))
  (func $i32-i64 (type $i32-i64) (local.get 1))
  (func $i64-f64 (type $i64-f64) (local.get 1))
  (func $f32-i32 (type $f32-i32) (local.get 1))
  (func $f64-f32 (type $f64-f32) (local.get 1))
  (func $over-i32-duplicate (type $over-i32-duplicate) (local.get 0))
  (func $over-i64-duplicate (type $over-i64-duplicate) (local.get 0))
  (func $over-f32-duplicate (type $over-f32-duplicate) (local.get 0))
  (func $over-f64-duplicate (type $over-f64-duplicate) (local.get 0))

  (table funcref
    (elem
      $const-i32
      $const-i64
      $const-f32
      $const-f64
      $id-i32
      $id-i64
      $id-f32
      $id-f64
      $f32-i32
      $i32-i64
      $f64-f32
      $i64-f64
    )
  )

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

  (func $type-i32 (result i32)
    (call_indirect (type $out-i32) (i32.const 0))
  )
  (func $type-i64 (result i64)
    (call_indirect (type $out-i64) (i32.const 1))
  )
  (func $type-f32 (result f32)
    (call_indirect (type $out-f32) (i32.const 2))
  )
  (func $type-f64 (result f64)
    (call_indirect (type $out-f64) (i32.const 3))
  )
  (func $type-first-i32 (result i32)
    (call_indirect (type $over-i32) (i32.const 32) (i32.const 4))
  )
  (func $type-first-i64 (result i64)
    (call_indirect (type $over-i64) (i64.const 64) (i32.const 5))
  )
  (func $type-first-f32 (result f32)
    (call_indirect (type $over-f32) (f32.const 1.32) (i32.const 6))
  )
  (func $type-first-f64 (result f64)
    (call_indirect (type $over-f64) (f64.const 1.64) (i32.const 7))
  )
  (func $type-second-i32 (result i32)
    (call_indirect (type $f32-i32) (f32.const 32.1) (i32.const 32) (i32.const 8))
  )
  (func $type-second-i64 (result i64)
    (call_indirect (type $i32-i64) (i32.const 32) (i64.const 64) (i32.const 9))
  )
  (func $type-second-f32 (result f32)
    (call_indirect (type $f64-f32) (f64.const 64) (f32.const 32) (i32.const 10))
  )
  (func $type-second-f64 (result f64)
    (call_indirect (type $i64-f64) (i64.const 64) (f64.const 64.1) (i32.const 11))
  )

  ;; Entrypoint
	(func (export "_start")
    (call $assert_test_i32 (call $type-i32) (i32.const 0x132))
    (call $assert_test_i64 (call $type-i64) (i64.const 0x164))
    (call $assert_test_f32 (call $type-f32) (f32.const 0xf32))
    (call $assert_test_f64 (call $type-f64) (f64.const 0xf64))
    (call $assert_test_i32 (call $type-first-i32) (i32.const 32))
    (call $assert_test_i64 (call $type-first-i64) (i64.const 64))
    (call $assert_test_f32 (call $type-second-f32) (f32.const 32))
    (call $assert_test_f64 (call $type-second-f64) (f64.const 64.1))
	)
)