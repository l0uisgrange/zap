#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    node("n", (0, 0))
    node("n", (1, 0), fill: false)
})

// Test labelling
#test({
    import lib: *
    node("n", (0, 0), label: "A")
    node("n", (1, 0), label: (content: "B", anchor: "east"))
    node("n", (1, -1), label: (content: "C", anchor: "south"))
    node("n", (0, -1), label: (content: "D", anchor: "west"))
})

// Test styling
#test({
    import lib: *
    node("n", (0, 0), radius: .1)
})

// test last used coordinate
#test({
    import lib: *
    node("n1", (1, 0))
    node("n2", ())
})
