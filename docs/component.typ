#set page(width: auto, height: auto)
#import "../src/lib.typ": canvas

#canvas({
    import "../src/lib.typ": *

    draw.grid((-3,-3), (3,3), stroke: .66pt + luma(90%))
    button("s1", (-3,0), (3,0))
})