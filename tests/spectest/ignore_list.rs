//! Known failures of the spec tests. Every entry is skipped.

#[allow(dead_code)]
pub enum Ignore {
    /// Skip a whole wast file.
    File {
        wast: &'static str,
        reason: &'static str,
    },
    /// Skip the assertions invoking the exported function `name`.
    Invoke {
        wast: &'static str,
        name: &'static str,
        reason: &'static str,
    },
    /// Skip the directives at `lines`. For a module, its assertions are skipped too.
    Lines {
        wast: &'static str,
        lines: &'static [usize],
        reason: &'static str,
    },
    /// Skip every `assert_invalid`.
    AssertInvalid { reason: &'static str },
}

pub const IGNORE_LIST: &[Ignore] = &[
    Ignore::AssertInvalid {
        reason: "Wasker does not validate modules",
    },
    Ignore::Invoke {
        wast: "f32.wast",
        name: "min",
        reason: "min/max do not propagate NaN or order signed zeros (#15)",
    },
    Ignore::Invoke {
        wast: "f64.wast",
        name: "min",
        reason: "min/max do not propagate NaN or order signed zeros (#15)",
    },
    Ignore::Invoke {
        wast: "f32.wast",
        name: "max",
        reason: "min/max do not propagate NaN or order signed zeros (#15)",
    },
    Ignore::Invoke {
        wast: "f64.wast",
        name: "max",
        reason: "min/max do not propagate NaN or order signed zeros (#15)",
    },
    Ignore::Lines {
        wast: "address.wast",
        lines: &[
            201, 202, 203, 204, 205, 207, 208, 209, 210, 211, 496, 497, 498, 499, 500, 501, 502,
            504, 505, 506, 507, 508, 509, 510, 559, 560, 609, 610,
        ],
        reason: "does not trap (Wasker has no trap mechanism)",
    },
    Ignore::Lines {
        wast: "binary.wast",
        lines: &[566, 590],
        reason: "passive element segments are not supported",
    },
    Ignore::Lines {
        wast: "binary.wast",
        lines: &[
            40, 41, 42, 43, 44, 48, 49, 125, 145, 165, 184, 203, 223, 242, 261, 279, 297, 400, 419,
            453, 463, 831, 1132,
        ],
        reason: "wasker accepts a malformed binary",
    },
    Ignore::Lines {
        wast: "binary.wast",
        lines: &[55, 76, 92, 350, 366, 410, 430, 473, 495, 1085],
        reason: "wasker crashes on a malformed binary",
    },
    Ignore::Lines {
        wast: "binary.wast",
        lines: &[
            6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 24, 25, 28, 31, 34,
        ],
        reason: "wasker panics on input that is not a Wasm binary",
    },
    Ignore::Lines {
        wast: "block.wast",
        lines: &[3],
        reason: "multiple return values are not supported (#1)",
    },
    Ignore::Lines {
        wast: "br.wast",
        lines: &[3],
        reason: "multiple return values are not supported (#1)",
    },
    Ignore::Lines {
        wast: "br_table.wast",
        lines: &[3],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "bulk.wast",
        lines: &[45, 46, 52, 108, 110],
        reason: "does not trap (Wasker has no trap mechanism)",
    },
    Ignore::Lines {
        wast: "bulk.wast",
        lines: &[115, 154, 181, 196],
        reason: "memory.init and data.drop are not implemented",
    },
    Ignore::Lines {
        wast: "bulk.wast",
        lines: &[6, 199, 244, 274, 297],
        reason: "passive element segments are not supported",
    },
    Ignore::Lines {
        wast: "bulk.wast",
        lines: &[300],
        reason: "table instructions are not implemented (#3)",
    },
    Ignore::Lines {
        wast: "call.wast",
        lines: &[3],
        reason: "multiple return values are not supported (#1)",
    },
    Ignore::Lines {
        wast: "call_indirect.wast",
        lines: &[3],
        reason: "multiple return values are not supported (#1)",
    },
    Ignore::Lines {
        wast: "call_indirect.wast",
        lines: &[623],
        reason: "multiple tables are not supported (#2)",
    },
    Ignore::Lines {
        wast: "conversions.wast",
        lines: &[
            78, 79, 80, 81, 82, 83, 84, 85, 100, 101, 102, 103, 104, 105, 106, 107, 125, 126, 127,
            128, 129, 130, 131, 132, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 178,
            179, 180, 181, 182, 183, 184, 185, 198, 199, 200, 201, 202, 203, 204, 205, 223, 224,
            225, 226, 227, 228, 229, 230, 247, 248, 249, 250, 251, 252, 253, 254,
        ],
        reason: "does not trap (Wasker has no trap mechanism)",
    },
    Ignore::Lines {
        wast: "custom.wast",
        lines: &[122],
        reason: "wasker accepts a malformed binary",
    },
    Ignore::Lines {
        wast: "custom.wast",
        lines: &[101],
        reason: "wasker crashes on a malformed binary",
    },
    Ignore::Lines {
        wast: "data.wast",
        lines: &[62, 67, 73, 78, 155, 161],
        reason: "data segment offsets other than i32.const are not supported",
    },
    Ignore::Lines {
        wast: "elem.wast",
        lines: &[120, 127],
        reason: "data segment offsets other than i32.const are not supported",
    },
    Ignore::Lines {
        wast: "elem.wast",
        lines: &[352],
        reason: "declarative element segments are not supported",
    },
    Ignore::Lines {
        wast: "elem.wast",
        lines: &[80, 153, 672, 690],
        reason: "element segments with expressions are not supported",
    },
    Ignore::Lines {
        wast: "elem.wast",
        lines: &[4],
        reason: "passive element segments are not supported",
    },
    Ignore::Lines {
        wast: "elem.wast",
        lines: &[654, 681],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "elem.wast",
        lines: &[342],
        reason: "table instructions are not implemented (#3)",
    },
    Ignore::Lines {
        wast: "elem.wast",
        lines: &[148],
        reason: "unexpected trap",
    },
    Ignore::Lines {
        wast: "exports.wast",
        lines: &[16, 28],
        reason: "an exported function has no symbol",
    },
    Ignore::Lines {
        wast: "fac.wast",
        lines: &[1],
        reason: "multiple return values are not supported (#1)",
    },
    Ignore::Lines {
        wast: "float_exprs.wast",
        lines: &[
            75, 76, 106, 107, 136, 137, 148, 149, 160, 161, 172, 173, 638, 2349, 2350, 2351, 2352,
            2353, 2354, 2355, 2356, 2357, 2358, 2359, 2360, 2361,
        ],
        reason: "signaling NaN is not quieted",
    },
    Ignore::Lines {
        wast: "forward.wast",
        lines: &[1],
        reason: "an exported function has no symbol",
    },
    Ignore::Lines {
        wast: "func.wast",
        lines: &[3],
        reason: "multiple return values are not supported (#1)",
    },
    Ignore::Lines {
        wast: "global.wast",
        lines: &[3],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "if.wast",
        lines: &[3],
        reason: "multiple return values are not supported (#1)",
    },
    Ignore::Lines {
        wast: "imports.wast",
        lines: &[26, 97],
        reason: "an export clashes with a spectest import",
    },
    Ignore::Lines {
        wast: "imports.wast",
        lines: &[226],
        reason: "imported globals are not supported",
    },
    Ignore::Lines {
        wast: "imports.wast",
        lines: &[465, 477, 571, 587, 594],
        reason: "imported memories are not supported",
    },
    Ignore::Lines {
        wast: "imports.wast",
        lines: &[107],
        reason: "wasker panics on a local index",
    },
    Ignore::Lines {
        wast: "int_exprs.wast",
        lines: &[
            113, 114, 115, 116, 132, 133, 134, 135, 196, 197, 198, 199, 349, 350,
        ],
        reason: "does not trap (Wasker has no trap mechanism)",
    },
    Ignore::Lines {
        wast: "linking.wast",
        lines: &[50],
        reason: "imported globals are not supported",
    },
    Ignore::Lines {
        wast: "linking.wast",
        lines: &[367],
        reason: "imported memories are not supported",
    },
    Ignore::Lines {
        wast: "linking.wast",
        lines: &[422],
        reason: "imported tables are not supported",
    },
    Ignore::Lines {
        wast: "linking.wast",
        lines: &[96],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "linking.wast",
        lines: &[237],
        reason: "this global initializer is not supported",
    },
    Ignore::Lines {
        wast: "loop.wast",
        lines: &[3],
        reason: "multiple return values are not supported (#1)",
    },
    Ignore::Lines {
        wast: "memory_copy.wast",
        lines: &[4873, 4885, 4897],
        reason: "does not trap (Wasker has no trap mechanism)",
    },
    Ignore::Lines {
        wast: "memory_fill.wast",
        lines: &[118],
        reason: "does not trap (Wasker has no trap mechanism)",
    },
    Ignore::Lines {
        wast: "memory_grow.wast",
        lines: &[46, 47, 48, 61, 62],
        reason: "memory.grow does not fail beyond the maximum size",
    },
    Ignore::Lines {
        wast: "memory_init.wast",
        lines: &[
            50, 94, 138, 203, 211, 219, 240, 248, 255, 262, 269, 276, 283, 290, 297, 304, 815, 838,
            861, 884, 907, 930, 954,
        ],
        reason: "memory.init and data.drop are not implemented",
    },
    Ignore::Lines {
        wast: "memory_size.wast",
        lines: &[37, 39, 41, 43, 45, 61, 63],
        reason: "memory.grow does not fail beyond the maximum size",
    },
    Ignore::Lines {
        wast: "memory_trap.wast",
        lines: &[33],
        reason: "memory.grow does not fail beyond the maximum size",
    },
    Ignore::Lines {
        wast: "names.wast",
        lines: &[19],
        reason: "an export name cannot be used as a symbol",
    },
    Ignore::Lines {
        wast: "ref_func.wast",
        lines: &[6, 80],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "ref_is_null.wast",
        lines: &[1],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "ref_null.wast",
        lines: &[1],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "select.wast",
        lines: &[1],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "stack.wast",
        lines: &[156],
        reason: "imported tables are not supported",
    },
    Ignore::Lines {
        wast: "start.wast",
        lines: &[21, 51],
        reason: "an exported function has no symbol",
    },
    Ignore::Lines {
        wast: "table_copy.wast",
        lines: &[843, 935, 1027, 1119, 1211, 1303, 1395, 1487, 1579],
        reason: "multiple tables are not supported (#2)",
    },
    Ignore::Lines {
        wast: "table_copy.wast",
        lines: &[
            15, 107, 199, 291, 383, 475, 567, 659, 751, 1671, 1696, 1721, 1746, 1771, 1796, 1821,
            1846, 1871, 1896, 1921, 1946, 1971, 1996, 2021, 2046, 2071, 2096, 2121, 2146, 2171,
            2196,
        ],
        reason: "passive element segments are not supported",
    },
    Ignore::Lines {
        wast: "table_copy.wast",
        lines: &[
            2221, 2282, 2343, 2404, 2465, 2526, 2587, 2648, 2709, 2770, 2927,
        ],
        reason: "table instructions are not implemented (#3)",
    },
    Ignore::Lines {
        wast: "table_fill.wast",
        lines: &[1],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "table_get.wast",
        lines: &[1],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "table_grow.wast",
        lines: &[42],
        reason: "declarative element segments are not supported",
    },
    Ignore::Lines {
        wast: "table_grow.wast",
        lines: &[1, 53, 67, 84],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "table_init.wast",
        lines: &[197, 255, 313, 743, 767, 791, 815, 839, 863, 887],
        reason: "multiple tables are not supported (#2)",
    },
    Ignore::Lines {
        wast: "table_init.wast",
        lines: &[
            15, 73, 131, 407, 431, 455, 479, 503, 527, 551, 575, 599, 623, 647, 671, 695, 719,
            1478, 1540, 1602, 1792, 1982, 2076, 2122,
        ],
        reason: "passive element segments are not supported",
    },
    Ignore::Lines {
        wast: "table_set.wast",
        lines: &[1],
        reason: "reference types are not supported",
    },
    Ignore::Lines {
        wast: "table_size.wast",
        lines: &[1],
        reason: "table instructions are not implemented (#3)",
    },
    Ignore::Lines {
        wast: "token.wast",
        lines: &[30, 70],
        reason: "wasker crashes",
    },
    Ignore::Lines {
        wast: "traps.wast",
        lines: &[
            16, 17, 18, 19, 20, 21, 34, 35, 36, 37, 50, 51, 52, 53, 54, 55, 56, 57, 78, 79, 80, 81,
            82, 83, 84, 85, 86, 87, 88, 89, 90, 91,
        ],
        reason: "does not trap (Wasker has no trap mechanism)",
    },
    Ignore::Lines {
        wast: "type.wast",
        lines: &[3],
        reason: "multiple return values are not supported (#1)",
    },
    Ignore::Lines {
        wast: "unreachable.wast",
        lines: &[
            221, 222, 223, 224, 226, 227, 228, 229, 231, 232, 233, 234, 237, 238, 239, 242, 244,
            245, 246, 248, 249, 250, 251, 252, 254, 256, 257, 259, 261, 264, 265, 266, 267, 268,
            270, 271, 272, 274, 275, 276, 277, 279, 280, 281, 283, 284, 286, 287, 288, 289, 291,
            293, 294, 296, 298, 299, 301, 303,
        ],
        reason: "does not trap (Wasker has no trap mechanism)",
    },
    Ignore::Lines {
        wast: "unreached-valid.wast",
        lines: &[42, 43, 44, 45, 63],
        reason: "does not trap (Wasker has no trap mechanism)",
    },
    Ignore::Lines {
        wast: "unwind.wast",
        lines: &[3],
        reason: "wasker crashes",
    },
];
