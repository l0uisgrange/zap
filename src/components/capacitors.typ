#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, line
#import "../mini.typ": adjustable-arrow

#let capacitor(uid, node, adjustable: false, ..params) = {
    assert(type(adjustable) == bool, message: "adjustable must be of type bool")

    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt

    // Style constants
    let width = 22pt
    let distance = 6pt

    // CeTZ Canvas
    let draw(variant, scale, rotate, wires, ..styling) = {
        // Defining anchors
        if (wires) {
            anchor("in", (- distance / 2 - wires-length, 0))
            anchor("out", (distance / 2 + wires-length, 0))

            line("in", (- distance/2, 0), stroke: wires-stroke)
            line("out", (distance/2, 0), stroke: wires-stroke)
        } else {
            anchor("in", (- distance/2, 0))
            anchor("out", (rel: (distance, 0)))
        }

        // Drawing function
        line((-distance/2, -width/2), (-distance/2, width/2), stroke: component-stroke)
        line((distance/2, -width/2), (distance/2, width/2), stroke: component-stroke)

        if (adjustable) {
            adjustable-arrow()
        }
    }

    // Componant call
    component(uid, node, draw, ..params)
}