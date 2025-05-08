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
        anchors: (node2, variant, scale, rotate, wires, ..styling) => {
            if (wires and node2 != none) {
                anchor("in", node)
                anchor("out", node2)
            } else {
                anchor("in", (- distance/2, 0))
                anchor("out", (rel: (distance, 0)))
            }
        },
        component: (node2, variant, scale, rotate, wires, ..styling) => {
            line((-distance/2, -width/2), (-distance/2, width/2), stroke: component-stroke)
            line((distance/2, -width/2), (distance/2, width/2), stroke: component-stroke)
            if (adjustable) {
                adjustable-arrow()
            }
        },
        wires: (node2, variant, scale, rotate, wires, ..styling) => {
            quick-wires(node, node2, "plus", "minus", rotate)
        }
    )

    // Componant call
    component(uid, node, draw: draw, ..params)
}