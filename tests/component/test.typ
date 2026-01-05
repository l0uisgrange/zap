#import "/tests/utils.typ": test
#import "/src/lib.typ"
#import "/src/dependencies.typ": cetz

// Test rotation
#test({
    import lib: *
    resistor("r1", (0, 0), (2, 2))
    resistor("r1", (0, 0), (-2, -2))
    resistor("r1", (2, 0), rotate: 10deg)
})

// Test position
#test({
    import lib: *
    resistor("r1", (0, 0), (2, 2), position: 30%)
})

// Test nodes
#test({
    import lib: *
    resistor("r1", (0, 0), (2, 2), n: "*-o")
})

// Test scale
#test({
    import lib: *
    resistor("r1", (0, 0), (2, 2), scale: 1.5)
})

// Test anchors
#test({
    import lib: *
    resistor("r1", (0, 0), (2, 2))
    cetz.draw.circle("r1.out", radius: 2pt, stroke: red + 1pt, fill: none)
    cetz.draw.circle("r1.in", radius: 2pt, stroke: green + 1pt, fill: none)
})

// Test label
#test({
    import lib: *
    resistor("r1", (0, 0), (2, 2), label: (content: $R_1$, distance: 1, anchor: "south", align: "west"))
})

// Test current
#test({
    import lib: *
    resistor("r1", (0, 0), (3, 3), i: (content: $i_1$, distance: 1, label-distance: 1, invert: true))
})

// Test voltage
#test({
    import lib: *
    resistor("r1", (0, 0), (3, 3), u: (content: $u_1$, distance: 1, label-distance: -.3, invert: true, anchor: "south"))
})

// Test flow
#test({
    import lib: *
    resistor("r1", (0, 0), (3, 3), f: (content: $f_1$, distance: 1, label-distance: -1, invert: true, anchor: "south"))
})
