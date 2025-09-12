#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    vcc("vcc", (0, 0))
    vee("vee", (1, 0))
    ground("gnd", (2, 0))
    frame("fr", (3, 0))
    earth("ea", (4, 0))
})

// Test label position
#test({
    import lib: *
    vcc("vcc", (0, 0), label: "VCC")
    vee("vee", (1, 0), label: "VEE")
})

// Test default anchor
#test({
    import lib: *
    vcc("vcc", (0, 0))
    vee("vee", (1, 0))
    ground("gnd", (2, 0))
    frame("fr", (3, 0))
    earth("ea", (4, 0))
    wire("vcc", "vee", "gnd", "fr", "ea")
})

// Test styling
#test({
    import lib: *
    vcc("v1", (0, 0), stroke: 1pt + red)
})
