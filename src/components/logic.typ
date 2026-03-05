#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, arc, arc-through, bezier, circle, content, line, merge-path, rect, rotate, set-origin, set-style

#let draw_logic_iec(ctx, position, style, text, invert, inputs) = {
    // Drawing function
    let height = calc.max(style.min-height, (inputs - 1) * style.spacing + 2 * style.padding)
    interface((-style.width / 2, -height / 2), (style.width / 2, height / 2), io: false)

    rect((-style.width / 2, -height / 2), (rel: (style.width, height)), fill: style.fill, stroke: style.stroke)
    content((0, height / 2 - style.padding), text, anchor: "north")

    let total_spacing = (inputs - 1) * style.spacing
    let start_y = total_spacing / 2

    for input in range(1, inputs + 1) {
        anchor("in" + str(input), (-style.width / 2, start_y - (input - 1) * style.spacing))
    }

    if invert {
        line((style.width / 2, style.invert-height), (rel: (style.invert-width, -style.invert-height)))
        line((style.width / 2, 0), (rel: (style.invert-width, 0)))
        anchor("out", ())
    } else {
        anchor("out", (style.width / 2, 0))
    }
}

#let draw_logic_american(ctx, position, style, text, invert, inputs) = {
    let type = "buffer"

    let is-negated = invert
    let is-or-style = text in ("or", "nor", "xor", "xnor", $>=1$, $=1$)
    let is-xor-style = text in ("xor", "xnor", $=1$)
    let is-triangle = text in ("not", "buffer", $1$)

    let actual-inputs = if is-triangle { 1 } else { inputs }

    let spread = (actual-inputs - 1) * style.spacing
    let h = calc.max(style.min-height, spread + 2 * style.padding) / 2
    let w = if is-triangle { style.width * 0.8 } else { style.width }

    interface((-w / 2, -h), (w / 2, h), io: false)
    set-style(stroke: style.stroke)

    let bubble-attach-x = w / 2

    merge-path(fill: style.fill, close: true, {
        if is-triangle {
            line((-w / 2, h), (-w / 2, -h), (w / 2, 0))
        } else if is-or-style {
            bezier((-w / 2, h), (w / 2, 0), (w / 8, h), (w / 2, h / 2))
            bezier((w / 2, 0), (-w / 2, -h), (w / 2, -h / 2), (w / 8, -h))
            bezier((-w / 2, -h), (-w / 2, h), (-w / 4, -h / 2), (-w / 4, h / 2))
        } else {
            line((-w / 2, h), (0, h))
            bezier((0, h), (0, -h), (w * 0.65, h), (w * 0.65, -h))
            line((0, -h), (-w / 2, -h), (-w / 2, h))
        }
    })

    if is-xor-style {
        let x-off = 0.15
        bezier((-w / 2 - x-off, h), (-w / 2 - x-off, -h), (-w / 4 - x-off, h / 2), (-w / 4 - x-off, -h / 2))
    }

    if is-negated {
        let r = style.invert-width / 2
        circle((bubble-attach-x + r, 0), radius: r, fill: style.fill)
        anchor("out", (bubble-attach-x + style.invert-width, 0))
    } else {
        anchor("out", (bubble-attach-x, 0))
    }

    for i in range(0, actual-inputs) {
        let y-pos = (spread / 2) - (i * style.spacing)

        let x-indent = if is-or-style {
            (1 - calc.pow(y-pos / h, 2)) * 0.18
        } else { 0 }

        let input-x = if is-xor-style {
            -w / 2 - 0.15 + x-indent
        } else if is-or-style {
            -w / 2 + x-indent
        } else {
            -w / 2
        }

        anchor("in" + str(i + 1), (input-x, y-pos))
    }
}




