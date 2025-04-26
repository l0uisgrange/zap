#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, line, circle

#let isource(uid, position, ..params) = {
    // Style constants
    let radius = 25pt

    // Drawing function
    let draw(variant, scale, rotate, ..styling) = {
        // Defining anchors
        anchor("in", (rel: (-radius, 0)))
        anchor("out", (rel: (2*radius, 0)))

        circle((0, 0), radius: (radius, radius), ..styling)
        line((rel: (0, -radius)), (rel: (0, 2*radius)))
    }

    // Componant call
    component(uid, position, draw, ..params)
}

#let vsource(uid, position, ..params) = {
    // Style constants
    let radius = 25pt

    // Drawing function
    let draw(variant, scale, rotate, ..styling) = {
        // Defining anchors
        anchor("in", (rel: (-radius, 0)))
        anchor("out", (rel: (2*radius, 0)))

        circle((0, 0), radius: (radius, radius), ..styling)
        line((rel: (-radius, 0)), (rel: (2*radius, 0)))
    }

    // Componant call
    component(uid, position, draw, ..params)
}