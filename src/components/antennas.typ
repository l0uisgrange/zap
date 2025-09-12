#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, line
#import "/src/mini.typ": variable-arrow

#let antenna(name, node, ..params) = {
    // Antenna style
    let style = (
        width: .8,
        distance: .25,
        delta: 0.1,
        spacing: 0.1
    )

    // Drawing function
    let draw(ctx, position, style) = {
        line((0, 0), (0, -style.distance), ..style.at("wires"))
        for i in (0, 1, 2) {
            line((-style.width / 2 + i * style.delta, -style.distance - i * style.spacing), (style.width / 2 - i * style.delta, -style.distance - i * style.spacing), ..style)
        }
        interface((-style.width / 2, style.distance + style.spacing * 2), (style.width / 2, style.distance))
        anchor("default", (0, 0))
    }

    // Component call
    component("antenna", name, node, draw: draw, style: style, ..params)
}