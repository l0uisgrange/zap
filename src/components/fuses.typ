#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, line, circle, set-origin, rotate as cetzrotate, floating
#import "../mini.typ": adjustable-arrow
#import "../utils.typ": quick-wires

#let fuse(uid, node, asymmetric: false, ..params) = {
    assert(type(asymmetric) == bool, message: "asymmetric must be of type bool")

    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    let sign-stroke = 0.6pt
    // Style constants
    let width = 25pt
    let height = width / 2.4
    let zigs = 3
    let a-width = width * 0.25

    // Drawing function
    let draw = (
        anchors: (node2, variant, scale, rotate, wires, ..styling) => {
            if (wires) {
                anchor("in", (-width/2 - wires-length, 0))
                anchor("out", (rel: (width + 2*wires-length, 0)))
            } else {
                anchor("in", (rel: (-width/2, 0)))
                anchor("out", (rel: (width, 0)))
            }
        },
        component: (node2, variant, scale, rotate, wires, ..styling) => {
            rect((-width / 2, -height / 2), (width / 2, height / 2), fill: white, ..styling)
            line((-width/2, 0), (width/2, 0), stroke: wires-stroke)
            if (asymmetric) {
                rect((-width / 2, -height / 2), (-width / 2 + a-width, height / 2), fill: black, ..styling)
            }
        },
        wires: (node2, variant, scale, rotate, wires, ..styling) => {
            quick-wires(node, node2, "in", "out", rotate)
        }
    )

    // Componant call
    component(uid, node, draw: draw, ..params)
}

#let afuse(uid, node, ..params) = fuse(uid, node, asymmetric: true, ..params)