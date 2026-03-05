#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, content, line, merge-path, set-style

/// Barrel Shifter component (Parallelogram shape).
/// - name (string): Unique identifier.
/// - node (coordinate): Position in the CeTZ canvas.
/// - label (string): The shift symbol
/// *Anchors:* `in` (left), `out` (right), `shamt` (top).
#let shifter(name, node, label: ">>>", ..params) = {
    let draw(ctx, position, style) = {
        let w = style.width
        let h = style.height
        interface((-w / 2, -h / 2), (w / 2, h / 2), io: false)
        set-style(stroke: ctx.style.stroke)

        let is_left = label.contains("<")
        let slant = (w * 0.15) * (if is_left { -1 } else { 1 })

        line((-w / 2 + slant, h / 2), (w / 2 + slant, h / 2), (w / 2 - slant, -h / 2), (-w / 2 - slant, -h / 2), close: true, fill: style.fill)

        content((0, 0), text(style.textsize, weight: "bold")[#label])

        anchor("in", (-w / 2, 0))
        anchor("out", (w / 2, 0))
        anchor("shamt", (0, h / 2))

        anchor("nw", (-w / 2 + slant, h / 2))
        anchor("ne", (w / 2 + slant, h / 2))
        anchor("sw", (-w / 2 - slant, -h / 2))
        anchor("se", (w / 2 - slant, -h / 2))
    }

    component("shifter", name, node, draw: draw, ..params)
}

/// Left logical shifter
/// - name (string): Unique identifier.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `in` (left), `out` (right), `shamt` (top).
#let shiftll(name, node, ..params) = shifter(name, node, label: "<<", ..params)

/// Left arithmetical shifter
/// - name (string): Unique identifier.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `in` (left), `out` (right), `shamt` (top).
#let shiftla(name, node, ..params) = shifter(name, node, label: "<<<", ..params)

/// right logical shifter
/// - name (string): Unique identifier.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `in` (left), `out` (right), `shamt` (top).
#let shiftrl(name, node, ..params) = shifter(name, node, label: ">>", ..params)

/// right arithmetical shifter
/// - name (string): Unique identifier.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `in` (left), `out` (right), `shamt` (top).
#let shiftra(name, node, ..params) = shifter(name, node, label: ">>>", ..params)
