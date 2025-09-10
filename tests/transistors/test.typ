#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    npn("Q1", (0, 0))
    pnp("Q2", (2, 0))
    npn("Q3", (0, -2), envelope: true)
    pnp("Q4", (2, -2), envelope: true)
})

// Test label position
#test({
    import lib: *
    npn("Q1", (0, 0), label: "NPN")
    npn("Q4", (3, 0), envelope: true, label: "NPN")
})

// Test styling
#test({
    import lib: *
    npn("Q1", (0, 0), stroke: red)
    npn("Q4", (2, 0), envelope: true, fill: red.lighten(50%), stroke: red)
})