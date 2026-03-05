#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, content, line, polygon, rect, scope, set-style, translate

/// Arithmetic adder component (ALU-style) with corrected anchor positions and V-notch.
/// - name (string): Unique identifier.
/// - node (coordinate): Position in the CeTZ canvas.
/// - mode (string): "half" or "full".
/// - description (boolean): Whether to show pin labels (A, B, S, Cin, Cout).
/// *Anchors:* `a`, `b` (top), `cin` (right edge), `cout` (left edge), `s` (bottom).
#let adder(name, node, mode: "full", description: true, rotate: 0deg, ..params) = {
    let draw(ctx, position, style) = {
        let w = style.width
        let h = style.height
        let notch-x = w * 0.12
        let notch-y = h * 0.35
        let slant = w * 0.15

        interface((-w / 2, -h / 2), (w / 2, h / 2), io: false)
        set-style(stroke: ctx.style.stroke)

        cetz.draw.merge-path(fill: style.fill, close: true, {
            line((-w / 2, h / 2), (-notch-x, h / 2))
            line((-notch-x, h / 2), (0, h / 2 - notch-y))
            line((0, h / 2 - notch-y), (notch-x, h / 2))
            line((notch-x, h / 2), (w / 2, h / 2))
            line((w / 2, h / 2), (w / 2 - slant, -h / 2))
            line((w / 2 - slant, -h / 2), (-w / 2 + slant, -h / 2))
            line((-w / 2 + slant, -h / 2), (-w / 2, h / 2))
        })

        content((0, -h / 6), text(style.textsize, weight: "bold")[$+$])

        anchor("a", (-(w / 2 + notch-x) / 2, h / 2))
        anchor("b", ((w / 2 + notch-x) / 2, h / 2))
        anchor("s", (0, -h / 2))

        if mode == "full" {
            anchor("cin", (w / 2 - slant / 2, 0))
        }
        anchor("cout", (-w / 2 + slant / 2, 0))

        if description {
            let label-style = (size: style.textsize, weight: "bold")
            let t(txt) = text(..label-style, txt)

            let anchor-map = (
                "0deg": (cin: "south-west", cout: "south-east"),
                "90deg": (cin: "south-west", cout: "north-west"),
                "180deg": (cin: "south-east", cout: "south-west"),
                "270deg": (cin: "north-east", cout: "south-east"),
            )
            let r-str = repr(rotate)
            let anchors = anchor-map.at(r-str, default: anchor-map.at("0deg"))

            let label(pin-name, txt, default-anchor) = {
                content(pin-name, style.padding, txt, anchor: default-anchor)
            }
            if mode == "full" {
                content("cin", padding: style.padding, t([$C_(i n)$]), anchor: anchors.cin)
            }
            content("cout", padding: style.padding, t([$C_(o u t)$]), anchor: anchors.cout)

            content((rel: (0, -style.padding), to: "a"), t([$A$]))
            content((rel: (0, -style.padding), to: "b"), t([$B$]))
            content((rel: (style.padding, style.padding), to: "s"), t([$S$]))
        }
    }

    component("adder", name, node, draw: draw, rotate: rotate, ..params)
}

/// Half-Adder
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - description (boolean): Whether to show pin labels (A, B, S, Cin, Cout).
/// *Anchors:* `a`, `b`, `s`, `cout`.
#let half_adder(name, node, ..params) = adder(name, node, mode: "half", ..params)

/// Full-Adder
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - description (boolean): Whether to show pin labels (A, B, S, Cin, Cout).
/// *Anchors:* `a`, `b`, `cin`, `s`, `cout`.
#let full_adder(name, node, mode: "full", ..params) = adder(name, node, mode: "full", ..params)
