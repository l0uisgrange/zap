#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, line, polygon
#import "../mini.typ": radiation-arrows

#let ground(name, node, ..params) = {
    assert(params.pos().len() == 0, message: "ground supports only one node")

    // Ground style
    let style = (
        radius: 0.22, // TODO: replace with points units
        distance: 8pt,
    )

    // Drawing functions
    let draw(ctx, position, style) = {
        line((0, 0), (0, -style.distance), ..style.at("wires"))
        polygon((0, -style.distance), 3, anchor: "north", radius: style.radius, angle: -90deg, name: "polygon")

        let (width, height) = cetz.util.measure(ctx, "polygon")
        anchor("0", (-width / 2, -height / 2))
        anchor("1", (width / 2, height / 2))
    }

    // Componant call
    component("ground", name, node, draw: draw, style: style, ..params)
}

#let frame(name, node, ..params) = {
    assert(params.pos().len() == 0, message: "earth supports only one node")

    // Earth style
    let style = (
        width: 13pt,
        angle: 20deg,
        depth: 7pt,
        distance: 8pt,
    )

    // Drawing functions
    let draw(ctx, position, style) = {
        line((0, 0), (0, -style.distance), ..style.at("wires"))
        let delta = style.width / 2
        line((-style.width / 2, -style.distance), (style.width / 2, -style.distance))
        for i in (0, 1, 2) {
            line((-style.width / 2 + (1 - i) * .4pt + i * delta, -style.distance), (rel: (angle: -style.angle - 90deg, radius: style.depth)), ..style)
        }
        anchor("0", (-style.width / 2, style.distance))
        anchor("1", (style.width / 2, -style.distance))
    }

    // Componant call
    component("frame", name, node, draw: draw, style: style, ..params)
}

#let earth(name, node, ..params) = {
    assert(params.pos().len() == 0, message: "earth supports only one node")

    // Earth style
    let style = (
        width: 15pt,
        delta: 2.5pt,
        spacing: 3pt,
        distance: 8pt,
    )

    // Drawing functions
    let draw(ctx, position, style) = {
        line((0, 0), (0, -style.distance), ..style.at("wires"))
        for i in (0, 1, 2) {
            line(
                (-style.width / 2 + i * style.delta, -style.distance - i * style.spacing),
                (style.width / 2 - i * style.delta, -style.distance - i * style.spacing),
                ..style,
            )
        }
        anchor("0", (-style.width / 2, -style.distance - style.spacing * 2))
        anchor("1", (style.width / 2, -style.distance))
    }

    // Componant call
    component("earth", name, node, draw: draw, style: style, ..params)
}
