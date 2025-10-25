#set page(margin: -1pt, width: auto, height: auto)
#import "../src/lib.typ"

#lib.circuit({
    import "../src/lib.typ": *

    draw.grid(
        (0, -2),
        (6, 2),
        stroke: .5pt + luma(90%),
    )
    nobutton("b1", (0, 0), (3, 0))
    nobutton("b2", (3, 0), (6, 0), scale: (1, -1)) // mirrored one
})
