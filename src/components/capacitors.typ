#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, line, floating
#import "../mini.typ": adjustable-arrow
#import "../utils.typ": quick-wires

#let capacitor(uid, node, adjustable: false, ..params) = {
    assert(type(adjustable) == bool, message: "adjustable must be of type bool")

    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt

    // Style constants
    let width = 22pt
    let distance = 6pt

    // Drawing functions
    let draw = (
        anchors: (position, variant, scale, rotate, wires, ..styling) => {
            if (position.len() == 2) {
                anchor("in", position.first())
                anchor("out", position.last())
            } else {
                anchor("in", (- distance/2, 0))
                anchor("out", (rel: (distance, 0)))
            }
        },
        component: (position, variant, scale, rotate, wires, ..styling) => {
            line((-distance/2, -width/2), (-distance/2, width/2), stroke: component-stroke)
            line((distance/2, -width/2), (distance/2, width/2), stroke: component-stroke)
            if (adjustable) {
                adjustable-arrow()
            }
        },
        wires: (position, variant, scale, rotate, wires, ..styling) => {
            quick-wires(rotate, ..position)
        }
    )

    // Componant call
    component(uid, node, draw: draw, ..params)
}