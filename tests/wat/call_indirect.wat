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
  ;; TODO: support multiple results
  ;; (type $out-f64-i32 (func (result f64 i32)))
  (type $over-i32 (func (param i32) (result i32)))
  (type $over-i64 (func (param i64) (result i64)))
  (type $over-f32 (func (param f32) (result f32)))
  (type $over-f64 (func (param f64) (result f64)))
  ;; TODO: support multiple results
  ;; (type $over-i32-f64 (func (param i32 f64) (result i32 f64)))
  ;; (type $swap-i32-i64 (func (param i32 i64) (result i64 i32)))
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
  ;; TODO: support multiple results
  ;; (func $const-f64-i32 (type $out-f64-i32) (f64.const 0xf64) (i32.const 32))

  (func $id-i32 (type $over-i32) (local.get 0))
  (func $id-i64 (type $over-i64) (local.get 0))
  (func $id-f32 (type $over-f32) (local.get 0))
  (func $id-f64 (type $over-f64) (local.get 0))
  ;; TODO: support multiple results
  ;; (func $id-i32-f64 (type $over-i32-f64) (local.get 0) (local.get 1))
  ;; (func $swap-i32-i64 (type $swap-i32-i64) (local.get 1) (local.get 0))
  
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
      $const-i32 $const-i64 $const-f32 $const-f64  ;; 0..3
      $id-i32 $id-i64 $id-f32 $id-f64              ;; 4..7
      $f32-i32 $i32-i64 $f64-f32 $i64-f64          ;; 9..11
      $fac-i64 $fib-i64 $even $odd                 ;; 12..15
      $runaway $mutual-runaway1 $mutual-runaway2   ;; 16..18
      $over-i32-duplicate $over-i64-duplicate      ;; 19..20
      $over-f32-duplicate $over-f64-duplicate      ;; 21..22
      $fac-i32 $fac-f32 $fac-f64                   ;; 23..25
      $fib-i32 $fib-f32 $fib-f64                   ;; 26..28
      ;; $const-f64-i32 $id-i32-f64 $swap-i32-i64     ;; 29..31
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

  ;; Typing

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
  ;; TODO: support multiple results
  ;; (func $type-f64-i32) (result f64 i32)
  ;;   (call_indirect (type $out-f64-i32) (i32.const 29))
  ;; )

  (func $type-index (result i64)
    (call_indirect (type $over-i64) (i64.const 100) (i32.const 5))
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

  ;; TODO: support multiple results
  ;; (func $type-all-f64-i32 (result f64 i32)
  ;;   (call_indirect (type $out-f64-i32) (i32.const 29))
  ;; )
  ;; (func $type-all-i32-f64 (result i32 f64)
  ;;   (call_indirect (type $over-i32-f64)
  ;;     (i32.const 1) (f64.const 2) (i32.const 30)
  ;;   )
  ;; )
  ;; (func $type-all-i32-i64 (result i64 i32)
  ;;   (call_indirect (type $swap-i32-i64)
  ;;     (i32.const 1) (i64.const 2) (i32.const 31)
  ;;   )
  ;; )

  ;; Dispatch

  (func $dispatch (param i32 i64) (result i64)
    (call_indirect (type $over-i64) (local.get 1) (local.get 0))
  )
  (func $dispatch-structural-i64 (param i32) (result i64)
    (call_indirect (type $over-i64-duplicate) (i64.const 9) (local.get 0))
  )
  (func $dispatch-structural-i32 (param i32) (result i32)
    (call_indirect (type $over-i32-duplicate) (i32.const 9) (local.get 0))
  )
  (func $dispatch-structural-f32 (param i32) (result f32)
    (call_indirect (type $over-f32-duplicate) (f32.const 9.0) (local.get 0))
  )
  (func $dispatch-structural-f64 (param i32) (result f64)
    (call_indirect (type $over-f64-duplicate) (f64.const 9.0) (local.get 0))
  )

  ;; Recursion

  (func $fac-i64 (type $over-i64)
    (if (result i64) (i64.eqz (local.get 0))
      (then (i64.const 1))
      (else
        (i64.mul
          (local.get 0)
          (call_indirect (type $over-i64)
            (i64.sub (local.get 0) (i64.const 1))
            (i32.const 12)
          )
        )
      )
    )
  )

  (func $fib-i64 (type $over-i64)
    (if (result i64) (i64.le_u (local.get 0) (i64.const 1))
      (then (i64.const 1))
      (else
        (i64.add
          (call_indirect (type $over-i64)
            (i64.sub (local.get 0) (i64.const 2))
            (i32.const 13)
          )
          (call_indirect (type $over-i64)
            (i64.sub (local.get 0) (i64.const 1))
            (i32.const 13)
          )
        )
      )
    )
  )

  (func $fac-i32 (type $over-i32)
    (if (result i32) (i32.eqz (local.get 0))
      (then (i32.const 1))
      (else
        (i32.mul
          (local.get 0)
          (call_indirect (type $over-i32)
            (i32.sub (local.get 0) (i32.const 1))
            (i32.const 23)
          )
        )
      )
    )
  )

  (func $fac-f32 (type $over-f32)
    (if (result f32) (f32.eq (local.get 0) (f32.const 0.0))
      (then (f32.const 1.0))
      (else
        (f32.mul
          (local.get 0)
          (call_indirect (type $over-f32)
            (f32.sub (local.get 0) (f32.const 1.0))
            (i32.const 24)
          )
        )
      )
    )
  )

  (func $fac-f64 (type $over-f64)
    (if (result f64) (f64.eq (local.get 0) (f64.const 0.0))
      (then (f64.const 1.0))
      (else
        (f64.mul
          (local.get 0)
          (call_indirect (type $over-f64)
            (f64.sub (local.get 0) (f64.const 1.0))
            (i32.const 25)
          )
        )
      )
    )
  )

  (func $fib-i32 (type $over-i32)
    (if (result i32) (i32.le_u (local.get 0) (i32.const 1))
      (then (i32.const 1))
      (else
        (i32.add
          (call_indirect (type $over-i32)
            (i32.sub (local.get 0) (i32.const 2))
            (i32.const 26)
          )
          (call_indirect (type $over-i32)
            (i32.sub (local.get 0) (i32.const 1))
            (i32.const 26)
          )
        )
      )
    )
  )

  (func $fib-f32 (type $over-f32)
    (if (result f32) (f32.le (local.get 0) (f32.const 1.0))
      (then (f32.const 1.0))
      (else
        (f32.add
          (call_indirect (type $over-f32)
            (f32.sub (local.get 0) (f32.const 2.0))
            (i32.const 27)
          )
          (call_indirect (type $over-f32)
            (f32.sub (local.get 0) (f32.const 1.0))
            (i32.const 27)
          )
        )
      )
    )
  )

  (func $fib-f64 (type $over-f64)
    (if (result f64) (f64.le (local.get 0) (f64.const 1.0))
      (then (f64.const 1.0))
      (else
        (f64.add
          (call_indirect (type $over-f64)
            (f64.sub (local.get 0) (f64.const 2.0))
            (i32.const 28)
          )
          (call_indirect (type $over-f64)
            (f64.sub (local.get 0) (f64.const 1.0))
            (i32.const 28)
          )
        )
      )
    )
  )

  (func $even (param i32) (result i32)
    (if (result i32) (i32.eqz (local.get 0))
      (then (i32.const 44))
      (else
        (call_indirect (type $over-i32)
          (i32.sub (local.get 0) (i32.const 1))
          (i32.const 15)
        )
      )
    )
  )
  (func $odd (param i32) (result i32)
    (if (result i32) (i32.eqz (local.get 0))
      (then (i32.const 99))
      (else
        (call_indirect (type $over-i32)
          (i32.sub (local.get 0) (i32.const 1))
          (i32.const 14)
        )
      )
    )
  )

  ;; Stack exhaustion

  ;; Implementations are required to have every call consume some abstract
  ;; resource towards exhausting some abstract finite limit, such that
  ;; infinitely recursive test cases reliably trap in finite time. This is
  ;; because otherwise applications could come to depend on it on those
  ;; implementations and be incompatible with implementations that don't do
  ;; it (or don't do it under the same circumstances).

  (func $runaway (call_indirect (type $proc) (i32.const 16)))

  (func $mutual-runaway1 (call_indirect (type $proc) (i32.const 18)))
  (func $mutual-runaway2 (call_indirect (type $proc) (i32.const 17)))

  ;; As parameter of control constructs and instructions

  (func $as-select-first (result i32)
    (select (call_indirect (type $out-i32) (i32.const 0)) (i32.const 2) (i32.const 3))
  )
  (func $as-select-mid (result i32)
    (select (i32.const 2) (call_indirect (type $out-i32) (i32.const 0)) (i32.const 3))
  )
  (func $as-select-last (result i32)
    (select (i32.const 2) (i32.const 3) (call_indirect (type $out-i32) (i32.const 0)))
  )

  (func $as-if-condition (result i32)
    (if (result i32) (call_indirect (type $out-i32) (i32.const 0)) (then (i32.const 1)) (else (i32.const 2)))
  )

  (func $as-br_if-first (result i64)
    (block (result i64) (br_if 0 (call_indirect (type $out-i64) (i32.const 1)) (i32.const 2)))
  )
  (func $as-br_if-last (result i32)
    (block (result i32) (br_if 0 (i32.const 2) (call_indirect (type $out-i32) (i32.const 0))))
  )

  (func $as-br_table-first (result f32)
    (block (result f32) (call_indirect (type $out-f32) (i32.const 2)) (i32.const 2) (br_table 0 0))
  )
  (func $as-br_table-last (result i32)
    (block (result i32) (i32.const 2) (call_indirect (type $out-i32) (i32.const 0)) (br_table 0 0))
  )

  (func $as-store-first
    (call_indirect (type $out-i32) (i32.const 0)) (i32.const 1) (i32.store)
  )
  (func $as-store-last
    (i32.const 10) (call_indirect (type $out-f64) (i32.const 3)) (f64.store)
  )

  (func $as-memory.grow-value (result i32)
    (memory.grow (call_indirect (type $out-i32) (i32.const 0)))
  )
  (func $as-return-value (result i32)
    (call_indirect (type $over-i32) (i32.const 1) (i32.const 4)) (return)
  )
  (func $as-drop-operand
    (call_indirect (type $over-i64) (i64.const 1) (i32.const 5)) (drop)
  )
  (func $as-br-value (result f32)
    (block (result f32) (br 0 (call_indirect (type $over-f32) (f32.const 1) (i32.const 6))))
  )
  (func $as-local.set-value (result f64)
    (local f64) (local.set 0 (call_indirect (type $over-f64) (f64.const 1) (i32.const 7))) (local.get 0)
  )
  (func $as-local.tee-value (result f64)
    (local f64) (local.tee 0 (call_indirect (type $over-f64) (f64.const 1) (i32.const 7)))
  )

  (global $a (mut f64) (f64.const 10.0))
  (func $as-global.set-value (result f64)
    (global.set $a (call_indirect (type $over-f64) (f64.const 1.0) (i32.const 7)))
    (global.get $a)
  )

  (func $as-load-operand (result i32)
    (i32.load (call_indirect (type $out-i32) (i32.const 0)))
  )

  (func $as-unary-operand (result f32)
    (block (result f32)
      (f32.sqrt
        (call_indirect (type $over-f32) (f32.const 0x0p+0) (i32.const 6))
      )
    )
  )

  (func $as-binary-left (result i32)
    (block (result i32)
      (i32.add
        (call_indirect (type $over-i32) (i32.const 1) (i32.const 4))
        (i32.const 10)
      )
    )
  )
  (func $as-binary-right (result i32)
    (block (result i32)
      (i32.sub
        (i32.const 10)
        (call_indirect (type $over-i32) (i32.const 1) (i32.const 4))
      )
    )
  )

  (func $as-test-operand (result i32)
    (block (result i32)
      (i32.eqz
        (call_indirect (type $over-i32) (i32.const 1) (i32.const 4))
      )
    )
  )

  (func $as-compare-left (result i32)
    (block (result i32)
      (i32.le_u
        (call_indirect (type $over-i32) (i32.const 1) (i32.const 4))
        (i32.const 10)
      )
    )
  )
  (func $as-compare-right (result i32)
    (block (result i32)
      (i32.ne
        (i32.const 10)
        (call_indirect (type $over-i32) (i32.const 1) (i32.const 4))
      )
    )
  )

  (func $as-convert-operand (result i64)
    (block (result i64)
      (i64.extend_i32_s
        (call_indirect (type $over-i32) (i32.const 1) (i32.const 4))
      )
    )
  )

  ;; Entrypoint
	(func (export "_start")
    (call $assert_test_i32 (call $type-i32) (i32.const 0x132))
    (call $assert_test_i64 (call $type-i64) (i64.const 0x164))
    (call $assert_test_f32 (call $type-f32) (f32.const 0xf32))
    (call $assert_test_f64 (call $type-f64) (f64.const 0xf64))
    ;; TODO: support multiple results
    ;; (call $assert_test_i64 (call $type-f64-i32") (f64.const 0xf64) (i32.const 32))

    (call $assert_test_i64 (call $type-index) (i64.const 100))

    (call $assert_test_i32 (call $type-first-i32) (i32.const 32))
    (call $assert_test_i64 (call $type-first-i64) (i64.const 64))
    (call $assert_test_f32 (call $type-first-f32) (f32.const 1.32))
    (call $assert_test_f64 (call $type-first-f64) (f64.const 1.64))

    (call $assert_test_i32 (call $type-second-i32) (i32.const 32))
    (call $assert_test_i64 (call $type-second-i64) (i64.const 64))
    (call $assert_test_f32 (call $type-second-f32) (f32.const 32))
    (call $assert_test_f64 (call $type-second-f64) (f64.const 64.1))

    ;; (call $assert_test_i64 (call $type-all-f64-i32") (f64.const 0xf64) (i32.const 32))
    ;; (call $assert_test_i64 (call $type-all-i32-f64") (i32.const 1) (f64.const 2))
    ;; (call $assert_test_i64 (call $type-all-i32-i64") (i64.const 2) (i32.const 1))

    (call $assert_test_i64 (call $dispatch (i32.const 5) (i64.const 2)) (i64.const 2))
    (call $assert_test_i64 (call $dispatch (i32.const 5) (i64.const 5)) (i64.const 5))
    (call $assert_test_i64 (call $dispatch (i32.const 12) (i64.const 5)) (i64.const 120))
    (call $assert_test_i64 (call $dispatch (i32.const 13) (i64.const 5)) (i64.const 8))
    (call $assert_test_i64 (call $dispatch (i32.const 20) (i64.const 2)) (i64.const 2))
    ;; (assert_trap (invoke "dispatch" (i32.const 0) (i64.const 2)) "indirect call type mismatch")
    ;; (assert_trap (invoke "dispatch" (i32.const 15) (i64.const 2)) "indirect call type mismatch")
    ;; (assert_trap (invoke "dispatch" (i32.const 32) (i64.const 2)) "undefined element")
    ;; (assert_trap (invoke "dispatch" (i32.const -1) (i64.const 2)) "undefined element")
    ;; (assert_trap (invoke "dispatch" (i32.const 1213432423) (i64.const 2)) "undefined element")

    (call $assert_test_i64 (call $dispatch-structural-i64 (i32.const 5)) (i64.const 9))
    (call $assert_test_i64 (call $dispatch-structural-i64 (i32.const 12)) (i64.const 362880))
    (call $assert_test_i64 (call $dispatch-structural-i64 (i32.const 13)) (i64.const 55))
    (call $assert_test_i64 (call $dispatch-structural-i64 (i32.const 20)) (i64.const 9))
    ;; (assert_trap (invoke "dispatch-structural-i64" (i32.const 11)) "indirect call type mismatch")
    ;; (assert_trap (invoke "dispatch-structural-i64" (i32.const 22)) "indirect call type mismatch")

    (call $assert_test_i32 (call $dispatch-structural-i32 (i32.const 4)) (i32.const 9))
    (call $assert_test_i32 (call $dispatch-structural-i32 (i32.const 23)) (i32.const 362880))
    (call $assert_test_i32 (call $dispatch-structural-i32 (i32.const 26)) (i32.const 55))
    (call $assert_test_i32 (call $dispatch-structural-i32 (i32.const 19)) (i32.const 9))
    ;; (assert_trap (invoke "dispatch-structural-i32" (i32.const 9)) "indirect call type mismatch")
    ;; (assert_trap (invoke "dispatch-structural-i32" (i32.const 21)) "indirect call type mismatch")

    (call $assert_test_f32 (call $dispatch-structural-f32 (i32.const 6)) (f32.const 9.0))
    (call $assert_test_f32 (call $dispatch-structural-f32 (i32.const 24)) (f32.const 362880.0))
    (call $assert_test_f32 (call $dispatch-structural-f32 (i32.const 27)) (f32.const 55.0))
    (call $assert_test_f32 (call $dispatch-structural-f32 (i32.const 21)) (f32.const 9.0))
    ;; (assert_trap (invoke "dispatch-structural-f32" (i32.const 8)) "indirect call type mismatch")
    ;; (assert_trap (invoke "dispatch-structural-f32" (i32.const 19)) "indirect call type mismatch")

    (call $assert_test_f64 (call $dispatch-structural-f64 (i32.const 7)) (f64.const 9.0))
    (call $assert_test_f64 (call $dispatch-structural-f64 (i32.const 25)) (f64.const 362880.0))
    (call $assert_test_f64 (call $dispatch-structural-f64 (i32.const 28)) (f64.const 55.0))
    (call $assert_test_f64 (call $dispatch-structural-f64 (i32.const 22)) (f64.const 9.0))
    ;; (assert_trap (invoke "dispatch-structural-f64" (i32.const 10)) "indirect call type mismatch")
    ;; (assert_trap (invoke "dispatch-structural-f64" (i32.const 18)) "indirect call type mismatch")

    (call $assert_test_i64 (call $fac-i64 (i64.const 0)) (i64.const 1))
    (call $assert_test_i64 (call $fac-i64 (i64.const 1)) (i64.const 1))
    (call $assert_test_i64 (call $fac-i64 (i64.const 5)) (i64.const 120))
    (call $assert_test_i64 (call $fac-i64 (i64.const 25)) (i64.const 7034535277573963776))

    (call $assert_test_i32 (call $fac-i32 (i32.const 0)) (i32.const 1))
    (call $assert_test_i32 (call $fac-i32 (i32.const 1)) (i32.const 1))
    (call $assert_test_i32 (call $fac-i32 (i32.const 5)) (i32.const 120))
    (call $assert_test_i32 (call $fac-i32 (i32.const 10)) (i32.const 3628800))

    (call $assert_test_f32 (call $fac-f32 (f32.const 0.0)) (f32.const 1.0))
    (call $assert_test_f32 (call $fac-f32 (f32.const 1.0)) (f32.const 1.0))
    (call $assert_test_f32 (call $fac-f32 (f32.const 5.0)) (f32.const 120.0))
    (call $assert_test_f32 (call $fac-f32 (f32.const 10.0)) (f32.const 3628800.0))

    (call $assert_test_f64 (call $fac-f64 (f64.const 0.0)) (f64.const 1.0))
    (call $assert_test_f64 (call $fac-f64 (f64.const 1.0)) (f64.const 1.0))
    (call $assert_test_f64 (call $fac-f64 (f64.const 5.0)) (f64.const 120.0))
    (call $assert_test_f64 (call $fac-f64 (f64.const 10.0)) (f64.const 3628800.0))

    (call $assert_test_i64 (call $fib-i64 (i64.const 0)) (i64.const 1))
    (call $assert_test_i64 (call $fib-i64 (i64.const 1)) (i64.const 1))
    (call $assert_test_i64 (call $fib-i64 (i64.const 2)) (i64.const 2))
    (call $assert_test_i64 (call $fib-i64 (i64.const 5)) (i64.const 8))
    (call $assert_test_i64 (call $fib-i64 (i64.const 20)) (i64.const 10946))

    (call $assert_test_i32 (call $fib-i32 (i32.const 0)) (i32.const 1))
    (call $assert_test_i32 (call $fib-i32 (i32.const 1)) (i32.const 1))
    (call $assert_test_i32 (call $fib-i32 (i32.const 2)) (i32.const 2))
    (call $assert_test_i32 (call $fib-i32 (i32.const 5)) (i32.const 8))
    (call $assert_test_i32 (call $fib-i32 (i32.const 20)) (i32.const 10946))

    (call $assert_test_f32 (call $fib-f32 (f32.const 0.0)) (f32.const 1.0))
    (call $assert_test_f32 (call $fib-f32 (f32.const 1.0)) (f32.const 1.0))
    (call $assert_test_f32 (call $fib-f32 (f32.const 2.0)) (f32.const 2.0))
    (call $assert_test_f32 (call $fib-f32 (f32.const 5.0)) (f32.const 8.0))
    (call $assert_test_f32 (call $fib-f32 (f32.const 20.0)) (f32.const 10946.0))

    (call $assert_test_f64 (call $fib-f64 (f64.const 0.0)) (f64.const 1.0))
    (call $assert_test_f64 (call $fib-f64 (f64.const 1.0)) (f64.const 1.0))
    (call $assert_test_f64 (call $fib-f64 (f64.const 2.0)) (f64.const 2.0))
    (call $assert_test_f64 (call $fib-f64 (f64.const 5.0)) (f64.const 8.0))
    (call $assert_test_f64 (call $fib-f64 (f64.const 20.0)) (f64.const 10946.0))

    (call $assert_test_i32 (call $even (i32.const 0)) (i32.const 44))
    (call $assert_test_i32 (call $even (i32.const 1)) (i32.const 99))
    (call $assert_test_i32 (call $even (i32.const 100)) (i32.const 44))
    (call $assert_test_i32 (call $even (i32.const 77)) (i32.const 99))
    (call $assert_test_i32 (call $odd (i32.const 0)) (i32.const 99))
    (call $assert_test_i32 (call $odd (i32.const 1)) (i32.const 44))
    (call $assert_test_i32 (call $odd (i32.const 200)) (i32.const 99))
    (call $assert_test_i32 (call $odd (i32.const 77)) (i32.const 44))

    ;; (assert_exhaustion (invoke "runaway") "call stack exhausted")
    ;; (assert_exhaustion (invoke "mutual-runaway") "call stack exhausted")

    (call $assert_test_i32 (call $as-select-first) (i32.const 0x132))
    (call $assert_test_i32 (call $as-select-mid) (i32.const 2))
    (call $assert_test_i32 (call $as-select-last) (i32.const 2))

    (call $assert_test_i32 (call $as-if-condition) (i32.const 1))

    (call $assert_test_i64 (call $as-br_if-first) (i64.const 0x164))
    (call $assert_test_i32 (call $as-br_if-last) (i32.const 2))

    (call $assert_test_f32 (call $as-br_table-first) (f32.const 0xf32))
    (call $assert_test_i32 (call $as-br_table-last) (i32.const 2))

    (call $as-store-first)
    (call $as-store-last)

    (call $assert_test_i32 (call $as-memory.grow-value) (i32.const 1))
    (call $assert_test_i32 (call $as-return-value) (i32.const 1))
    (call $as-drop-operand)
    (call $assert_test_f32 (call $as-br-value) (f32.const 1))
    (call $assert_test_f64 (call $as-local.set-value) (f64.const 1))
    (call $assert_test_f64 (call $as-local.tee-value) (f64.const 1))
    (call $assert_test_f64 (call $as-global.set-value) (f64.const 1.0))
    (call $assert_test_i32 (call $as-load-operand) (i32.const 1))

    (call $assert_test_f32 (call $as-unary-operand) (f32.const 0x0p+0))
    (call $assert_test_i32 (call $as-binary-left) (i32.const 11))
    (call $assert_test_i32 (call $as-binary-right) (i32.const 9))
    (call $assert_test_i32 (call $as-test-operand) (i32.const 0))
    (call $assert_test_i32 (call $as-compare-left) (i32.const 1))
    (call $assert_test_i32 (call $as-compare-right) (i32.const 1))
    (call $assert_test_i64 (call $as-convert-operand) (i64.const 1))

	)
)