#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    isource("i1", (0, 0), (2, 0))
    isource("i2", (0, -1.5), (2, -1.5), variant: "ieee")
    disource("i2", (0, -3), (2, -3))
})

// Test decorations
#test({
    import lib: *
    isource("i1", (0, 0), (2, 0), label: $V_1$, u: $u_1$, i: $i_1$, f: $f_1$)
})

// Test styling
#test({
    import lib: *
    isource("i1", (0, 0), (2, 0), fill: red.lighten(50%), stroke: red)
})
