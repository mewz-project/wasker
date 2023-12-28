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
  (func $8u_good1 (param $i i32) (result i64)
    (i64.load8_u offset=0 (local.get $i))                   ;; 97 'a'
  )
  (func $8u_good2 (param $i i32) (result i64)
    (i64.load8_u align=1 (local.get $i))                    ;; 97 'a'
  )
  (func $8u_good3 (param $i i32) (result i64)
    (i64.load8_u offset=1 align=1 (local.get $i))           ;; 98 'b'
  )
  (func $8u_good4 (param $i i32) (result i64)
    (i64.load8_u offset=2 align=1 (local.get $i))           ;; 99 'c'
  )
  (func $8u_good5 (param $i i32) (result i64)
    (i64.load8_u offset=25 align=1 (local.get $i))          ;; 122 'z'
  )

  (func $8s_good1 (param $i i32) (result i64)
    (i64.load8_s offset=0 (local.get $i))                   ;; 97 'a'
  )
  (func $8s_good2 (param $i i32) (result i64)
    (i64.load8_s align=1 (local.get $i))                    ;; 97 'a'
  )
  (func $8s_good3 (param $i i32) (result i64)
    (i64.load8_s offset=1 align=1 (local.get $i))           ;; 98 'b'
  )
  (func $8s_good4 (param $i i32) (result i64)
    (i64.load8_s offset=2 align=1 (local.get $i))           ;; 99 'c'
  )
  (func $8s_good5 (param $i i32) (result i64)
    (i64.load8_s offset=25 align=1 (local.get $i))          ;; 122 'z'
  )

  (func $16u_good1 (param $i i32) (result i64)
    (i64.load16_u offset=0 (local.get $i))                 ;; 25185 'ab'
  )
  (func $16u_good2 (param $i i32) (result i64)
    (i64.load16_u align=1 (local.get $i))                  ;; 25185 'ab'
  )
  (func $16u_good3 (param $i i32) (result i64)
    (i64.load16_u offset=1 align=1 (local.get $i))         ;; 25442 'bc'
  )
  (func $16u_good4 (param $i i32) (result i64)
    (i64.load16_u offset=2 align=2 (local.get $i))         ;; 25699 'cd'
  )
  (func $16u_good5 (param $i i32) (result i64)
    (i64.load16_u offset=25 align=2 (local.get $i))        ;; 122 'z\0'
  )

  (func $16s_good1 (param $i i32) (result i64)
    (i64.load16_s offset=0 (local.get $i))                 ;; 25185 'ab'
  )
  (func $16s_good2 (param $i i32) (result i64)
    (i64.load16_s align=1 (local.get $i))                  ;; 25185 'ab'
  )
  (func $16s_good3 (param $i i32) (result i64)
    (i64.load16_s offset=1 align=1 (local.get $i))         ;; 25442 'bc'
  )
  (func $16s_good4 (param $i i32) (result i64)
    (i64.load16_s offset=2 align=2 (local.get $i))         ;; 25699 'cd'
  )
  (func $16s_good5 (param $i i32) (result i64)
    (i64.load16_s offset=25 align=2 (local.get $i))        ;; 122 'z\0'
  )

  (func $32u_good1 (param $i i32) (result i64)
    (i64.load32_u offset=0 (local.get $i))                 ;; 1684234849 'abcd'
  )
  (func $32u_good2 (param $i i32) (result i64)
    (i64.load32_u align=1 (local.get $i))                  ;; 1684234849 'abcd'
  )
  (func $32u_good3 (param $i i32) (result i64)
    (i64.load32_u offset=1 align=1 (local.get $i))         ;; 1701077858 'bcde'
  )
  (func $32u_good4 (param $i i32) (result i64)
    (i64.load32_u offset=2 align=2 (local.get $i))         ;; 1717920867 'cdef'
  )
  (func $32u_good5 (param $i i32) (result i64)
    (i64.load32_u offset=25 align=4 (local.get $i))        ;; 122 'z\0\0\0'
  )

  (func $32s_good1 (param $i i32) (result i64)
    (i64.load32_s offset=0 (local.get $i))                 ;; 1684234849 'abcd'
  )
  (func $32s_good2 (param $i i32) (result i64)
    (i64.load32_s align=1 (local.get $i))                  ;; 1684234849 'abcd'
  )
  (func $32s_good3 (param $i i32) (result i64)
    (i64.load32_s offset=1 align=1 (local.get $i))         ;; 1701077858 'bcde'
  )
  (func $32s_good4 (param $i i32) (result i64)
    (i64.load32_s offset=2 align=2 (local.get $i))         ;; 1717920867 'cdef'
  )
  (func $32s_good5 (param $i i32) (result i64)
    (i64.load32_s offset=25 align=4 (local.get $i))        ;; 122 'z\0\0\0'
  )

  (func $64_good1 (param $i i32) (result i64)
    (i64.load offset=0 (local.get $i))                     ;; 0x6867666564636261 'abcdefgh'
  )
  (func $64_good2 (param $i i32) (result i64)
    (i64.load align=1 (local.get $i))                      ;; 0x6867666564636261 'abcdefgh'
  )
  (func $64_good3 (param $i i32) (result i64)
    (i64.load offset=1 align=1 (local.get $i))             ;; 0x6968676665646362 'bcdefghi'
  )
  (func $64_good4 (param $i i32) (result i64)
    (i64.load offset=2 align=2 (local.get $i))             ;; 0x6a69686766656463 'cdefghij'
  )
  (func $64_good5 (param $i i32) (result i64)
    (i64.load offset=25 align=8 (local.get $i))            ;; 122 'z\0\0\0\0\0\0\0'
  )

  
  (func (export "_start")
    (call $assert_test_i64 (call $8u_good1 (i32.const 0)) (i64.const 97))
    (call $assert_test_i64 (call $8u_good2 (i32.const 0)) (i64.const 97))
    (call $assert_test_i64 (call $8u_good3 (i32.const 0)) (i64.const 98))
    (call $assert_test_i64 (call $8u_good4 (i32.const 0)) (i64.const 99))
    (call $assert_test_i64 (call $8u_good5 (i32.const 0)) (i64.const 122))

    (call $assert_test_i64 (call $8s_good1 (i32.const 0)) (i64.const 97))
    (call $assert_test_i64 (call $8s_good2 (i32.const 0)) (i64.const 97))
    (call $assert_test_i64 (call $8s_good3 (i32.const 0)) (i64.const 98))
    (call $assert_test_i64 (call $8s_good4 (i32.const 0)) (i64.const 99))
    (call $assert_test_i64 (call $8s_good5 (i32.const 0)) (i64.const 122))

    (call $assert_test_i64 (call $16u_good1 (i32.const 0)) (i64.const 25185))
    (call $assert_test_i64 (call $16u_good2 (i32.const 0)) (i64.const 25185))
    (call $assert_test_i64 (call $16u_good3 (i32.const 0)) (i64.const 25442))
    (call $assert_test_i64 (call $16u_good4 (i32.const 0)) (i64.const 25699))
    (call $assert_test_i64 (call $16u_good5 (i32.const 0)) (i64.const 122))

    (call $assert_test_i64 (call $16s_good1 (i32.const 0)) (i64.const 25185))
    (call $assert_test_i64 (call $16s_good2 (i32.const 0)) (i64.const 25185))
    (call $assert_test_i64 (call $16s_good3 (i32.const 0)) (i64.const 25442))
    (call $assert_test_i64 (call $16s_good4 (i32.const 0)) (i64.const 25699))
    (call $assert_test_i64 (call $16s_good5 (i32.const 0)) (i64.const 122))

    (call $assert_test_i64 (call $32u_good1 (i32.const 0)) (i64.const 1684234849))
    (call $assert_test_i64 (call $32u_good2 (i32.const 0)) (i64.const 1684234849))
    (call $assert_test_i64 (call $32u_good3 (i32.const 0)) (i64.const 1701077858))
    (call $assert_test_i64 (call $32u_good4 (i32.const 0)) (i64.const 1717920867))
    (call $assert_test_i64 (call $32u_good5 (i32.const 0)) (i64.const 122))

    (call $assert_test_i64 (call $32s_good1 (i32.const 0)) (i64.const 1684234849))
    (call $assert_test_i64 (call $32s_good2 (i32.const 0)) (i64.const 1684234849))
    (call $assert_test_i64 (call $32s_good3 (i32.const 0)) (i64.const 1701077858))
    (call $assert_test_i64 (call $32s_good4 (i32.const 0)) (i64.const 1717920867))
    (call $assert_test_i64 (call $32s_good5 (i32.const 0)) (i64.const 122))

    (call $assert_test_i64 (call $64_good1 (i32.const 0)) (i64.const 0x6867666564636261))
    (call $assert_test_i64 (call $64_good2 (i32.const 0)) (i64.const 0x6867666564636261))
    (call $assert_test_i64 (call $64_good3 (i32.const 0)) (i64.const 0x6968676665646362))
    (call $assert_test_i64 (call $64_good4 (i32.const 0)) (i64.const 0x6a69686766656463))
    (call $assert_test_i64 (call $64_good5 (i32.const 0)) (i64.const 122))

    (call $assert_test_i64 (call $8u_good1 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $8u_good2 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $8u_good3 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $8u_good4 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $8u_good5 (i32.const 65503)) (i64.const 0))

    (call $assert_test_i64 (call $8s_good1 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $8s_good2 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $8s_good3 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $8s_good4 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $8s_good5 (i32.const 65503)) (i64.const 0))

    (call $assert_test_i64 (call $16u_good1 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $16u_good2 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $16u_good3 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $16u_good4 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $16u_good5 (i32.const 65503)) (i64.const 0))

    (call $assert_test_i64 (call $16s_good1 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $16s_good2 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $16s_good3 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $16s_good4 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $16s_good5 (i32.const 65503)) (i64.const 0))

    (call $assert_test_i64 (call $32u_good1 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $32u_good2 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $32u_good3 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $32u_good4 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $32u_good5 (i32.const 65503)) (i64.const 0))

    (call $assert_test_i64 (call $32s_good1 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $32s_good2 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $32s_good3 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $32s_good4 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $32s_good5 (i32.const 65503)) (i64.const 0))

    (call $assert_test_i64 (call $64_good1 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $64_good2 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $64_good3 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $64_good4 (i32.const 65503)) (i64.const 0))
    (call $assert_test_i64 (call $64_good5 (i32.const 65503)) (i64.const 0))

    (call $assert_test_i64 (call $8u_good1 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $8u_good2 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $8u_good3 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $8u_good4 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $8u_good5 (i32.const 65504)) (i64.const 0))

    (call $assert_test_i64 (call $8s_good1 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $8s_good2 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $8s_good3 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $8s_good4 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $8s_good5 (i32.const 65504)) (i64.const 0))

    (call $assert_test_i64 (call $16u_good1 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $16u_good2 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $16u_good3 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $16u_good4 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $16u_good5 (i32.const 65504)) (i64.const 0))

    (call $assert_test_i64 (call $16s_good1 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $16s_good2 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $16s_good3 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $16s_good4 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $16s_good5 (i32.const 65504)) (i64.const 0))

    (call $assert_test_i64 (call $32u_good1 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $32u_good2 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $32u_good3 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $32u_good4 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $32u_good5 (i32.const 65504)) (i64.const 0))

    (call $assert_test_i64 (call $32s_good1 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $32s_good2 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $32s_good3 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $32s_good4 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $32s_good5 (i32.const 65504)) (i64.const 0))

    (call $assert_test_i64 (call $64_good1 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $64_good2 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $64_good3 (i32.const 65504)) (i64.const 0))
    (call $assert_test_i64 (call $64_good4 (i32.const 65504)) (i64.const 0))
  )
)