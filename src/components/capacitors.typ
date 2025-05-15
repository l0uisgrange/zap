#import "/src/component.typ": component
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, line
#import "/src/mini.typ": variable-arrow

#let capacitor(name, node, variable: false, ..params) = {
    assert(type(variable) == bool, message: "variable must be of type bool")

    // Capacitor style
    let style = (
        width: .7,
        distance: .23,
    )

    // Drawing function
    let draw(ctx, position, style) = {
        anchor("0", (-style.distance / 2, -style.width / 2))
        anchor("1", (style.distance / 2, style.width / 2))

        line((-style.distance / 2, -style.width / 2), (-style.distance / 2, style.width / 2), ..style)
        line((style.distance / 2, -style.width / 2), (style.distance / 2, style.width / 2), ..style)
        if (variable) {
            variable-arrow()
        }
    }

    // Componant call
    component("capacitor", name, node, draw: draw, style: style, ..params)
}
