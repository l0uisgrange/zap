#set page(margin: 0pt, width: auto, height: auto)
#import "../src/lib.typ": canvas

#canvas({
    import "../src/lib.typ": *

    draw.grid((-3,-3), (3,3), stroke: .5pt + luma(90%))
    heater("s1", (-3,0), (3,0))
})