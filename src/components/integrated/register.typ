#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import "/src/mini.typ": clock-wedge
#import cetz.draw: anchor, content, line, polygon, rect, scope, translate

/// A flexible n-bit Register component with clock and reset support.
///
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// - bits (int): Number of bits (default: 2). Controls the number of S/S' pins.
/// - ..params (any): Additional style and component parameters.
///
/// *Anchors:*
/// - `clk`: Clock input (top center, marked with a triangle).
/// - `rst`: Reset input (bottom center).
/// - `s{n}_in`: Input pin for bit {n} (left side).
/// - `s{n}_out`: Output pin for bit {n} (right side).
#let register(name, node, bits: 2, rotate: 0deg, ..params) = {
    let draw(ctx, position, style) = {
        let w = style.width * 0.8
        let h = style.height * (2.0 + bits * 0.6)
        let gap = style.spacing * 3

        interface((-w / 2, -h / 2), (w / 2, h / 2))

        anchor("clk", (0, h / 2))
        anchor("rst", (0, -h / 2))

        rect((-w / 2, -h / 2), (w / 2, h / 2), fill: style.fill, stroke: style.stroke)

        let r-str = repr(rotate)
        let s-map = (
            "0deg": (west: "west", east: "east", north: "north", south: "south"),
            "90deg": (west: "south", east: "north", north: "west", south: "east"),
            "180deg": (west: "east", east: "west", north: "south", south: "north"),
            "270deg": (west: "north", east: "south", north: "east", south: "west"),
        ).at(r-str, default: (west: "west", east: "east", north: "north", south: "south"))

        let start_y = (bits - 1) * gap / 2
        for i in range(bits) {
            let idx = bits - 1 - i
            let y_pos = start_y - i * gap

            anchor("s" + str(idx) + "_in", (-w / 2, y_pos))
            anchor("s" + str(idx) + "_out", (w / 2, y_pos))

            content((-w / 2, y_pos), anchor: s-map.west, padding: style.padding, text(style.textsize * 0.9)[$S'_#idx$])
            content((w / 2, y_pos), anchor: s-map.east, padding: style.padding, text(style.textsize * 0.9)[$S_#idx$])
        }

        cetz.draw.scope({
            cetz.draw.translate((0, h / 2))
            cetz.draw.rotate(-90deg)
            clock-wedge()
        })

        content((0, h / 2), text(style.textsize * 0.7)[CLK], anchor: s-map.north, padding: style.padding * 2.5)

        content((0, -h / 2), text(style.textsize * 0.7)[RESET], anchor: s-map.south, padding: style.padding)
    }

    component("register", name, node, draw: draw, rotate: rotate, ..params)
}

/// 2-bit version of the register component.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `s0_in` to `s1_in`, `s0_out` to `s1_out`, `clk`, `rst`.
#let reg2bit(name, node, ..params) = register(name, node, bits: 2, ..params)

/// 3-bit version of the register component.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `s0_in` to `s2_in`, `s0_out` to `s2_out`, `clk`, `rst`.
#let reg3bit(name, node, ..params) = register(name, node, bits: 3, ..params)

/// 4-bit version of the register component.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `s0_in` to `s3_in`, `s0_out` to `s3_out`, `clk`, `rst`.
#let reg4bit(name, node, ..params) = register(name, node, bits: 4, ..params)

/// 5-bit version of the register component.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `s0_in` to `s4_in`, `s0_out` to `s4_out`, `clk`, `rst`.
#let reg5bit(name, node, ..params) = register(name, node, bits: 5, ..params)

/// 6-bit version of the register component.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `s0_in` to `s5_in`, `s0_out` to `s5_out`, `clk`, `rst`.
#let reg6bit(name, node, ..params) = register(name, node, bits: 6, ..params)

/// 7-bit version of the register component.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `s0_in` to `s6_in`, `s0_out` to `s6_out`, `clk`, `rst`.
#let reg7bit(name, node, ..params) = register(name, node, bits: 7, ..params)

/// 8-bit version of the register component.
/// - name (string): Unique identifier for the component.
/// - node (coordinate): Position in the CeTZ canvas.
/// *Anchors:* `s0_in` to `s7_in`, `s0_out` to `s7_out`, `clk`, `rst`.
#let reg8bit(name, node, ..params) = register(name, node, bits: 8, ..params)
