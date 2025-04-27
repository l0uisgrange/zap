#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, line, circle, mark, rotate as cetzrotate

#let isource(uid, position, ..params) = {
    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    // Style constants
    let radius = 15pt
    let padding = 7pt
    let arrow-scale = 1.4

    // Drawing function
    let draw(variant, scale, rotate, wires, ..styling) = {
        cetzrotate(180deg)
        // Defining anchors
        if (wires) {
            anchor("minus", (-radius - wires-length, 0))
            anchor("plus", (rel: (2*radius + 2*wires-length, 0)))

            line("minus", (-radius, 0), stroke: wires-stroke)
            line("plus", (radius, 0), stroke: wires-stroke)
        } else {
            anchor("minus", (-radius, 0))
            anchor("plus", (rel: (2*radius, 0)))
        }

        circle((0, 0), radius: (radius, radius), ..styling)
        if (variant == "iec") {
            line((0, -radius), (rel: (0, 2*radius)), stroke: component-stroke)
        } else {
            line((-radius + padding, 0), (rel: (2*radius - 1.85*padding, 0)), mark: (end: ">"), fill: black, stroke: component-stroke)
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}

#let vsource(uid, position, ..params) = {
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

    // Drawing function
    let draw(variant, scale, rotate, wires, ..styling) = {
        cetzrotate(180deg)
        // Defining anchors
        if (wires) {
            anchor("minus", (-radius - wires-length, 0))
            anchor("plus", (rel: (2*radius + 2*wires-length, 0)))

            line("minus", (-radius, 0), stroke: wires-stroke)
            line("plus", (radius, 0), stroke: wires-stroke)
        } else {
            anchor("minus", (-radius, 0))
            anchor("plus", (rel: (2*radius, 0)))
        }

        circle((0, 0), radius: (radius, radius), ..styling)
        if (variant == "iec") {
            line((-radius, 0), (rel: (2*radius, 0)))
        } else {
            line((rel: (-radius + padding, -sign-size)), (rel:  (0, 2*sign-size)), stroke: sign-stroke)
            line((radius - padding - sign-delta, -sign-size),(rel: (0, 2*sign-size)), stroke: sign-stroke)
            line((rel: (sign-size, -sign-size)),(rel: (-2*sign-size, 0)), stroke: sign-stroke)
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}