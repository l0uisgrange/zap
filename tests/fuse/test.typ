#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    fuse("f1", (0, 0), (2, 0))
    afuse("f2", (0, -1), (2, -1))
    afuse("f2", (0, -2), (2, -2), asymmetry: 50%)
})

// Test decorations
#test({
    import lib: *
    fuse("f1", (0, 0), (2, 0), label: $V_1$, u: $u_1$, i: $i_1$, f: $f_1$)
})

// Test styling
#test({
    import lib: *
    fuse("f1", (0, 0), (2, 0), fill: red.lighten(50%), stroke: red)
})
