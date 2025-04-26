#import "../component.typ": component
#import "../dependencies.typ": cetz

#let inductor(uid, position, ..params) = {
    // IEC style constants
    let width = 100pt
    let height = width / 3.75

    // IEEE/ANSI style constants
    let bumps = 4
    let bump-radius = width / bumps / 2

    // CeTZ Canvas
    let draw(variant, scale, rotate, ..styling) = {
        // Defining anchors
        cetz.draw.anchor("in", (rel: (-width/2, 0pt)))
        cetz.draw.anchor("out", (rel: (width, 0pt)))

        // Drawing function
        if (variant == "iec") {
            cetz.draw.rect((-width / 2, -height / 2), (width / 2, height / 2), fill: black, ..styling)
        } else {
            let start = (-width / 2 - bump-radius, 0pt)
            for i in range(bumps) {
                let arc-center-x = start.at(0) + bump-radius + i * 2 * bump-radius
                let arc-center = (arc-center-x, 0pt)
                cetz.draw.arc(arc-center, radius: bump-radius, start: 180deg, stop: 0deg)
            }
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}