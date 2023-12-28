;; Test `return` operator
(module

  ;; Import our myprint function
  (import "myenv" "print" (func $print (param i64 i32)))

  ;; Define a single page memory of 64KB.
  (memory $0 1)

  ;; Store strings at byte offset 0
  (data (i32.const 0) "abcdefghijklmnopqrstuvwxyz")
  (data (i32.const 36) "Test Passed\n")
  (data (i32.const 52) "#Test Failed\n")

  ;; Debug function
  (func $printSuccess
    i64.const 36
    i32.const 12
    (call $print)
  )

  (func $printFail
    i64.const 52
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
  
  (func $8s_good1 (param $i i32) (result i32)
    (i32.load8_s offset=0 (local.get $i))                   ;; 97 'a'
  )
  (func $8s_good2 (param $i i32) (result i32)
    (i32.load8_s align=1 (local.get $i))                    ;; 97 'a'
  )
  (func $8s_good3 (param $i i32) (result i32)
    (i32.load8_s offset=1 align=1 (local.get $i))           ;; 98 'b'
  )
  (func $8s_good4 (param $i i32) (result i32)
    (i32.load8_s offset=2 align=1 (local.get $i))           ;; 99 'c'
  )
  (func $8s_good5 (param $i i32) (result i32)
    (i32.load8_s offset=25 align=1 (local.get $i))          ;; 122 'z'
  )
  (func $16u_good1 (param $i i32) (result i32)
    (i32.load16_u offset=0 (local.get $i))                  ;; 25185 'ab'
  )
  (func $16u_good2 (param $i i32) (result i32)
    (i32.load16_u align=1 (local.get $i))                   ;; 25185 'ab'
  )
  (func $16u_good3 (param $i i32) (result i32)
    (i32.load16_u offset=1 align=1 (local.get $i))          ;; 25442 'bc'
  )
  (func $16u_good4 (param $i i32) (result i32)
    (i32.load16_u offset=2 align=2 (local.get $i))          ;; 25699 'cd'
  )
  (func $16u_good5 (param $i i32) (result i32)
    (i32.load16_u offset=25 align=2 (local.get $i))         ;; 122 'z\0'
  )

  (func $16s_good1 (param $i i32) (result i32)
    (i32.load16_s offset=0 (local.get $i))                  ;; 25185 'ab'
  )
  (func $16s_good2 (param $i i32) (result i32)
    (i32.load16_s align=1 (local.get $i))                   ;; 25185 'ab'
  )
  (func $16s_good3 (param $i i32) (result i32)
    (i32.load16_s offset=1 align=1 (local.get $i))          ;; 25442 'bc'
  )
  (func $16s_good4 (param $i i32) (result i32)
    (i32.load16_s offset=2 align=2 (local.get $i))          ;; 25699 'cd'
  )
  (func $16s_good5 (param $i i32) (result i32)
    (i32.load16_s offset=25 align=2 (local.get $i))         ;; 122 'z\0'
  )

  (func $32_good1 (param $i i32) (result i32)
    (i32.load offset=0 (local.get $i))                      ;; 1684234849 'abcd'
  )
  (func $32_good2 (param $i i32) (result i32)
    (i32.load align=1 (local.get $i))                       ;; 1684234849 'abcd'
  )
  (func $32_good3 (param $i i32) (result i32)
    (i32.load offset=1 align=1 (local.get $i))              ;; 1701077858 'bcde'
  )
  (func $32_good4 (param $i i32) (result i32)
    (i32.load offset=2 align=2 (local.get $i))              ;; 1717920867 'cdef'
  )
  (func $32_good5 (param $i i32) (result i32)
    (i32.load offset=25 align=4 (local.get $i))             ;; 122 'z\0\0\0'
  )

  (func $8u_bad (param $i i32)
    (drop (i32.load8_u offset=4294967295 (local.get $i)))
  )
  (func $8s_bad (param $i i32)
    (drop (i32.load8_s offset=4294967295 (local.get $i)))
  )
  (func $16u_bad (param $i i32)
    (drop (i32.load16_u offset=4294967295 (local.get $i)))
  )
  (func $16s_bad (param $i i32)
    (drop (i32.load16_s offset=4294967295 (local.get $i)))
  )
  (func $32_bad (param $i i32)
    (drop (i32.load offset=4294967295 (local.get $i)))
  )
  (func $8u_good1 (param $i i32) (result i32)
    (i32.load8_u offset=0 (local.get $i))                   ;; 97 'a'
  )
  (func $8u_good2 (param $i i32) (result i32)
    (i32.load8_u align=1 (local.get $i))                    ;; 97 'a'
  )
  (func $8u_good3 (param $i i32) (result i32)
    (i32.load8_u offset=1 align=1 (local.get $i))           ;; 98 'b'
  )
  (func $8u_good4 (param $i i32) (result i32)
    (i32.load8_u offset=2 align=1 (local.get $i))           ;; 99 'c'
  )
  (func $8u_good5 (param $i i32) (result i32)
    (i32.load8_u offset=25 align=1 (local.get $i))          ;; 122 'z'
  )
  
  (func (export "_start")
    (call $assert_test_i32 (call $8u_good1 (i32.const 0)) (i32.const 97))
    (call $assert_test_i32 (call $8u_good2 (i32.const 0)) (i32.const 97))
    (call $assert_test_i32 (call $8u_good3 (i32.const 0)) (i32.const 98))
    (call $assert_test_i32 (call $8u_good4 (i32.const 0)) (i32.const 99))
    (call $assert_test_i32 (call $8u_good5 (i32.const 0)) (i32.const 122))
    (call $assert_test_i32 (call $8s_good1 (i32.const 0)) (i32.const 97))
    (call $assert_test_i32 (call $8s_good2 (i32.const 0)) (i32.const 97))
    (call $assert_test_i32 (call $8s_good3 (i32.const 0)) (i32.const 98))
    (call $assert_test_i32 (call $8s_good4 (i32.const 0)) (i32.const 99))
    (call $assert_test_i32 (call $8s_good5 (i32.const 0)) (i32.const 122))
    (call $assert_test_i32 (call $16u_good1 (i32.const 0)) (i32.const 25185))
    (call $assert_test_i32 (call $16u_good2 (i32.const 0)) (i32.const 25185))
    (call $assert_test_i32 (call $16u_good3 (i32.const 0)) (i32.const 25442))
    (call $assert_test_i32 (call $16u_good4 (i32.const 0)) (i32.const 25699))
    (call $assert_test_i32 (call $16u_good5 (i32.const 0)) (i32.const 122))

    (call $assert_test_i32 (call $16s_good1 (i32.const 0)) (i32.const 25185))
    (call $assert_test_i32 (call $16s_good2 (i32.const 0)) (i32.const 25185))
    (call $assert_test_i32 (call $16s_good3 (i32.const 0)) (i32.const 25442))
    (call $assert_test_i32 (call $16s_good4 (i32.const 0)) (i32.const 25699))
    (call $assert_test_i32 (call $16s_good5 (i32.const 0)) (i32.const 122))

    (call $assert_test_i32 (call $32_good1 (i32.const 0)) (i32.const 1684234849))
    (call $assert_test_i32 (call $32_good2 (i32.const 0)) (i32.const 1684234849))
    (call $assert_test_i32 (call $32_good3 (i32.const 0)) (i32.const 1701077858))
    (call $assert_test_i32 (call $32_good4 (i32.const 0)) (i32.const 1717920867))
    (call $assert_test_i32 (call $32_good5 (i32.const 0)) (i32.const 122))

    (call $assert_test_i32 (call $8u_good1 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $8u_good2 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $8u_good3 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $8u_good4 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $8u_good5 (i32.const 65507)) (i32.const 0))

    (call $assert_test_i32 (call $8s_good1 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $8s_good2 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $8s_good3 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $8s_good4 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $8s_good5 (i32.const 65507)) (i32.const 0))

    (call $assert_test_i32 (call $16u_good1 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $16u_good2 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $16u_good3 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $16u_good4 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $16u_good5 (i32.const 65507)) (i32.const 0))

    (call $assert_test_i32 (call $16s_good1 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $16s_good2 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $16s_good3 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $16s_good4 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $16s_good5 (i32.const 65507)) (i32.const 0))

    (call $assert_test_i32 (call $32_good1 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $32_good2 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $32_good3 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $32_good4 (i32.const 65507)) (i32.const 0))
    (call $assert_test_i32 (call $32_good5 (i32.const 65507)) (i32.const 0))

    (call $assert_test_i32 (call $8u_good1 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $8u_good2 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $8u_good3 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $8u_good4 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $8u_good5 (i32.const 65508)) (i32.const 0))

    (call $assert_test_i32 (call $8s_good1 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $8s_good2 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $8s_good3 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $8s_good4 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $8s_good5 (i32.const 65508)) (i32.const 0))

    (call $assert_test_i32 (call $16u_good1 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $16u_good2 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $16u_good3 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $16u_good4 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $16u_good5 (i32.const 65508)) (i32.const 0))

    (call $assert_test_i32 (call $16s_good1 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $16s_good2 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $16s_good3 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $16s_good4 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $16s_good5 (i32.const 65508)) (i32.const 0))

    (call $assert_test_i32 (call $32_good1 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $32_good2 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $32_good3 (i32.const 65508)) (i32.const 0))
    (call $assert_test_i32 (call $32_good4 (i32.const 65508)) (i32.const 0))
  )
)