#let logic(name, node, text: $"&"$, invert: false, inputs: 2, variant: "iec", ..params) = {
    let draw(ctx, position, style) = {
        if variant == "iec" {
            assert(inputs >= 2, message: "logic supports minimum two inputs")
            draw_logic_iec(ctx, position, style, text, invert, inputs)
        } else if variant == "american" {
            draw_logic_american(ctx, position, style, text, invert, inputs)
        } else {
            error("Unsupported logic gate variant: " + variant)
        }
    }
    component("logic", name, node, draw: draw, ..params)
}

#let lnot(name, node, ..params) = logic(name, node, ..params, text: $1$, invert: true)
#let land(name, node, ..params) = logic(name, node, ..params, text: $"&"$)
#let lnand(name, node, ..params) = logic(name, node, ..params, text: $"&"$, invert: true)
#let lor(name, node, ..params) = logic(name, node, ..params, text: $>=1$)
#let lnor(name, node, ..params) = logic(name, node, ..params, text: $>=1$, invert: true)
#let lxor(name, node, ..params) = logic(name, node, ..params, text: $=1$)
#let lxnor(name, node, ..params) = logic(name, node, ..params, text: $=1$, invert: true)

/// American NOT Gate (Inverter).
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `in1`, `out`.
#let anot(name, node, ..params) = logic(name, node, text: $1$, invert: true, variant: "american", ..params)

/// American AND Gate.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - inputs (int): Number of input pins
/// *Anchors:* `in1` to `in{n}`, `out`.
#let aand(name, node, inputs: 2, ..params) = logic(
    name,
    node,
    text: $"&"$,
    variant: "american",
    inputs: inputs,
    ..params,
)

/// American NAND Gate with inversion bubble.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - inputs (int): Number of input pins
/// *Anchors:* `in1` to `in{n}`, `out`.
#let anand(name, node, inputs: 2, ..params) = logic(
    name,
    node,
    text: $"&"$,
    invert: true,
    variant: "american",
    inputs: inputs,
    ..params,
)

/// American OR Gate with curved input and pointed output.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - inputs (int): Number of input pins
/// *Anchors:* `in1` to `in{n}`, `out`.
#let aor(name, node, inputs: 2, ..params) = logic(
    name,
    node,
    text: $>=1$,
    invert: false,
    variant: "american",
    inputs: inputs,
    ..params,
)

/// American NOR Gate.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - inputs (int): Number of input pins
/// *Anchors:* `in1` to `in{n}`, `out`.
#let anor(name, node, inputs: 2, ..params) = logic(
    name,
    node,
    text: $>=1$,
    invert: true,
    variant: "american",
    inputs: inputs,
    ..params,
)

/// American NOR Gate.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - inputs (int): Number of input pins
/// *Anchors:* `in1` to `in{n}`, `out`.
#let axor(name, node, inputs: 2, ..params) = logic(
    name,
    node,
    text: $=1$,
    invert: false,
    variant: "american",
    inputs: inputs,
    ..params,
)

/// American XNOR Gate.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - inputs (int): Number of input pins
/// *Anchors:* `in1` to `in{n}`, `out`.
#let axnor(name, node, inputs: 2, ..params) = logic(
    name,
    node,
    text: $=1$,
    invert: true,
    variant: "american",
    inputs: inputs,
    ..params,
)

/// American BUFFER Gate.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `in1`, `out`.
#let abuffer(name, node, ..params) = logic(
    name,
    node,
    text: $1$,
    invert: false,
    variant: "american",
    ..params,
)

/// American (MIL-STD) logic gate component with dynamic input scaling.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - type (string): Gate logic type ("and", "nand", "or", "nor", "xor", "xnor", "not", "buffer").
/// - inputs (int): Number of input pins (ignored for NOT and Buffer).
/// *Anchors:* /// - `in1` to `in{n}`: Input pins (left).
/// - `out`: Output pin (right).
#let alogic(name: none, node: (0, 0), text: $"&"$, inputs: 2, invert: true, ..params) = logic(
    name: name,
    node: node,
    text: text,
    invert: invert,
    variant: "american",
    inputs: inputs,
    ..params,
)
