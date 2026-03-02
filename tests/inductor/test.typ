#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    inductor("l1", (0, 0), (2, 0))
    inductor("l2", (0, -1), (2, -1), variant: "ieee")
})

// Test decorations
#test({
    import lib: *
    inductor("l1", (0, 0), (3, 0), label: $V_1$, u: $u_1$, i: $i_1$, f: $f_1$)
})

// Test decorations
#test({
    import lib: *
    inductor("l1", (0, 0), (2, 0), fill: red.lighten(50%), stroke: red)
})
