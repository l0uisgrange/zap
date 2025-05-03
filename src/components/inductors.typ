#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, arc, line

#let inductor(uid, node, ..params) = {
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

    // CeTZ Canvas
    let draw(variant, scale, rotate, wires, ..styling) = {
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

        // Drawing function
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
    }

    // Componant call
    component(uid, node, draw, ..params)
}