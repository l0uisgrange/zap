#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    resistor("r1", (0, 0), (2, 0))
    resistor("r2", (0, -1), (2, -1), variant: "ieee")
})

// Test decorations
#test({
    import lib: *
    resistor("v1", (0, 0), (2, 0), label: $V_1$, u: $u_1$, i: $i_1$, f: $f_1$)
})

// Test styling
#test({
    import lib: *
    resistor("r1", (0, 0), (2, 0), fill: red.lighten(90%), stroke: 1pt + red)
})
