#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, arc, line, circle, content, set-origin, group, rotate as cetzrotate, floating
#import "../mini.typ": dc-sign
#import "../utils.typ": quick-wires

#let dcmotor(uid, node, ..params) = {
    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    let sign-stroke = 0.6pt

    // IEC style constants
    let circle-radius = 15pt
    let width = 35pt
    let height = width / 4

    let io-spacing = 25pt
    let io-y = 0.49 * io-spacing

    // Drawing functions
    let draw = (
        anchors: (node2, variant, scale, rotate, wires, ..styling) => {
            if (node2 != none) {
                anchor("in", node)
                anchor("out", node2)
            } else {
                anchor("in", (io-spacing/2, -io-y))
                anchor("out", (-io-spacing/2, -io-y))
            }
        },
        component: (node2, variant, scale, rotate, wires, ..styling) => {
            if (variant == "pretty") {
                rect((-width / 2, -height / 2), (width / 2, height / 2), fill: black, ..styling)
                circle((0,0), radius: circle-radius, fill: white)
            } else {
                circle((0,0), radius: width / 2, fill: white)
                content(
                  (0,0),
                  padding: .1,
                  rotate: -rotate,
                  anchor: "south",
                  $"M"$
                )
                cetzrotate(-rotate)
                set-origin((0,-5pt))
                dc-sign()
            }
        },
        wires: (node2, variant, scale, rotate, wires, ..styling) => {
            quick-wires(node, node2, "in", "out", rotate)
        }
    )

    // Componant call
    component(uid, node, draw: draw, ..params)
}