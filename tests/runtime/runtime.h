// Test runtime shared by the generated test cases.
//
// Functions called by the Wasker output (memory_base, memory_grow and the
// spectest imports) keep their fixed names. Everything else is prefixed with
// `rt_` to avoid clashing with the symbols of exported Wasm functions.

#ifndef WASKER_TEST_RUNTIME_H
#define WASKER_TEST_RUNTIME_H

#include <setjmp.h>
#include <stdint.h>

extern void wasker_main(void);

extern sigjmp_buf rt_trap_jmp;
extern volatile int rt_trap_armed;

void rt_init(void);
int rt_finish(void);

void rt_pass(int line);
void rt_fail(int line, const char *fmt, ...);

float rt_f32(uint32_t bits);
double rt_f64(uint64_t bits);

void rt_check_i32(int line, uint32_t got, uint32_t expected);
void rt_check_i64(int line, uint64_t got, uint64_t expected);
void rt_check_f32(int line, float got, uint32_t expected);
void rt_check_f64(int line, double got, uint64_t expected);
void rt_check_f32_canonical_nan(int line, float got);
void rt_check_f64_canonical_nan(int line, double got);
void rt_check_f32_arithmetic_nan(int line, float got);
void rt_check_f64_arithmetic_nan(int line, double got);

// Run `stmt`, which calls a Wasm function. A trap inside it is reported as a failure.
#define RT_RUN(line, stmt)                                       \
    do {                                                         \
        int rt_sig_ = sigsetjmp(rt_trap_jmp, 1);                 \
        if (rt_sig_ == 0) {                                      \
            rt_trap_armed = 1;                                   \
            stmt;                                                \
            rt_trap_armed = 0;                                   \
        } else {                                                 \
            rt_fail(line, "unexpected trap (signal %d)", rt_sig_); \
        }                                                        \
    } while (0)

// Expect `expr`, which calls a Wasm function, to trap.
#define RT_EXPECT_TRAP(line, expr)                                \
    do {                                                          \
        if (sigsetjmp(rt_trap_jmp, 1) == 0) {                     \
            rt_trap_armed = 1;                                    \
            (void)(expr);                                         \
            rt_trap_armed = 0;                                    \
            rt_fail(line, "expected trap, but returned normally"); \
        } else {                                                  \
            rt_pass(line);                                        \
        }                                                         \
    } while (0)

#endif
