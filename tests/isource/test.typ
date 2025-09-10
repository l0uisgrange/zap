#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    isource("v1", (0, 0), (2, 0))
    isource("v1", (0, -1.5), (2, -1.5), variant: "ieee")
})

// Test decorations
#test({
    import lib: *
    isource("v1", (0, 0), (2, 0), label: $V_1$, u: $u_1$, i: $i_1$, f: $f_1$)
})

// Test styling
#test({
    import lib: *
    isource("v1", (0, 0), (2, 0), fill: red.lighten(50%), stroke: red)
})
