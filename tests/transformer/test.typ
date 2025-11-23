#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    transformer("t1", (0, 0), (2, 0))
})

// Test styling
#test({
    import lib: *
    transformer("t1", (0, 0), (2, 0), fill: red.lighten(50%), stroke: red)
})

#test({
    import lib: *
    air-core-transformer("t1", (0, 0), (2, 0))
    wire((0, 0.6), "t1.p1")
    wire((0, -0.6), "t1.p2")
    wire((2, 0.6), "t1.s1")
    wire((2, -0.6), "t1.s2")
})
