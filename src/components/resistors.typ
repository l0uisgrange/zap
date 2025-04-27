#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, line, circle, set-origin, rotate as cetzrotate

#let resistor(uid, position, adjustable: false, movable: false, ..params) = {
    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    let sign-stroke = 0.6pt
    // Style constants
    let width = 40pt
    let height = width / 3
    let zigs = 3

    // Drawing function
    let draw(variant, scale, rotate, wires, ..styling) = {
        if (wires) {
            anchor("in", (-width/2 - wires-length, 0))
            anchor("out", (rel: (width + 2*wires-length, 0)))

            line("in", (rel: (wires-length, 0)), stroke: wires-stroke)
            line("out", (rel: (- wires-length, 0)), stroke: wires-stroke)
        } else {
            anchor("in", (rel: (-width/2, 0)))
            anchor("out", (rel: (width, 0)))
        }

        if (variant == "iec") {
            rect((-width / 2, -height / 2), (width / 2, height / 2), ..styling)
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
            let arrow-length = 40pt
            let arrow-angle = 55deg
            let arrow-origin = (-0.5*calc.cos(arrow-angle)*arrow-length, -0.5*calc.sin(arrow-angle)*arrow-length)
            anchor("adjust", arrow-origin)

            set-origin(arrow-origin)
            cetzrotate(arrow-angle)
            line((0,0), (arrow-length,0), mark: (end: ">"), fill: black)
        } else if (movable) {
            let arrow-length = 40pt
            let arrow-distance = 20pt
            let arrow-origin = (1.3*width/2, arrow-distance)
            anchor("adjust", arrow-origin)
            line(arrow-origin, (0, arrow-distance), (0,height/2), mark: (end: ">", fill: black))
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}

#let potentiometer(uid, position, ..params) = resistor(uid, position, adjustable: true, ..params)