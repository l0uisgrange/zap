#import "/tests/utils.typ": test
#import "/src/lib.typ"
#import "/src/dependencies.typ": cetz

// Test rotation
#test({
    import lib: *
    resistor("r1", (0,0), (2,2))
    resistor("r1", (0,0), (-2,-2))
    resistor("r1", (2,0), rotate: 10deg)
})

// Test position
#test({
    import lib: *
    resistor("r1", (0,0), (2,2), position: 30%)
})

// Test nodes
#test({
    import lib: *
    resistor("r1", (0,0), (2,2), n: "*-o")
})

// Test scale
#test({
    import lib: *
    resistor("r1", (0,0), (2,2), scale: 1.5)
})

// Test anchors
#test({
    import lib: *
    resistor("r1", (0,0), (2,2))
    cetz.draw.circle("r1.out", radius: 2pt, stroke: red)
    cetz.draw.circle("r1.in", radius: 2pt, stroke: green)
})