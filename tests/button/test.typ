#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    nobutton("b1", (0, 0), (3, 0))
    ncbutton("b2", (3, 0), (6, 0))
    ncibutton("b3", (0, -2), (3, -2))
    ncibutton("b4", (3, -2), (6, -2), head: "mushroom")
    ncibutton("b3", (0, -4), (3, -4), latching: true)
    ncibutton("b4", (3, -4), (6, -4), head: "mushroom", latching: true)
})