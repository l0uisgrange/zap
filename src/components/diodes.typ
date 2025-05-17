#import "/src/component.typ": component
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
        anchor("0", (-style.radius / 2, -style.radius))
        anchor("1", (style.radius, style.radius))

        polygon((0, 0), 3, radius: style.radius, fill: white, ..style)
        line((0deg, style.radius), (180deg, style.radius / 2), ..style.at("wires"))
        line((style.radius, -style.line), (style.radius, style.line), ..style)
        if (emitting or receiving) {
            radiation-arrows((to: (0, 0), rel: (-.2, .7)), reversed: receiving)
        }
    }

    // Componant call
    component("diode", name, node, draw: draw, style: style, ..params)
}

#let led(name, node, ..params) = diode(name, node, emitting: true, ..params)
#let photodiode(name, node, ..params) = diode(name, node, receiving: true, ..params)
