#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    opamp("o1", (0, 0))
    opamp("o2", (3, 0), variant: "ieee")
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