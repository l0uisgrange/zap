#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, arc, line, circle, content, set-origin, group, rotate as cetzrotate
#import "../mini.typ": dc-sign

#let dcmotor(uid, position, ..params) = {
    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    let sign-stroke = 0.6pt

    // IEC style constants
    let circle-radius = 15pt
    let width = 35pt
    let height = width / 3

    let io-spacing = 25pt
    let io-y = 0.49 * io-spacing

    // CeTZ Canvas
    let draw(variant, scale, rotate, wires, ..styling) = {
        // Drawing function
        if (variant == "pretty") {
            // Defining anchors
            if (wires) {
                anchor("in", (-width/2 - wires-length, 0))
                anchor("out", (rel: (width + 2*wires-length, 0)))

                line("in", (rel: (wires-length, 0)), stroke: wires-stroke)
                line("out", (rel: (- wires-length, 0)), stroke: wires-stroke)
            } else {
                anchor("in", (-width/2, 0))
                anchor("out", (rel: (width, 0)))
            }

            rect((-width / 2, -height / 2), (width / 2, height / 2), fill: black, ..styling)
            circle((0,0), radius: circle-radius, fill: white)
        } else if (variant == "iec") {
            // Defining anchors
            if (wires) {
                anchor("in", (- io-spacing / 2, - circle-radius - wires-length))
                anchor("out", (io-spacing / 2, - circle-radius - wires-length))

                line("in", (rel: (0, circle-radius + wires-length)), stroke: wires-stroke)
                line("out", (rel: (0, circle-radius + wires-length)), stroke: wires-stroke)
            } else {
                anchor("in", (io-spacing/2, -io-y))
                anchor("out", (-io-spacing/2, -io-y))
            }
            circle((0,0), radius: width / 2, fill: white)
            content(
              (0,0),
              padding: .1,
              rotate: -rotate,
              anchor: "south",
              "M"
            )
            cetzrotate(90deg + rotate)
            set-origin((0,-4pt))
            dc-sign((0,0))
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}