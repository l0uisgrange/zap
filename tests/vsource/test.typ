#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    vsource("v1", (0, 0), (2, 0))
    vsource("v1", (0, -1.5), (2, -1.5), variant: "ieee")
    acvsource("v2", (0, -3), (2, -3))
})

// Test rotation (horizontal ac symbol)
#test({
    import lib: *
    acvsource("v2", (0, 0), (2, 2))
})

// Test decorations
#test({
    import lib: *
    vsource("v1", (0, 0), (2, 0), label: $V_1$, u: $u_1$, i: $i_1$, f: $f_1$)
})

// Test styling
#test({
    import lib: *
    vsource("v1", (0, 0), (2, 0), fill: red.lighten(90%), stroke: 1pt + red)
})
