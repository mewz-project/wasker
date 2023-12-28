;; hello_world.wat

(module

  ;; Import our myprint function
  (import "myenv" "print" (func $print (param i64 i32)))

  ;; Define a single page memory of 64KB.
  (memory $0 1)
  
  ;; Declare global
  (global $a_global (mut i32) (i32.const 5))
  (global $b_global i32 (i32.const 5))

  ;; Store the Hello World (null terminated) string at byte offset 0
  (data (i32.const 0) "123456789012345678901234567890123456789012345678901234567890")

  (func $printd (param $len i32)
    i64.const 0
    (local.get $len)
    (call $print)
  )

  ;; Entrypoint
	(func (export "_start")
    i32.const 20
    global.set $a_global

    global.get $a_global
    global.get $b_global
    i32.add
    (call $printd)
	)
)