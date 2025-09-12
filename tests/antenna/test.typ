#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    antenna("a1", (0, 0))
})

// Test default anchor
#test({
    import lib: *
    antenna("a1", (0, 0))
    wire("a1", (rel: (2, 0)))
})

// Test styling
#test({
    import lib: *
    antenna("a1", (0, 0), fill: red.lighten(50%), stroke: red)
})
