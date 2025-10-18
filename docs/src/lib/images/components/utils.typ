#set page(margin: 0pt, width: auto, height: auto)
#import "/src/lib.typ": cetz
#import "/src/lib.typ" as lib

#let image(body) = {
    set page(margin: -1pt, width: auto, height: auto)

    pagebreak(weak: true)

    lib.circuit({
        import lib: *

        draw.grid(
            (-3, -3),
            (3, 3),
            stroke: .5pt + luma(90%),
        )
        body
    })
}