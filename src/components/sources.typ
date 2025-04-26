#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, rect, line, circle, mark

#let isource(uid, position, ..params) = {
    // Style constants
    let radius = 25pt
    let padding = 8pt
    let arrow-scale = 1.7

    // Drawing function
    let draw(variant, scale, rotate, ..styling) = {
        // Defining anchors
        anchor("minus", (-radius, 0))
        anchor("plus", (rel: (2*radius, 0)))

        circle((0, 0), radius: (radius, radius), ..styling)
        if (variant == "iec") {
            line((0, -radius), (rel: (0, 2*radius)))
        } else {
            line((-radius + padding, 0), (rel: (2*radius - 2*padding, 0)))
            mark((rel: (0.1, 0)), (rel: (1,0)), symbol: ">", fill: black, scale: arrow-scale)
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}

#let vsource(uid, position, ..params) = {
    // Style constants
    let radius = 25pt
    let padding = 12pt
    let sign-size = 7pt
    let sign-delta = 2pt

    // Drawing function
    let draw(variant, scale, rotate, ..styling) = {
        // Defining anchors
        anchor("minus", (-radius, 0))
        anchor("plus", (rel: (2*radius, 0)))

        circle((0, 0), radius: (radius, radius), ..styling)
        if (variant == "iec") {
            line((-radius, 0), (rel: (2*radius, 0)))
        } else {
            line((rel: (-radius + padding, -sign-size)), (rel:  (0, 2*sign-size)))
            line((radius - padding - sign-delta, -sign-size),(rel: (0, 2*sign-size)))
            line((rel: (sign-size, -sign-size)),(rel: (-2*sign-size, 0)))
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}