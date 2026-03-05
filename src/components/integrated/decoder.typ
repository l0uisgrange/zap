#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, content, line, polygon, rect, scope, set-style, translate

/// Decoder component that translates address bits to a specific number of outputs.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - outputs (int): Number of output lines (e.g., 4 for a 2-to-4 decoder).
/// *Anchors:* /// - `in0` to `in{n-1}`: Address inputs (left).
/// - `out0` to `out{n-1}`: Outputs (right, indexed 1 to n).
/// - `out{binary}`: Outputs (right, e.g., `out00`, `out01`).
#let decoder(name, node, outputs: 2, rotate: 0deg, ..params) = {
    assert(outputs >= 2, message: "A decoder needs at least 2 outputs")

    let draw(ctx, position, style) = {
        let s = style.spacing * 1.5
        let p = style.padding
        // Calculate required input bits based on number of outputs
        let bit-width = int(calc.ceil(calc.log(outputs, base: 2)))

        // Dimensions
        let h_total = (outputs - 1) * s + (4 * p)
        let h = h_total / 2
        let w = style.width + (bit-width * 0.4)

        interface((-w / 2, -h), (w / 2, h), io: false)
        line((-w / 2, -h), (w / 2, h), stroke: none, name: "bounds")

        set-style(stroke: ctx.style.stroke)
        rect((-w / 2, -h), (w / 2, h), fill: style.fill)

        // Address Inputs (A_idx)
        let in_spread = (bit-width - 1) * s
        for i in range(0, bit-width) {
            let y-pos = (in_spread / 2) - (i * s)
            let idx = bit-width - 1 - i
            anchor("in" + str(idx), (-w / 2, y-pos))
            content((-w / 2 + w * 0.1, y-pos), text(style.textsize)[$A_#idx$])
        }

        // Outputs (Binary Labeled)
        let out_spread = (outputs - 1) * s
        for i in range(0, outputs) {
            let y-pos = (out_spread / 2) - (i * s)

            // Generate binary string for label and anchor
            let bin-val = ""
            let temp-i = i
            for _ in range(bit-width) {
                bin-val = str(calc.rem(temp-i, 2)) + bin-val
                temp-i = calc.floor(temp-i / 2)
            }

            anchor("out" + str(i), (w / 2, y-pos))
            anchor("out" + bin-val, (w / 2, y-pos))

            content((w / 2 - w * 0.1, y-pos), text(style.textsize, weight: "bold")[#bin-val])
        }

        let r-str = repr(rotate)
        let label-config = (
            "0deg": (pos: (0, h), anchor: "north", offset: (0, -0.2)),
            "90deg": (pos: (0, w / 2), anchor: "west", offset: (0, 0)),
            "180deg": (pos: (0, -h), anchor: "north", offset: (0, 0.2)),
            "270deg": (pos: (0, -w / 2), anchor: "west", offset: (0, 0)),
        ).at(r-str, default: (pos: (0, h), anchor: "north", offset: (0, -0.2)))

        content(
            (rel: label-config.offset, to: label-config.pos),
            anchor: label-config.anchor,
            text(0.7em, weight: "black")[DECODER],
        )
    }

    component("decoder", name, node, draw: draw, rotate: rotate, ..params)
}

/// 1-to-2 line version of the decoder.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `in0`, `out0` to `out1`, `out0` to `out1`.
#let dec1to2(name, node, ..params) = decoder(name, node, outputs: 2, ..params)

/// 2-to-4 line version of the decoder.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `in0` to `in1`, `out0` to `out3`, `out00` to `out11`.
#let dec2to4(name, node, ..params) = decoder(name, node, outputs: 4, ..params)

/// 3-to-8 line version of the decoder.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `in0` to `in2`, `out0` to `out7`, `out000` to `out111`.
#let dec3to8(name, node, ..params) = decoder(name, node, outputs: 8, ..params)
