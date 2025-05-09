#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, arc, line, floating
#import "../utils.typ": quick-wires

#let inductor(uid, node, variant: "iec", ..params) = {
    assert(variant in ("iec", "ieee"))

    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    let sign-stroke = 0.6pt
    // IEC style constants
    let width = 40pt
    let height = width / 3

    // IEEE/ANSI style constants
    let bumps = 3
    let bump-radius = width / bumps / 2

    // Drawing functions
    let draw = (
        anchors: (position, variant, scale, rotate, wires, ..styling) => {
            if (position.len() == 2) {
                anchor("in", position.first())
                anchor("out", position.last())
            } else {
                anchor("in", (-width/2, 0))
                anchor("out", (rel: (width, 0)))
            }
        },
        component: (position, variant, scale, rotate, wires, ..styling) => {
            if (variant == "iec") {
                rect((-width / 2, -height / 2), (width / 2, height / 2), fill: black, ..styling)
            } else {
                let start = (-width / 2 - bump-radius, 0pt)
                for i in range(bumps) {
                    let arc-center-x = start.at(0) + bump-radius + i * 2 * bump-radius
                    let arc-center = (arc-center-x, 0pt)
                    arc(arc-center, radius: bump-radius, start: 180deg, stop: 0deg)
                }
            }
        },
        wires: (position, variant, scale, rotate, wires, ..styling) => {
            quick-wires(rotate, ..position)
        }
    )

    // Componant call
    component(uid, node, draw: draw, ..params)
}