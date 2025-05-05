#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, line, circle, mark, rotate as cetzrotate, floating

#let isource(uid, node, ..params) = {
    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    // Style constants
    let radius = 15pt
    let padding = 7pt
    let arrow-scale = 1.4

    // Drawing functions
    let draw = (
        anchors: (node2, variant, scale, rotate, wires, ..styling) => {
            if (wires) {
                anchor("plus", (-radius - wires-length, 0))
                anchor("minus", (rel: (2*radius + 2*wires-length, 0)))
            } else {
                anchor("plus", (-radius, 0))
                anchor("minus", (rel: (2*radius, 0)))
            }
        },
        component: (node2, variant, scale, rotate, wires, ..styling) => {
            circle((0, 0), radius: (radius, radius), fill: white, ..styling)
            if (variant == "iec") {
                line((0, -radius), (rel: (0, 2*radius)), stroke: component-stroke)
            } else {
                line((-radius + padding, 0), (rel: (2*radius - 1.85*padding, 0)), mark: (end: ">"), fill: black, stroke: component-stroke)
            }
        },
        wires: (node2, variant, scale, rotate, wires, ..styling) => {
            if (wires) {
                if (node2 != none) {
                    floating(line(node, node2, stroke: wires-stroke))
                } else {
                    floating(line("plus", (rel: (angle: rotate, radius: 1)), stroke: wires-stroke))
                    floating(line("minus", (rel: (angle: 180deg+rotate, radius: 1)), stroke: wires-stroke))
                }
            }
        }
    )

    // Componant call
    component(uid, node, draw: draw, ..params)
}

#let vsource(uid, node, ..params) = {
    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    let sign-stroke = 0.6pt
    // Style constants
    let radius = 15pt
    let padding = 7pt
    let sign-size = 4pt
    let sign-delta = 2pt

    // Drawing functions
    let draw = (
        anchors: (node2, variant, scale, rotate, wires, ..styling) => {
            if (wires and node2 != none) {
                anchor("minus", node)
                anchor("plus", node2)
            } else if (wires) {
                anchor("minus", (-radius - wires-length, 0))
                anchor("plus", (rel: (2*radius + 2*wires-length, 0)))
            } else {
                anchor("minus", (-radius, 0))
                anchor("plus", (rel: (2*radius, 0)))
            }
        },
        component: (node2, variant, scale, rotate, wires, ..styling) => {
            circle((0, 0), radius: (radius, radius), fill: white, ..styling)
            if (variant == "iec") {
                line((-radius, 0), (rel: (2*radius, 0)))
            } else {
                line((rel: (- radius + padding, -sign-size)), (rel:  (0, 2*sign-size)), stroke: sign-stroke)
                line((radius - padding - sign-delta, -sign-size),(rel: (0, 2*sign-size)), stroke: sign-stroke)
                line((rel: (sign-size, -sign-size)),(rel: (-2*sign-size, 0)), stroke: sign-stroke)
            }
        },
        wires: (node2, variant, scale, rotate, wires, ..styling) => {
            if (wires) {
                if (node2 != none) {
                    floating(line(node, node2, stroke: wires-stroke))
                } else {
                    floating(line("minus", (rel: (angle: rotate, radius: 1)), stroke: wires-stroke))
                    floating(line("plus", (rel: (angle: 180deg+rotate, radius: 1)), stroke: wires-stroke))
                }
            }
       }
   )

    // Componant call
    component(uid, node, draw: draw, ..params)
}