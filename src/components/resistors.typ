#import "../component.typ": component
#import "../dependencies.typ": cetz
#import "../utils.typ": get-origin
#import cetz.draw: anchor, rect, line, circle, set-origin, scale as cetzscale, rotate as cetzrotate, floating, set-style, translate, scope
#import "../mini.typ": adjustable-arrow
#import "../utils.typ": quick-wires

#let resistor(uid, node, adjustable: false, movable: false, ..params) = {
    assert(type(adjustable) == bool, message: "adjustable must be of type bool")
    assert(type(movable) == bool, message: "movable must be of type bool")

    // TODO: move to package defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    let sign-stroke = 0.6pt

    // Style constants
    let width = 40pt
    let height = width / 3
    let zigs = 3

    // Drawing functions
    let draw = (
        anchors: (node2, variant, scale, rotate, wires, ..styling) => {
            if (wires and node2 != none) {
                anchor("in", node)
                anchor("out", node2)
            } else if (wires) {
                anchor("in", (-width/2 - wires-length, 0))
                anchor("out", (rel: (width + 2*wires-length, 0)))
            } else {
                anchor("in", (rel: (-width/2, 0)))
                anchor("out", (rel: (width, 0)))
            }
        },
        component: (node2, variant, scale, rotate, wires, ..styling) => {
            if (variant == "iec") {
                rect((-width / 2, -height / 2), (width / 2, height / 2), fill: white, ..styling)
            } else {
                let step = width / (zigs * 2)
                let height = height
                let sign = -1
                let x = width / 2
                line((-x, 0), (rel: (step/2, height/2)),
                    ..for _ in range(zigs * 2 - 1) {
                    ((rel: (step, height * sign)),)
                    sign *= -1 },
                    (x, 0), fill: none
                )
            }

            if (adjustable) {
                adjustable-arrow()
            } else if (movable) {
                let arrow-length = 40pt
                let arrow-distance = 20pt
                let arrow-origin = (1.3*width/2, arrow-distance)
                anchor("adjust", arrow-origin)
                line(arrow-origin, (0, arrow-distance), (0,height/2), mark: (end: ">", fill: black))
            }
        },
        wires: (node2, variant, scale, rotate, wires, ..styling) => {
            quick-wires(node, node2, "in", "out", rotate)
        }
    )

    // Componant call
    component(uid, node, draw: draw, ..params)
}

#let potentiometer(uid, node, ..params) = resistor(uid, node, adjustable: true, ..params)