#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, line, polygon, scope, translate
#import "/src/mini.typ": radiation-arrows

#let diode(name, node, emitting: false, receiving: false, ..params) = {
    assert(type(emitting) == bool, message: "emitting must be of type bool")
    assert(type(receiving) == bool, message: "receiving must be of type bool")

    // Diode style
    let style = (
        radius: .3,
        line: .25,
    )

    // Drawing function
    let draw(ctx, position, style) = {
        translate((-style.radius / 4, 0))
        interface((-style.radius / 2, -style.radius), (style.radius, style.radius), io: position.len() < 2)

        polygon((0, 0), 3, radius: style.radius, ..style, fill: white)
        line((style.radius, -style.line), (style.radius, style.line), ..style)
        if (emitting or receiving) {
            radiation-arrows((to: (0, 0), rel: (0.4, 0.6)), angle: -135deg, reversed: receiving, length: 12pt)
        }
    }

    // Componant call
    component("diode", name, node, draw: draw, style: style, ..params)
}

#let led(name, node, ..params) = diode(name, node, emitting: true, ..params)
#let photodiode(name, node, ..params) = diode(name, node, receiving: true, ..params)
