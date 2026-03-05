#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import "/src/mini.typ": clock-wedge
#import cetz.draw: anchor, content, line, polygon, rect, scope, set-style, translate

/// Generic Flip-Flop/Latch base component.
/// - name (string): Unique identifier.
/// - node (coordinate): Position in the CeTZ canvas.
/// - pins (dictionary): Pin configuration (content, clock wedge, etc.).
/// *Physical Anchors:*
/// -  `pin1`-`pin3` (Left)
/// - `pin4`-`pin6` (Right)
/// - `pinup` (Top)
/// - `pindown` (Bottom).
#let flipflop_top(name, node, pins: (:), rotate: 0deg, ..params) = {
    assert(params.pos().len() == 0, message: "flipflop_top supports only one node")
    assert(type(pins) == dictionary, message: "pins should be a dictionary")

    let draw(ctx, position, style) = {
        let w = style.width
        let h = style.height
        interface((-w / 2, -h / 2), (w / 2, h / 2), io: false)
        for i in range(1, 4) {
            anchor("pin" + str(i), (-w / 2, h / 2 - i * style.spacing))
        }
        for i in range(4, 7) {
            anchor("pin" + str(i), (w / 2, -h / 2 + (i - 3) * style.spacing))
        }
        anchor("pinup", (0, h / 2))
        anchor("pindown", (0, -h / 2))

        for (key, pin) in pins {
            let label = pin.at("content", default: "")
            if label == "D" { anchor("d", key) }
            if label == "Q" { anchor("q", key) }
            if label == overline("Q") or label == "Q-not" { anchor("q_n", key) }
            if label == "Reset" or label == overline("Reset") { anchor("rst", key) }
            if label == "Enable" or label == overline("Enable") { anchor("en", key) }
            if label == "CLK" or pin.at("clock", default: false) { anchor("clk", key) }
        }

        set-style(stroke: style.stroke)
        rect((-w / 2, -h / 2), (w / 2, h / 2), fill: style.at("fill", default: style.fill))

        let r-str = repr(rotate)
        let side-map = (
            "0deg": (west: "west", east: "east", north: "north", south: "south"),
            "90deg": (west: "south", east: "north", north: "west", south: "east"),
            "180deg": (west: "east", east: "west", north: "south", south: "north"),
            "270deg": (west: "north", east: "south", north: "east", south: "west"),
        ).at(r-str, default: (west: "west", east: "east", north: "north", south: "south"))

        for pin_name in pins.keys() {
            let pin = pins.at(pin_name)

            let base-side = if pin_name in ("pin1", "pin2", "pin3") { "west" } else if pin_name == "pinup" {
                "north"
            } else if (
                pin_name == "pindown"
            ) { "south" } else { "east" }
            let side = side-map.at(base-side)

            content(pin_name, pin.at("content", default: ""), anchor: side, padding: style.padding)

            if pin.at("clock", default: false) {
                let (new_side, angle) = if side == "west" { ("west", 0deg) } else if side == "east" {
                    ("west", 180deg)
                } else if side == "north" { ("west", -90deg) } else { ("west", 90deg) }

                content(pin_name, [#cetz.canvas({ clock-wedge() })], anchor: new_side, angle: angle)
            }
        }
    }

    component("flipflop_top", name, node, draw: draw, rotate: rotate, ..params)
}

/// D-Latch (Level-sensitive).
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `d` (Data), `clk` (Control), `q` (Output), `q_n` (Inverted Output).
#let dlatch_top(name, node, ..params) = flipflop_top(
    name,
    node,
    ..params,
    pins: (
        pin1: (content: "D"),
        pinup: (content: "CLK"),
        pin4: (content: overline("Q")),
        pin6: (content: "Q"),
    ),
)

/// D-Flip-Flop (Edge-triggered).
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `d` (Data), `clk` (Clock wedge), `q` (Output), `q_n` (Inverted Output).
#let dflipflop_top(name, node, ..params) = flipflop_top(
    name,
    node,
    ..params,
    pins: (
        pin1: (content: "D"),
        pinup: (clock: true),
        pin4: (content: overline("Q")),
        pin6: (content: "Q"),
    ),
)

/// D-Flip-Flop with asynchronous Reset.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `d`, `clk`, `rst` (Reset bottom), `q`, `q_n`.
#let dff_reset(name, node, ..params) = flipflop_top(
    name,
    node,
    ..params,
    pins: (
        pin1: (content: "D"),
        pinup: (clock: true),
        pindown: (content: "Reset"),
        pin4: (content: overline("Q")),
        pin6: (content: "Q"),
    ),
)

/// D-Flip-Flop with active-low Reset.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `d`, `clk`, `rst` (Reset-not bottom), `q`, `q_n`.
#let dff_reset_inv(name, node, ..params) = flipflop_top(
    name,
    node,
    ..params,
    pins: (
        pin1: (content: "D"),
        pinup: (clock: true),
        pindown: (content: overline("Reset")),
        pin4: (content: overline("Q")),
        pin6: (content: "Q"),
    ),
)

/// D-Flip-Flop with Enable signal.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `d`, `clk`, `en` (Enable bottom), `q`, `q_n`.
#let dff_enable(name, node, ..params) = flipflop_top(
    name,
    node,
    ..params,
    pins: (
        pin1: (content: "D"),
        pinup: (clock: true),
        pindown: (content: "Enable"),
        pin4: (content: overline("Q")),
        pin6: (content: "Q"),
    ),
)

/// D-Flip-Flop with active-low Enable.
/// - name (string): Unique identifier.
/// - node (coordinate): Position.
/// *Anchors:* `d`, `clk`, `en` (Enable-not bottom), `q`, `q_n`.
#let dff_enable_inv(name, node, ..params) = flipflop_top(
    name,
    node,
    ..params,
    pins: (
        pin1: (content: "D"),
        pinup: (clock: true),
        pindown: (content: overline("Enable")),
        pin4: (content: overline("Q")),
        pin6: (content: "Q"),
    ),
)
