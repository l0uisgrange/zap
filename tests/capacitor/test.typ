#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    capacitor("c1", (0, 0), (2, 0))
})

// Test styling
#test({
    import lib: *
    capacitor("c1", (0, 0), (2, 0), fill: red.lighten(50%), stroke: red, distance: 1, width: 1)
})
