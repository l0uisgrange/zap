#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    zwire((0,0), (3,2), i: (content: $i_1$))
})

#pagebreak()

#lib.canvas({
    import lib: *

    zwire((0,0), (3,2), axis: "x", ratio: 5, i: (content: $i_1$))
})

#pagebreak()

#lib.canvas({
    import lib: *

    swire((0,0), (3,2), i: (content: $i_1$))
})

#pagebreak()

#lib.canvas({
    import lib: *

    wire((0,0), (3,2), i: (content: $i_1$))
})

#pagebreak()

#lib.canvas({
    import lib: *
    set-style(zap: (wires: (stroke: 1pt)))

    wire((0,0), (3,2), i: (content: $i_1$))
})