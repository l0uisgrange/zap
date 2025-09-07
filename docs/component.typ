#set page(margin: 0pt, width: auto, height: auto)
#import "../src/lib.typ": canvas

#canvas({
    import "../src/lib.typ": *

    draw.grid((-3,-3), (3,3), stroke: .5pt + luma(90%))
    mcu("s1", (0,0), pins: 7, width: 2, min-height: 2)
    wire("s1.pin1", (rel: (-0.5,0)))
    wire("s1.pin2", (rel: (-0.5,0)))
    wire("s1.pin3", (rel: (-0.5,0)))
    wire("s1.pin4", (rel: (-0.5,0)))
    wire("s1.pin5", (rel: (0.5,0)))
    wire("s1.pin6", (rel: (0.5,0)))
    wire("s1.pin7", (rel: (0.5,0)))
})