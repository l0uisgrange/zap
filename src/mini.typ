#import "dependencies.typ": cetz
#import cetz.draw: anchor, set-origin, rotate, line

#let adjustable-arrow() = {
    let arrow-length = 40pt
    let arrow-angle = 55deg
    let arrow-origin = (-0.5*calc.cos(arrow-angle)*arrow-length, -0.5*calc.sin(arrow-angle)*arrow-length)
    anchor("adjust", arrow-origin)

    set-origin(arrow-origin)
    rotate(arrow-angle)
    line((0,0), (arrow-length,0), mark: (end: ">", fill: black))
}

#let radiation-arrows(origin, reversed: false) = {
    let arrows-distance = 3.5pt
    let arrows-length = 14pt
    let arrows-scale = 0.8

    set-origin(origin)
    rotate(-27deg)
    if (reversed) {
        line((arrows-length,-arrows-distance), (0,-arrows-distance), mark: (start: ">", scale: arrows-scale, fill: black))
        line((arrows-length,arrows-distance), (0,arrows-distance), mark: (start: ">", scale: arrows-scale, fill: black))
    } else {
        line((arrows-length,-arrows-distance), (0,-arrows-distance), mark: (end: ">", scale: arrows-scale, fill: black))
        line((arrows-length,arrows-distance), (0,arrows-distance), mark: (end: ">", scale: arrows-scale, fill: black))
    }
}