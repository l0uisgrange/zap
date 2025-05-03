#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, polygon, line, rotate as cetzrotate, set-origin
#import "../mini.typ": radiation-arrows

#let diode(uid, node, emitting: false, recieving: false, ..params) = {
    assert(type(emitting) == bool, message: "emitting must be of type bool")
    assert(type(recieving) == bool, message: "recieving must be of type bool")

    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    let sign-stroke = 0.6pt
    // IEC/ANSI/IEEE style constants
    let polygon-radius = 12pt
    let height = polygon-radius * calc.sin(calc.pi/4)
    // TODO: replace with polygon once cetz.polygon accepts length as radius
    let tangent = polygon-radius * calc.cos(calc.pi/4) * 0.7

    // CeTZ Canvas
    let draw(variant, scale, rotate, wires, ..styling) = {
        // Defining anchors
        if (wires) {
            anchor("in", (- tangent - wires-length, 0))
            anchor("out", (polygon-radius + wires-length, 0))

            line("in", "out", stroke: wires-stroke)
        } else {
            anchor("in", (- polygon-radius/2, 0))
            anchor("out", (rel: (polygon-radius, 0)))
        }

        // Drawing function
        // TODO: replace with polygon once cetz.polygon accepts length as radius
        // polygon((0,0), 3, radius: polygon-radius)
        line((-tangent, -height), (-tangent, height), stroke: component-stroke)
        line((-tangent, -height), (polygon-radius, 0), stroke: component-stroke)
        line((-tangent, height), (polygon-radius, 0), stroke: component-stroke)

        line((polygon-radius, -height), (polygon-radius, height), stroke: component-stroke)

        let origin = (-tangent / 2, 20pt)
        if (emitting) {
            radiation-arrows(origin)
        } else if (recieving) {
            radiation-arrows(origin, reversed: true)
        }
    }

    // Componant call
    component(uid, node, draw: draw, ..params)
}

#let led(uid, node, ..params) = diode(uid, node, emitting: true, ..params)
#let photodiode(uid, node, ..params) = diode(uid, node, recieving: true, ..params)