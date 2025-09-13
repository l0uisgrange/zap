#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    resistor("r1", (0, 0), (2, 0))
    resistor("r2", (0, -1), (2, -1), variant: "ieee")
    heater("r3", (0, -2), (2, -2))
    potentiometer("r4", (0, -3.5), (2, -3.5))
    rheostat("r5", (0, -4.5), (2, -4.5))
    potentiometer("r4", (3, 0), (3, -2))
    rheostat("r5", (3, -3), (3, -5))
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

// Test anchors
#test({
    import lib: *
    potentiometer("r4", (0, -3.5), (2, -3.5))
    wire("r4.a", (rel: (2,0)))
})