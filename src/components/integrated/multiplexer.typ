#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, content, line, polygon, rect, scope, set-style, translate

/// Multiplexer component that selects one of n inputs.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - inputs (int): Number of data input lines (e.g., 4 for a 4-to-1 MUX).
/// *Anchors:*
/// - `in0` to `in{n-1}`: Data inputs (indexed 1 to n).
/// - `in{binary}`: Data inputs (e.g., `in00`, `in01`).
/// - `sel0` to `sel{log2(n)-1}`: Selection pins (top).
/// - `out`: Single data output (right).
#let mux(name, node, inputs: 2, ..params) = {
    assert(inputs >= 2, message: "A multiplexer needs at least 2 inputs!")
    let draw(ctx, position, style) = {
        let spacing = style.spacing
        let bit-width = int(calc.ceil(calc.log(inputs, base: 2)))

        //dynamic dimensions
        let h_total = calc.max(style.min-height, (inputs - 1) * spacing + 6 * style.padding)
        let h = h_total / 2

        let w = style.width + (bit-width * 0.1)
        let slope = h * 0.4

        interface((-w / 2, -h), (w / 2, h), io: false)
        line((-w / 2, -h), (w / 2, h), stroke: none, name: "bounds")

        set-style(stroke: ctx.style.stroke)

        // body
        line((-w / 2, h), (w / 2, h - slope), (w / 2, -h + slope), (-w / 2, -h), close: true, fill: style.fill)

        // inputs
        let spread = (inputs - 1) * spacing
        for i in range(0, inputs) {
            let y-pos = (spread / 2) - (i * spacing)
            anchor("in" + str(i), (-w / 2, y-pos))
            let bin-val = ""
            let temp-i = i
            for _ in range(bit-width) {
                bin-val = str(calc.rem(temp-i, 2)) + bin-val
                temp-i = calc.floor(temp-i / 2)
            }

            anchor("in" + bin-val, (-w / 2, y-pos))

            let bin-val = ""
            let temp-i = i
            for _ in range(bit-width) {
                bin-val = str(calc.rem(temp-i, 2)) + bin-val
                temp-i = calc.floor(temp-i / 2)
            }

            content((-w / 2 + 0.45, y-pos), text(style.textsize, weight: "bold")[#bin-val])
        }

        //sets the selectors
        for i in range(0, bit-width) {
            let x-pos = (w / 2) - (i + 1) * (w / (bit-width + 1))
            let y-pos = (-slope / w) * x-pos + (h - slope / 2)
            let s-idx = bit-width - 1 - i

            anchor("sel" + str(s-idx), (x-pos, y-pos))
            content((x-pos - 0.25, y-pos + 0.4), text(style.textsize * 0.8)[$S_#s-idx$])
        }

        anchor("out", (w / 2, 0))
    }

    component("mux", name, node, draw: draw, ..params)
}

/// Demultiplexer component that routes one input to one of n outputs.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - outputs (int): Number of data output lines.
/// *Anchors:* /// - `in`: Single data input (left).
/// - `sel0` to `sel{log2(n)-1}`: Selection pins (top).
/// - `out0` to `out{n-1}`: Data outputs (indexed 1 to n).
/// - `out{binary}`: Data outputs (e.g., `out00`, `out01`).
#let dmux(name, node, outputs: 2, ..params) = {
    assert(outputs >= 2, message: "A demultiplexer needs at least 2 outputs.")

    let draw(ctx, position, style) = {
        let spacing = style.spacing
        let bit-width = int(calc.ceil(calc.log(outputs, base: 2)))

        let h_total = calc.max(style.min-height, (outputs - 1) * spacing + 6 * style.padding)
        let h = h_total / 2
        let w = style.width + (bit-width * 0.4)
        let slope = h * 0.4

        interface((-w / 2, -h), (w / 2, h), io: false)
        line((-w / 2, -h), (w / 2, h), stroke: none, name: "bounds")

        set-style(stroke: ctx.style.stroke)

        line((-w / 2, h - slope), (w / 2, h), (w / 2, -h), (-w / 2, -h + slope), close: true, fill: style.fill)

        let spread = (outputs - 1) * spacing
        for i in range(0, outputs) {
            let y-pos = (spread / 2) - (i * spacing)
            anchor("out" + str(i), (w / 2, y-pos))

            let bin-val = ""
            let temp-i = i
            for _ in range(bit-width) {
                bin-val = str(calc.rem(temp-i, 2)) + bin-val
                temp-i = calc.floor(temp-i / 2)
            }
            anchor("out" + bin-val, (w / 2, y-pos))
            content((w / 2 - 0.4, y-pos), text(style.textsize, weight: "bold")[#bin-val])
        }

        for i in range(0, bit-width) {
            let x-pos = (w / 2) - (i + 1) * (w / (bit-width + 1))
            let y-pos = if x-pos < -w / 2 { h - slope } else { (slope / w) * x-pos + (h - slope / 2) }

            let s-idx = bit-width - 1 - i
            anchor("sel" + str(s-idx), (x-pos, y-pos))
            content((x-pos + 0.25, y-pos + 0.4), text(style.textsize * 0.8)[$S_#s-idx$])
        }

        anchor("in", (-w / 2, 0))
    }
    component("dmux", name, node, draw: draw, ..params)
}

/// 2-to-1 Multiplexer.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `in0` to `in1`, `in0` to `in1`, `sel0`, `out`.
#let mux2(name, node, ..params) = mux(name, node, inputs: 2, ..params)

/// 4-to-1 Multiplexer.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `in0` to `in3`, `in00` to `in11`, `sel0` to `sel1`, `out`.
#let mux4(name, node, ..params) = mux(name, node, inputs: 4, ..params)

/// 8-to-1 Multiplexer.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `in0` to `in7`, `in000` to `in111`, `sel0` to `sel2`, `out`.
#let mux8(name, node, ..params) = mux(name, node, inputs: 8, ..params)

/// 1-to-2 Demultiplexer.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `in`, `sel0`, `out0` to `out1`, `out0` to `out1`.
#let dmux2(name, node, ..params) = dmux(name, node, outputs: 2, ..params)

/// 1-to-4 Demultiplexer.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `in`, `sel0` to `sel1`, `out0` to `out3`, `out00` to `out11`.
#let dmux4(name, node, ..params) = dmux(name, node, outputs: 4, ..params)

/// 1-to-8 Demultiplexer.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `in`, `sel0` to `sel2`, `out0` to `out7`, `out000` to `out111`.
#let dmux8(name, node, ..params) = dmux(name, node, outputs: 8, ..params)
