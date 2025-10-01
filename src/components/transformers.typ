#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, hide, line, mark, rect, set-style

#let transformer(name, node, closed: false, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.distance / 2 - style.radius, -style.radius), (style.distance / 2 + style.radius, style.radius), io: position.len() < 2)

        set-style(fill: style.fill)
        circle((-style.distance / 2, 0), radius: style.radius)
        circle((style.distance / 2, 0), radius: style.radius)

        set-style(fill: none, stroke: style.stroke)
        circle((-style.distance / 2, 0), radius: style.radius)
        circle((style.distance / 2, 0), radius: style.radius)
    }

    // Component call
    component("transformer", name, node, draw: draw, ..params)
}
