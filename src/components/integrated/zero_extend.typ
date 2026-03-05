#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, content, group, line, polygon, rect, scope, set-style, translate

/// Zero-Extend component for bit-width expansion with rotation support.
/// - name (string): Unique identifier.
/// - node (coordinate): Position in the CeTZ canvas.
/// - label (string): The text shown inside the component (default: "ZE").
/// *Anchors:* `in`, `out`, `nw`, `ne`, `sw`, `se`.
#let zero_extend(name, node, label: "ZE", ..params) = {
    let draw(ctx, position, style) = {
        let w = style.width
        let h = style.height

        interface((-w / 2, -h / 2), (w / 2, h / 2), io: false)
        set-style(stroke: ctx.style.stroke)

        rect((-w / 2, -h / 2), (w / 2, h / 2), fill: style.fill, name: "rect")

        content("rect", text(style.textsize, weight: "bold")[#label])

        anchor("in", (-w / 2, 0))
        anchor("out", (w / 2, 0))

        anchor("nw", (-w / 2, h / 2))
        anchor("ne", (w / 2, h / 2))
        anchor("sw", (-w / 2, -h / 2))
        anchor("se", (w / 2, -h / 2))
    }

    component("zero_extend", name, node, draw: draw, ..params)
}

/// Sign-Extend component with rotation support.
/// - name (string): Unique identifier.
/// - node (coordinate): Position in the CeTZ canvas.
#let sign_extend(name, node, ..params) = zero_extend(name, node, label: "SE", ..params)
