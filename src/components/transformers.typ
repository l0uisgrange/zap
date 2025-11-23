#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, arc, circle, hide, line, mark, merge-path, rect, set-style
#import "/src/utils.typ": get-style

#let transformer(name, node, closed: false, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        interface(
            (-style.distance / 2 - style.radius, -style.radius),
            (style.distance / 2 + style.radius, style.radius),
            io: position.len() < 2,
        )

        set-style(circle: (radius: style.radius))
        merge-path(
            join: false,
            stroke: none,
            fill: style.fill,
            {
                circle((-style.distance / 2, 0))
                circle((style.distance / 2, 0))
            },
        )

        set-style(stroke: style.stroke)
        circle((-style.distance / 2, 0))
        circle((style.distance / 2, 0))
    }

    // Component call
    component("transformer", name, node, draw: draw, ..params)
}

#let air-core-transformer(name, node, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        interface(
            (-style.distance / 2 - style.radius, 3 * style.radius),
            (style.distance / 2 + style.radius, -3 * style.radius),
            io: true,
        )

        set-style(arc: (radius: style.radius, stroke: get-style(ctx).wire.stroke, fill: style.fill))

        arc(
            (-style.radius - style.distance / 2, 3 * style.radius),
            start: 90deg,
            delta: -180deg,
        )
        arc(
            (-style.radius - style.distance / 2, 1 * style.radius),
            start: 90deg,
            delta: -180deg,
        )
        arc(
            (-style.radius - style.distance / 2, -1 * style.radius),
            start: 90deg,
            delta: -180deg,
        )

        arc(
            (style.radius + style.distance / 2, 3 * style.radius),
            start: 90deg,
            delta: 180deg,
        )
        arc(
            (style.radius + style.distance / 2, 1 * style.radius),
            start: 90deg,
            delta: 180deg,
        )
        arc(
            (style.radius + style.distance / 2, -1 * style.radius),
            start: 90deg,
            delta: 180deg,
        )

        anchor("p1", (-style.distance / 2 - style.radius, 3 * style.radius))
        anchor("p2", (-style.distance / 2 - style.radius, -3 * style.radius))
        anchor("s1", (style.distance / 2 + style.radius, 3 * style.radius))
        anchor("s2", (style.distance / 2 + style.radius, -3 * style.radius))
    }

    // Component call
    component("air-core-transformer", name, node, draw: draw, ..params)
}
