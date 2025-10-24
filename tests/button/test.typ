#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    nobutton("b1", (0, 0), (3, 0))
    ncbutton("b2", (3, 0), (6, 0))
    ncibutton("b3", (0, -2), (3, -2))
    ncibutton("b4", (3, -2), (6, -2), head: "mushroom")
})

// Test label position
#test({
    import lib: *
    opamp("o1", (0, 0), label: "OP131")
    opamp("o2", (3, 0), variant: "ieee", label: "OP131")
})

// Test styling
#test({
    import lib: *
    opamp("o1", (0, 0), fill: red.lighten(50%), stroke: red)
    opamp("o2", (3, 0), variant: "ieee", fill: red.lighten(50%), stroke: red)
})
