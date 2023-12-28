;; hello_world.wat

(module

  ;; Import our myprint function
  (import "myenv" "print" (func $print (param i64 i32)))

  (data (i32.const 40) "Test Passed\n")
  (data (i32.const 56) "Test Failed\n")

  ;; Define a single page memory of 64KB.
  (memory $0 1)

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

  (func $const-i32 (result i32) (i32.const 0x132))
  (func $const-i64 (result i64) (i64.const 0x164))
  (func $const-f32 (result f32) (f32.const 0xf32))
  (func $const-f64 (result f64) (f64.const 0xf64))
  (func $id-i32 (param i32) (result i32) (local.get 0))
  (func $id-i64 (param i64) (result i64) (local.get 0))
  (func $id-f32 (param f32) (result f32) (local.get 0))
  (func $id-f64 (param f64) (result f64) (local.get 0))
  (func $f32-i32 (param f32 i32) (result i32) (local.get 1))
  (func $i32-i64 (param i32 i64) (result i64) (local.get 1))
  (func $f64-f32 (param f64 f32) (result f32) (local.get 1))
  (func $i64-f64 (param i64 f64) (result f64) (local.get 1))
  (func $type-i32 (result i32) (call $const-i32))
  (func $type-i64 (result i64) (call $const-i64))
  (func $type-f32 (result f32) (call $const-f32))
  (func $type-f64 (result f64) (call $const-f64))

  (func $type-first-i32 (result i32) (call $id-i32 (i32.const 32)))
  (func $type-first-i64 (result i64) (call $id-i64 (i64.const 64)))
  (func $type-first-f32 (result f32) (call $id-f32 (f32.const 1.32)))
  (func $type-first-f64 (result f64) (call $id-f64 (f64.const 1.64)))

  (func $type-second-i32 (result i32)
    (call $f32-i32 (f32.const 32.1) (i32.const 32))
  )
  (func $type-second-i64 (result i64)
    (call $i32-i64 (i32.const 32) (i64.const 64))
  )
  (func $type-second-f32 (result f32)
    (call $f64-f32 (f64.const 64) (f32.const 32))
  )
  (func $type-second-f64 (result f64)
    (call $i64-f64 (i64.const 64) (f64.const 64.1))
  )
  (func $fac (param i64) (result i64)
    (if (result i64) (i64.eqz (local.get 0))
      (then (i64.const 1))
      (else
        (i64.mul
          (local.get 0)
          (call $fac (i64.sub (local.get 0) (i64.const 1)))
        )
      )
    )
  )
  (func $fac-acc (param i64 i64) (result i64)
    (if (result i64) (i64.eqz (local.get 0))
      (then (local.get 1))
      (else
        (call $fac-acc
          (i64.sub (local.get 0) (i64.const 1))
          (i64.mul (local.get 0) (local.get 1))
        )
      )
    )
  )
  (func $fib (export "fib") (param i64) (result i64)
    (if (result i64) (i64.le_u (local.get 0) (i64.const 1))
      (then (i64.const 1))
      (else
        (i64.add
          (call $fib (i64.sub (local.get 0) (i64.const 2)))
          (call $fib (i64.sub (local.get 0) (i64.const 1)))
        )
      )
    )
  )
  (func $even (param i64) (result i32)
    (if (result i32) (i64.eqz (local.get 0))
      (then (i32.const 44))
      (else (call $odd (i64.sub (local.get 0) (i64.const 1))))
    )
  )
  (func $odd (param i64) (result i32)
    (if (result i32) (i64.eqz (local.get 0))
      (then (i32.const 99))
      (else (call $even (i64.sub (local.get 0) (i64.const 1))))
    )
  )
  (func $runaway (call $runaway))

  (func $mutual-runaway1 (call $mutual-runaway2))
  (func $mutual-runaway2 (call $mutual-runaway1))

  ;; As parameter of control constructs and instructions
  (func $as-select-first (result i32)
    (select (call $const-i32) (i32.const 2) (i32.const 3))
  )
  (func $as-select-mid (result i32)
    (select (i32.const 2) (call $const-i32) (i32.const 3))
  )
  (func $as-select-last (result i32)
    (select (i32.const 2) (i32.const 3) (call $const-i32))
  )

  (func $as-if-condition (result i32)
    (if (result i32) (call $const-i32) (then (i32.const 1)) (else (i32.const 2)))
  )

  (func $as-br_if-first (result i32)
    (block (result i32) (br_if 0 (call $const-i32) (i32.const 2)))
  )
  (func $as-br_if-last (result i32)
    (block (result i32) (br_if 0 (i32.const 2) (call $const-i32)))
  )

  (func $as-br_table-first (result i32)
    (block (result i32) (call $const-i32) (i32.const 2) (br_table 0 0))
  )
  (func $as-br_table-last (result i32)
    (block (result i32) (i32.const 2) (call $const-i32) (br_table 0 0))
  )
  (func $func (param i32 i32) (result i32) (local.get 0))
  (type $check (func (param i32 i32) (result i32)))
  (table funcref (elem $func))
  (func $as-call_indirect-first (result i32)
    (block (result i32)
      (call_indirect (type $check)
        (call $const-i32) (i32.const 2) (i32.const 0)
      )
    )
  )
  (func $as-call_indirect-mid (result i32)
    (block (result i32)
      (call_indirect (type $check)
        (i32.const 2) (call $const-i32) (i32.const 0)
      )
    )
  )
  (func $as-call_indirect-last (result i32)
    (block (result i32)
      (call_indirect (type $check)
        (i32.const 1) (i32.const 2) (call $const-i32)
      )
    )
  )

  (func $as-store-first
    (call $const-i32) (i32.const 1) (i32.store)
  )
  (func $as-store-last
    (i32.const 10) (call $const-i32) (i32.store)
  )

  (func $as-memory.grow-value (result i32)
    (memory.grow (call $const-i32))
  )
  (func $as-return-value (result i32)
    (call $const-i32) (return)
  )
  (func $as-drop-operand
    (call $const-i32) (drop)
  )
  (func $as-br-value (result i32)
    (block (result i32) (br 0 (call $const-i32)))
  )
  (func $as-local.set-value (result i32)
    (local i32) (local.set 0 (call $const-i32)) (local.get 0)
  )
  (func $as-local.tee-value (result i32)
    (local i32) (local.tee 0 (call $const-i32))
  )
  (global $a (mut i32) (i32.const 10))
  (func $as-global.set-value (result i32)
    (global.set $a (call $const-i32))
    (global.get $a)
  )
  (func $as-load-operand (result i32)
    (i32.load (call $const-i32))
  )

  (func $dummy (param i32) (result i32) (local.get 0))
  (func $du (param f32) (result f32) (local.get 0))
  (func $as-binary-left (result i32)
    (block (result i32) (i32.add (call $dummy (i32.const 1)) (i32.const 10)))
  )
  (func $as-binary-right (result i32)
    (block (result i32) (i32.sub (i32.const 10) (call $dummy (i32.const 1))))
  )

  (func $as-test-operand (result i32)
    (block (result i32) (i32.eqz (call $dummy (i32.const 1))))
  )

  (func $as-compare-left (result i32)
    (block (result i32) (i32.le_u (call $dummy (i32.const 1)) (i32.const 10)))
  )
  (func $as-compare-right (result i32)
    (block (result i32) (i32.ne (i32.const 10) (call $dummy (i32.const 1))))
  )

  (func $as-convert-operand (result i64)
    (block (result i64) (i64.extend_i32_s (call $dummy (i32.const 1))))
  )
  (func $return-from-long-argument-list-helper (param f32 i32 i32 f64 f32 f32 f32 f64 f32 i32 i32 f32 f64 i64 i64 i32 i64 i64 f32 i64 i64 i64 i32 f32 f32 f32 f64 f32 i32 i64 f32 f64 f64 f32 i32 f32 f32 f64 i64 f64 i32 i64 f32 f64 i32 i32 i32 i64 f64 i32 i64 i64 f64 f64 f64 f64 f64 f64 i32 f32 f64 f64 i32 i64 f32 f32 f32 i32 f64 f64 f64 f64 f64 f32 i64 i64 i32 i32 i32 f32 f64 i32 i64 f32 f32 f32 i32 i32 f32 f64 i64 f32 f64 f32 f32 f32 i32 f32 i64 i32) (result i32)
    (local.get 99)
  )
  (func $return-from-long-argument-list (param i32) (result i32)
    (call $return-from-long-argument-list-helper (f32.const 0) (i32.const 0) (i32.const 0) (f64.const 0) (f32.const 0) (f32.const 0) (f32.const 0) (f64.const 0) (f32.const 0) (i32.const 0) (i32.const 0) (f32.const 0) (f64.const 0) (i64.const 0) (i64.const 0) (i32.const 0) (i64.const 0) (i64.const 0) (f32.const 0) (i64.const 0) (i64.const 0) (i64.const 0) (i32.const 0) (f32.const 0) (f32.const 0) (f32.const 0) (f64.const 0) (f32.const 0) (i32.const 0) (i64.const 0) (f32.const 0) (f64.const 0) (f64.const 0) (f32.const 0) (i32.const 0) (f32.const 0) (f32.const 0) (f64.const 0) (i64.const 0) (f64.const 0) (i32.const 0) (i64.const 0) (f32.const 0) (f64.const 0) (i32.const 0) (i32.const 0) (i32.const 0) (i64.const 0) (f64.const 0) (i32.const 0) (i64.const 0) (i64.const 0) (f64.const 0) (f64.const 0) (f64.const 0) (f64.const 0) (f64.const 0) (f64.const 0) (i32.const 0) (f32.const 0) (f64.const 0) (f64.const 0) (i32.const 0) (i64.const 0) (f32.const 0) (f32.const 0) (f32.const 0) (i32.const 0) (f64.const 0) (f64.const 0) (f64.const 0) (f64.const 0) (f64.const 0) (f32.const 0) (i64.const 0) (i64.const 0) (i32.const 0) (i32.const 0) (i32.const 0) (f32.const 0) (f64.const 0) (i32.const 0) (i64.const 0) (f32.const 0) (f32.const 0) (f32.const 0) (i32.const 0) (i32.const 0) (f32.const 0) (f64.const 0) (i64.const 0) (f32.const 0) (f64.const 0) (f32.const 0) (f32.const 0) (f32.const 0) (i32.const 0) (f32.const 0) (i64.const 0) (local.get 0))
  )

  ;; Entrypoint
	(func (export "_start")
    (call $assert_test_i32 (call $type-i32) (i32.const 0x132))
    (call $assert_test_i64 (call $type-i64) (i64.const 0x164))
    (call $assert_test_f32 (call $type-f32) (f32.const 0xf32))
    (call $assert_test_f64 (call $type-f64) (f64.const 0xf64))
    (call $assert_test_i32 (call $type-first-i32) (i32.const 32))
    (call $assert_test_i64 (call $type-first-i64) (i64.const 64))
    (call $assert_test_f32 (call $type-first-f32) (f32.const 1.32))
    (call $assert_test_f64 (call $type-first-f64) (f64.const 1.64))
    (call $assert_test_i32 (call $type-second-i32) (i32.const 32))
    (call $assert_test_i64 (call $type-second-i64) (i64.const 64))
    (call $assert_test_f32 (call $type-second-f32) (f32.const 32))
    (call $assert_test_f64 (call $type-second-f64) (f64.const 64.1))
    (call $assert_test_i64 (call $fac (i64.const 0)) (i64.const 1))
    (call $assert_test_i64 (call $fac (i64.const 1)) (i64.const 1))
    (call $assert_test_i64 (call $fac (i64.const 5)) (i64.const 120))
    (call $assert_test_i64 (call $fac (i64.const 25)) (i64.const 7034535277573963776))
    (call $assert_test_i64 (call $fac-acc (i64.const 0) (i64.const 1)) (i64.const 1))
    (call $assert_test_i64 (call $fac-acc (i64.const 1) (i64.const 1)) (i64.const 1))
    (call $assert_test_i64 (call $fac-acc (i64.const 5) (i64.const 1)) (i64.const 120))
    (call $assert_test_i64
      (call $fac-acc (i64.const 25) (i64.const 1))
      (i64.const 7034535277573963776)
    )
    (call $assert_test_i64 (call $fib (i64.const 0)) (i64.const 1))
    (call $assert_test_i64 (call $fib (i64.const 1)) (i64.const 1))
    (call $assert_test_i64 (call $fib (i64.const 2)) (i64.const 2))
    (call $assert_test_i64 (call $fib (i64.const 5)) (i64.const 8))
    (call $assert_test_i64 (call $fib (i64.const 20)) (i64.const 10946))
    (call $assert_test_i32 (call $even (i64.const 0)) (i32.const 44))
    (call $assert_test_i32 (call $even (i64.const 1)) (i32.const 99))
    (call $assert_test_i32 (call $even (i64.const 100)) (i32.const 44))
    (call $assert_test_i32 (call $even (i64.const 77)) (i32.const 99))
    (call $assert_test_i32 (call $odd (i64.const 0)) (i32.const 99))
    (call $assert_test_i32 (call $odd (i64.const 1)) (i32.const 44))
    (call $assert_test_i32 (call $odd (i64.const 200)) (i32.const 99))
    (call $assert_test_i32 (call $odd (i64.const 77)) (i32.const 44))
    (call $assert_test_i32 (call $as-select-first) (i32.const 0x132))
    (call $assert_test_i32 (call $as-select-mid) (i32.const 2))
    (call $assert_test_i32 (call $as-select-last) (i32.const 2))
    (call $assert_test_i32 (call $as-if-condition) (i32.const 1))
    (call $assert_test_i32 (call $as-br_if-first) (i32.const 0x132))
    (call $assert_test_i32 (call $as-br_if-last) (i32.const 2))
    (call $assert_test_i32 (call $as-br_table-first) (i32.const 0x132))
    (call $assert_test_i32 (call $as-br_table-last) (i32.const 2))
    (call $assert_test_i32 (call $as-call_indirect-first) (i32.const 0x132))
    (call $assert_test_i32 (call $as-call_indirect-mid) (i32.const 2))
    (call $as-store-first)
    (call $as-store-last)
    (call $assert_test_i32 (call $as-memory.grow-value) (i32.const 1))
    (call $assert_test_i32 (call $as-return-value) (i32.const 0x132))
    (call $as-drop-operand)
    (call $assert_test_i32 (call $as-br-value) (i32.const 0x132))
    (call $assert_test_i32 (call $as-local.set-value) (i32.const 0x132))
    (call $assert_test_i32 (call $as-local.tee-value) (i32.const 0x132))
    (call $assert_test_i32 (call $as-global.set-value) (i32.const 0x132))
    (call $assert_test_i32 (call $as-load-operand) (i32.const 1))
    (call $assert_test_i32 (call $as-binary-left) (i32.const 11))
    (call $assert_test_i32 (call $as-binary-right) (i32.const 9))
    (call $assert_test_i32 (call $as-test-operand) (i32.const 0))
    (call $assert_test_i32 (call $as-compare-left) (i32.const 1))
    (call $assert_test_i32 (call $as-compare-right) (i32.const 1))
    (call $assert_test_i64 (call $as-convert-operand) (i64.const 1))
    (call $assert_test_i32 (call $return-from-long-argument-list (i32.const 42)) (i32.const 42))
	)
)