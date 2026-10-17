#include "runtime.h"

#include <signal.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

//////////////////////////////////////////////
/// Linear memory used by the Wasker output
//////////////////////////////////////////////

#define PAGE_SIZE (64 * 1024)
#define MAX_PAGES 65536
// Reserve 8 GiB so that any 32-bit address plus offset lands in the reservation.
// Only grown pages are accessible; accessing others raises SIGSEGV (a trap).
#define RESERVED_SIZE (8ULL << 30)

static char *linear_memory;
static uint32_t linear_memory_pages;

char *memory_base(void)
{
    if (!linear_memory) {
        linear_memory = mmap(NULL, RESERVED_SIZE, PROT_NONE,
                             MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
        if (linear_memory == MAP_FAILED) {
            perror("mmap");
            exit(1);
        }
    }
    return linear_memory;
}

// Declared as `i32 (i32)` by Wasker. The delta is unsigned in Wasm.
int32_t memory_grow(uint32_t num)
{
    uint32_t old = linear_memory_pages;
    if (num > MAX_PAGES - old) {
        return -1;
    }
    if (num > 0 && mprotect(linear_memory + (size_t)old * PAGE_SIZE, (size_t)num * PAGE_SIZE,
                            PROT_READ | PROT_WRITE) != 0) {
        return -1;
    }
    linear_memory_pages += num;
    return (int32_t)old;
}

//////////////////////////////////////////////
/// Imports of the spectest module
//////////////////////////////////////////////

void print(void) { printf("spectest.print()\n"); }
void print_i32(uint32_t v) { printf("spectest.print_i32(%d)\n", (int32_t)v); }
void print_i64(uint64_t v) { printf("spectest.print_i64(%lld)\n", (long long)v); }
void print_f32(float v) { printf("spectest.print_f32(%g)\n", v); }
void print_f64(double v) { printf("spectest.print_f64(%g)\n", v); }
void print_i32_f32(uint32_t a, float b) { printf("spectest.print_i32_f32(%d %g)\n", (int32_t)a, b); }
void print_f64_f64(double a, double b) { printf("spectest.print_f64_f64(%g %g)\n", a, b); }

//////////////////////////////////////////////
/// Traps
//////////////////////////////////////////////

sigjmp_buf rt_trap_jmp;
volatile int rt_trap_armed;

static void on_trap(int sig)
{
    if (!rt_trap_armed) {
        // Not inside a Wasm call: fall back to the default action (crash).
        signal(sig, SIG_DFL);
        return;
    }
    rt_trap_armed = 0;
    siglongjmp(rt_trap_jmp, sig);
}

void rt_init(void)
{
    // Report results even if the process crashes later.
    setvbuf(stdout, NULL, _IONBF, 0);

    struct sigaction sa;
    memset(&sa, 0, sizeof(sa));
    sa.sa_handler = on_trap;
    sigemptyset(&sa.sa_mask);
    int signals[] = {SIGILL, SIGFPE, SIGSEGV, SIGBUS, SIGTRAP};
    for (size_t i = 0; i < sizeof(signals) / sizeof(signals[0]); i++) {
        sigaction(signals[i], &sa, NULL);
    }
}

//////////////////////////////////////////////
/// Results
//////////////////////////////////////////////

static int n_pass;
static int n_fail;

void rt_pass(int line)
{
    n_pass++;
    printf("PASS %d\n", line);
}

void rt_fail(int line, const char *fmt, ...)
{
    n_fail++;
    printf("FAIL %d: ", line);
    va_list ap;
    va_start(ap, fmt);
    vprintf(fmt, ap);
    va_end(ap);
    printf("\n");
}

int rt_finish(void)
{
    printf("DONE pass=%d fail=%d\n", n_pass, n_fail);
    return n_fail == 0 ? 0 : 1;
}

//////////////////////////////////////////////
/// Checks
//////////////////////////////////////////////

float rt_f32(uint32_t bits)
{
    float f;
    memcpy(&f, &bits, sizeof(f));
    return f;
}

double rt_f64(uint64_t bits)
{
    double f;
    memcpy(&f, &bits, sizeof(f));
    return f;
}

static uint32_t bits_f32(float f)
{
    uint32_t bits;
    memcpy(&bits, &f, sizeof(bits));
    return bits;
}

static uint64_t bits_f64(double f)
{
    uint64_t bits;
    memcpy(&bits, &f, sizeof(bits));
    return bits;
}

void rt_check_i32(int line, uint32_t got, uint32_t expected)
{
    if (got == expected)
        rt_pass(line);
    else
        rt_fail(line, "got 0x%08x, expected 0x%08x", got, expected);
}

void rt_check_i64(int line, uint64_t got, uint64_t expected)
{
    if (got == expected)
        rt_pass(line);
    else
        rt_fail(line, "got 0x%016llx, expected 0x%016llx", (unsigned long long)got,
                (unsigned long long)expected);
}

// Floats are compared by bit pattern, so that NaN and the sign of zero are also checked.
void rt_check_f32(int line, float got, uint32_t expected)
{
    rt_check_i32(line, bits_f32(got), expected);
}

void rt_check_f64(int line, double got, uint64_t expected)
{
    rt_check_i64(line, bits_f64(got), expected);
}

// Canonical NaN: exponent all ones, only the quiet bit set in the payload, any sign.
void rt_check_f32_canonical_nan(int line, float got)
{
    uint32_t bits = bits_f32(got);
    if ((bits & 0x7fffffffu) == 0x7fc00000u)
        rt_pass(line);
    else
        rt_fail(line, "got 0x%08x, expected canonical NaN", bits);
}

void rt_check_f64_canonical_nan(int line, double got)
{
    uint64_t bits = bits_f64(got);
    if ((bits & 0x7fffffffffffffffull) == 0x7ff8000000000000ull)
        rt_pass(line);
    else
        rt_fail(line, "got 0x%016llx, expected canonical NaN", (unsigned long long)bits);
}

// Arithmetic NaN: exponent all ones and the quiet bit set, any payload and sign.
void rt_check_f32_arithmetic_nan(int line, float got)
{
    uint32_t bits = bits_f32(got);
    if ((bits & 0x7fc00000u) == 0x7fc00000u)
        rt_pass(line);
    else
        rt_fail(line, "got 0x%08x, expected arithmetic NaN", bits);
}

void rt_check_f64_arithmetic_nan(int line, double got)
{
    uint64_t bits = bits_f64(got);
    if ((bits & 0x7ff8000000000000ull) == 0x7ff8000000000000ull)
        rt_pass(line);
    else
        rt_fail(line, "got 0x%016llx, expected arithmetic NaN", (unsigned long long)bits);
}
