#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    diode("d1", (0, 0), (2, 0))
    led("d2", (0, -1.5), (2, -1.5))
    photodiode("d3", (0, -3), (2, -3))
    tunnel("d4", (0, -4.5), (2, -4.5))
    zener("d5", (0, -6), (2, -6))
    schottky("d6", (0, -7.5), (2, -7.5))
})

// Test styling
#test({
    import lib: *
    diode("d1", (0, 0), (2, 0), fill: red.lighten(50%), stroke: red + 1.3pt)
})
