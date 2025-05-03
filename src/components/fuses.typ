#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, line, circle, set-origin, rotate as cetzrotate
#import "../mini.typ": adjustable-arrow

#let fuse(uid, node, node2, asymmetric: false, ..params) = {
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
    let draw(variant, scale, rotate, wires, ..styling) = {
        if (wires) {
            anchor("in", (-width/2 - wires-length, 0))
            anchor("out", (rel: (width + 2*wires-length, 0)))

            line("in", "out", stroke: wires-stroke)
        } else {
            anchor("in", (rel: (-width/2, 0)))
            anchor("out", (rel: (width, 0)))
        }

        rect((-width / 2, -height / 2), (width / 2, height / 2), ..styling)

        if (asymmetric) {
            rect((width / 2, -height / 2), (width / 2 - a-width, height / 2), fill: black, ..styling)
        }
    }

    // Componant call
    component(uid, node, node2, draw, ..params)
}

#let afuse(uid, node, node2, ..params) = fuse(uid, node, node2, asymmetric: true, ..params)