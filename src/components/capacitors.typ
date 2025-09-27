#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, arc, line, rect, merge-path, set-style
#import "/src/mini.typ": variable-arrow

#let capacitor(name, node, variable: false, polarized: false, ..params) = {
    assert(type(variable) == bool, message: "variable must be of type bool")

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.distance / 2, -style.width / 2), (style.distance / 2, style.width / 2), io: position.len() < 2)

        let plates() = {
            if polarized {
                arc(
                    (-style.distance / 2 - style.radius + style.radius * calc.cos(style.angle), style.radius * calc.sin(style.angle)),
                    radius: style.radius,
                    start: style.angle,
                    stop: -style.angle,
                )
            } else {
                line((-style.distance / 2, style.width / 2), (-style.distance / 2, -style.width / 2))
            }
            line((style.distance / 2, -style.width / 2), (style.distance / 2, style.width / 2))
        }

        if style.fill != none {
            merge-path(
                stroke: none,
                fill: style.fill,
                plates()
            )
        }

        set-style(stroke: style.stroke)
        plates()

        if (variable) {
            variable-arrow()
        }
    }

    // Component call
    component("capacitor", name, node, draw: draw, ..params)
}

#let pcapacitor(name, node, ..params) = capacitor(name, node, polarized: true, ..params)
