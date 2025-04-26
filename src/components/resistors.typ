#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, line

#let resistor(uid, position, ..params) = {
    // Style constants
    let width = 80pt
    let height = width / 3.75
    let zigs = 4

    // Drawing function
    let draw(variant, scale, rotate, ..styling) = {
        // Defining anchors
        anchor("in", (rel: (-width/2, 0)))
        anchor("out", (rel: (width, 0)))

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
    }

    // Componant call
    component(uid, position, draw, ..params)
}