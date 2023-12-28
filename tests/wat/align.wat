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
  (func $i32_align_switch (param i32 i32) (result i32)
    (local i32 i32)
    (local.set 2 (i32.const 10))
    (block $32
      (block $16u
        (block $16s
          (block $8u
            (block $8s
              (block $0
                (br_table $0 $8s $8u $16s $16u $32 (local.get 0))
              ) ;; 0
              (if (i32.eq (local.get 1) (i32.const 0))
                (then
                  (i32.store8 (i32.const 0) (local.get 2))
                  (local.set 3 (i32.load8_s (i32.const 0)))
                )
              )
              (if (i32.eq (local.get 1) (i32.const 1))
                (then
                  (i32.store8 align=1 (i32.const 0) (local.get 2))
                  (local.set 3 (i32.load8_s align=1 (i32.const 0)))
                )
              )
              (br $32)
            ) ;; 8s
            (if (i32.eq (local.get 1) (i32.const 0))
              (then
                (i32.store8 (i32.const 0) (local.get 2))
                (local.set 3 (i32.load8_u (i32.const 0)))
              )
            )
            (if (i32.eq (local.get 1) (i32.const 1))
              (then
                (i32.store8 align=1 (i32.const 0) (local.get 2))
                (local.set 3 (i32.load8_u align=1 (i32.const 0)))
              )
            )
            (br $32)
          ) ;; 8u
          (if (i32.eq (local.get 1) (i32.const 0))
            (then
              (i32.store16 (i32.const 0) (local.get 2))
              (local.set 3 (i32.load16_s (i32.const 0)))
            )
          )
          (if (i32.eq (local.get 1) (i32.const 1))
            (then
              (i32.store16 align=1 (i32.const 0) (local.get 2))
              (local.set 3 (i32.load16_s align=1 (i32.const 0)))
            )
          )
          (if (i32.eq (local.get 1) (i32.const 2))
            (then
              (i32.store16 align=2 (i32.const 0) (local.get 2))
              (local.set 3 (i32.load16_s align=2 (i32.const 0)))
            )
          )
          (br $32)
        ) ;; 16s
        (if (i32.eq (local.get 1) (i32.const 0))
          (then
            (i32.store16 (i32.const 0) (local.get 2))
            (local.set 3 (i32.load16_u (i32.const 0)))
          )
        )
        (if (i32.eq (local.get 1) (i32.const 1))
          (then
            (i32.store16 align=1 (i32.const 0) (local.get 2))
            (local.set 3 (i32.load16_u align=1 (i32.const 0)))
          )
        )
        (if (i32.eq (local.get 1) (i32.const 2))
          (then
            (i32.store16 align=2 (i32.const 0) (local.get 2))
            (local.set 3 (i32.load16_u align=2 (i32.const 0)))
          )
        )
        (br $32)
      ) ;; 16u
      (if (i32.eq (local.get 1) (i32.const 0))
        (then
          (i32.store (i32.const 0) (local.get 2))
          (local.set 3 (i32.load (i32.const 0)))
        )
      )
      (if (i32.eq (local.get 1) (i32.const 1))
        (then
          (i32.store align=1 (i32.const 0) (local.get 2))
          (local.set 3 (i32.load align=1 (i32.const 0)))
        )
      )
      (if (i32.eq (local.get 1) (i32.const 2))
        (then
          (i32.store align=2 (i32.const 0) (local.get 2))
          (local.set 3 (i32.load align=2 (i32.const 0)))
        )
      )
      (if (i32.eq (local.get 1) (i32.const 4))
        (then
          (i32.store align=4 (i32.const 0) (local.get 2))
          (local.set 3 (i32.load align=4 (i32.const 0)))
        )
      )
    ) ;; 32
    (local.get 3)
  )
   (func $i64_align_switch (param i32 i32) (result i64)
    (local i64 i64)
    (local.set 2 (i64.const 10))
    (block $64
      (block $32u
        (block $32s
          (block $16u
            (block $16s
              (block $8u
                (block $8s
                  (block $0
                    (br_table $0 $8s $8u $16s $16u $32s $32u $64 (local.get 0))
                  ) ;; 0
                  (if (i32.eq (local.get 1) (i32.const 0))
                    (then
                      (i64.store8 (i32.const 0) (local.get 2))
                      (local.set 3 (i64.load8_s (i32.const 0)))
                    )
                  )
                  (if (i32.eq (local.get 1) (i32.const 1))
                    (then
                      (i64.store8 align=1 (i32.const 0) (local.get 2))
                      (local.set 3 (i64.load8_s align=1 (i32.const 0)))
                    )
                  )
                  (br $64)
                ) ;; 8s
                (if (i32.eq (local.get 1) (i32.const 0))
                  (then
                    (i64.store8 (i32.const 0) (local.get 2))
                    (local.set 3 (i64.load8_u (i32.const 0)))
                  )
                )
                (if (i32.eq (local.get 1) (i32.const 1))
                  (then
                    (i64.store8 align=1 (i32.const 0) (local.get 2))
                    (local.set 3 (i64.load8_u align=1 (i32.const 0)))
                  )
                )
                (br $64)
              ) ;; 8u
              (if (i32.eq (local.get 1) (i32.const 0))
                (then
                  (i64.store16 (i32.const 0) (local.get 2))
                  (local.set 3 (i64.load16_s (i32.const 0)))
                )
              )
              (if (i32.eq (local.get 1) (i32.const 1))
                (then
                  (i64.store16 align=1 (i32.const 0) (local.get 2))
                  (local.set 3 (i64.load16_s align=1 (i32.const 0)))
                )
              )
              (if (i32.eq (local.get 1) (i32.const 2))
                (then
                  (i64.store16 align=2 (i32.const 0) (local.get 2))
                  (local.set 3 (i64.load16_s align=2 (i32.const 0)))
                )
              )
              (br $64)
            ) ;; 16s
            (if (i32.eq (local.get 1) (i32.const 0))
              (then
                (i64.store16 (i32.const 0) (local.get 2))
                (local.set 3 (i64.load16_u (i32.const 0)))
              )
            )
            (if (i32.eq (local.get 1) (i32.const 1))
              (then
                (i64.store16 align=1 (i32.const 0) (local.get 2))
                (local.set 3 (i64.load16_u align=1 (i32.const 0)))
              )
            )
            (if (i32.eq (local.get 1) (i32.const 2))
              (then
                (i64.store16 align=2 (i32.const 0) (local.get 2))
                (local.set 3 (i64.load16_u align=2 (i32.const 0)))
              )
            )
            (br $64)
          ) ;; 16u
          (if (i32.eq (local.get 1) (i32.const 0))
            (then
              (i64.store32 (i32.const 0) (local.get 2))
              (local.set 3 (i64.load32_s (i32.const 0)))
            )
          )
          (if (i32.eq (local.get 1) (i32.const 1))
            (then
              (i64.store32 align=1 (i32.const 0) (local.get 2))
              (local.set 3 (i64.load32_s align=1 (i32.const 0)))
            )
          )
          (if (i32.eq (local.get 1) (i32.const 2))
            (then
              (i64.store32 align=2 (i32.const 0) (local.get 2))
              (local.set 3 (i64.load32_s align=2 (i32.const 0)))
            )
          )
          (if (i32.eq (local.get 1) (i32.const 4))
            (then
              (i64.store32 align=4 (i32.const 0) (local.get 2))
              (local.set 3 (i64.load32_s align=4 (i32.const 0)))
            )
          )
          (br $64)
        ) ;; 32s
        (if (i32.eq (local.get 1) (i32.const 0))
          (then
            (i64.store32 (i32.const 0) (local.get 2))
            (local.set 3 (i64.load32_u (i32.const 0)))
          )
        )
        (if (i32.eq (local.get 1) (i32.const 1))
          (then
            (i64.store32 align=1 (i32.const 0) (local.get 2))
            (local.set 3 (i64.load32_u align=1 (i32.const 0)))
          )
        )
        (if (i32.eq (local.get 1) (i32.const 2))
          (then
            (i64.store32 align=2 (i32.const 0) (local.get 2))
            (local.set 3 (i64.load32_u align=2 (i32.const 0)))
          )
        )
        (if (i32.eq (local.get 1) (i32.const 4))
          (then
            (i64.store32 align=4 (i32.const 0) (local.get 2))
            (local.set 3 (i64.load32_u align=4 (i32.const 0)))
          )
        )
        (br $64)
      ) ;; 32u
      (if (i32.eq (local.get 1) (i32.const 0))
        (then
          (i64.store (i32.const 0) (local.get 2))
          (local.set 3 (i64.load (i32.const 0)))
        )
      )
      (if (i32.eq (local.get 1) (i32.const 1))
        (then
          (i64.store align=1 (i32.const 0) (local.get 2))
          (local.set 3 (i64.load align=1 (i32.const 0)))
        )
      )
      (if (i32.eq (local.get 1) (i32.const 2))
        (then
          (i64.store align=2 (i32.const 0) (local.get 2))
          (local.set 3 (i64.load align=2 (i32.const 0)))
        )
      )
      (if (i32.eq (local.get 1) (i32.const 4))
        (then
          (i64.store align=4 (i32.const 0) (local.get 2))
          (local.set 3 (i64.load align=4 (i32.const 0)))
        )
      )
      (if (i32.eq (local.get 1) (i32.const 8))
        (then
          (i64.store align=8 (i32.const 0) (local.get 2))
          (local.set 3 (i64.load align=8 (i32.const 0)))
        )
      )
    ) ;; 64
    (local.get 3)
  )
  
  (func (export "_start")
    (call $assert_test_i32 (call $i32_align_switch (i32.const 0) (i32.const 0)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 0) (i32.const 1)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 1) (i32.const 0)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 1) (i32.const 1)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 2) (i32.const 0)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 2) (i32.const 1)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 2) (i32.const 2)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 3) (i32.const 0)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 3) (i32.const 1)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 3) (i32.const 2)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 4) (i32.const 0)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 4) (i32.const 1)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 4) (i32.const 2)) (i32.const 10))
    (call $assert_test_i32 (call $i32_align_switch (i32.const 4) (i32.const 4)) (i32.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 0) (i32.const 0)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 0) (i32.const 1)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 1) (i32.const 0)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 1) (i32.const 1)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 2) (i32.const 0)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 2) (i32.const 1)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 2) (i32.const 2)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 3) (i32.const 0)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 3) (i32.const 1)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 3) (i32.const 2)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 4) (i32.const 0)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 4) (i32.const 1)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 4) (i32.const 2)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 4) (i32.const 4)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 5) (i32.const 0)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 5) (i32.const 1)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 5) (i32.const 2)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 5) (i32.const 4)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 6) (i32.const 0)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 6) (i32.const 1)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 6) (i32.const 2)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 6) (i32.const 4)) (i64.const 10))
    (call $assert_test_i64 (call $i64_align_switch (i32.const 6) (i32.const 8)) (i64.const 10))
  )
)