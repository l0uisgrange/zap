#import "../component.typ": component
#import "../dependencies.typ": cetz

#let inductor(uid, position, ..params) = {
    // European style constants
    let width = 100pt
    let height = width / 3

    // American style constants
    let bumps = 3
    let bump-radius = width / bumps / 2

    // Derived style constants

    // Drawing function
    let draw(variant, scale, rotate, ..styling) = {
        if (variant == "iec") {
            cetz.draw.rect((-width / 2, -height / 2), (width / 2, height / 2), fill: black, ..styling)
        } else {
            let start = (-width / 2, 0pt)
            let bumps-start-point = (-width / 2, 0pt)
            for i in range(bumps) {
                let arc-center-x = bumps-start-point.at(0) + bump-radius + i * 2 * bump-radius
                let arc-center = (arc-center-x, 0pt)
                cetz.draw.arc(arc-center, radius: bump-radius, start: 180deg, stop: 0deg)
            }
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}