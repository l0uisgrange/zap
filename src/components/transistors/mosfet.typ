#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import "/src/components/wire.typ": wire
#import cetz.draw: anchor, circle, content, floating, hide, line, mark, scale, set-origin, set-style, translate

#let mosfet(
    name,
    node,
    channel: "n",
    envelope: false,
    mode: "enhancement",
    bulk: "internal",
    variant: "iec",
    ..params,
) = {
    assert(type(envelope) == bool, message: "envelope must be of type bool")
    assert(mode in ("enhancement", "depletion"), message: "mode must be `enhancement` or `depletion`")
    assert(channel in ("p", "n"), message: "channel must be `p` or `n`")
    assert(bulk in ("internal", "external", none), message: "substrate must be `internal`, `external` or none")

    // Drawing function
    let draw(ctx, position, style) = {
        let (height, width, base-width, base-spacing, radius) = style
        interface((-height, -width / 2), (0, width / 2))

        if variant == "iec" {
            let center = (-height / 2, 0)

            anchor("d", (0, width / 2))
            anchor("s", (0, -width / 2))
            if bulk == "external" {
                anchor("bulk", (0, 0))
            }

            set-style(stroke: style.stroke)
            if envelope {
                circle(center, radius: radius, fill: style.fill, name: "c")
            } else {
                hide(circle((0, 0), radius: radius, fill: style.fill, name: "c"))
            }

            if mode == "enhancement" {
                let bar-length = (base-width - 2 * base-spacing) / 3
                for i in range(3) {
                    line((-height, -base-width / 2 + i * (bar-length + base-spacing)), (rel: (0, bar-length)))
                }
            } else {
                line((-height, -base-width / 2), (rel: (0, base-width)))
            }
            if bulk == "internal" {
                wire((0, 0), (0, -width / 2))
            }
            wire("d", (rel: (0, 0)), (rel: (-height, 0)))
            wire("s", (rel: (0, 0)), (rel: (-height, 0)))

            anchor("gl", (rel: (-3 * height / 4, width / 2), to: center))

            if bulk != none {
                wire((-height, 0), (rel: (height, 0)))
                mark(
                    ((-height, 0), 50%, (rel: (height, 0))),
                    (-height, 0),
                    symbol: if (channel == "n") { ">" } else { "<" },
                    fill: black,
                    anchor: "center",
                )
                wire("gl", (rel: (0, -width)), (rel: (-height / 4, 0)))
                anchor("g", ())
            } else {
                wire("gl", (rel: (0, -width / 2)), (rel: (0, -width / 2)))
                wire((rel: (0, -width / 2)), (rel: (-height / 2, 0)))
                anchor("g", ())

                mark(
                    (
                        -height / 2,
                        if (channel == "n") { -width / 2 } else { width / 2 },
                    ),
                    (rel: (height, 0)),
                    symbol: if (channel == "n") { ">" } else { "<" },
                    fill: black,
                    anchor: "center",
                )
            }
        } else if variant == "ieee" {
            let center = (-height / 2, 0)
            anchor("d_int", (0, width / 2))
            anchor("s_int", (0, -width / 2))
            anchor("d", (rel: (0, 0.3), to: "d_int"))
            anchor("s", (rel: (0, -0.3), to: "s_int"))

            set-style(stroke: style.stroke)
            if envelope {
                circle(center, radius: radius, fill: style.fill, name: "c")
            } else {
                hide(circle((0, 0), radius: radius, fill: style.fill, name: "c"))
            }

            if bulk == "internal" {
                let offset = 0.15
                line((-height, 0), (-height + offset * 1.2, 0))
                line(
                    (-height + offset, 0),
                    (0, 0),
                    mark: (start: if channel == "n" { ">" } else { "<" }, size: 0.1, fill: style.fill),
                    (0, -width / 2),
                    (0, -width / 2),
                )
            }

            if mode == "enhancement" {
                let gap = width / 4

                line("d", "d_int", (rel: (-height, 0), to: "d_int"), (rel: (0, -gap)))

                line((rel: (0, -gap / 2)), (rel: (0, gap / 2), to: (rel: (0, gap), to: (rel: (-height, 0), to: "s_int"))))

                line((rel: (0, -gap / 2)), (rel: (-height, 0), to: "s_int"), "s_int", "s")
            } else {
                line("d", "d_int", (rel: (-height, 0), to: "d_int"), (rel: (-height, 0), to: "s_int"), "s_int", "s")
            }

            anchor("gl", (rel: (-3 * height / 4, width / 2), to: center))

            wire((rel: (0, -width / 2)), (rel: (-height / 1.5, 0)), name: "gate-conn")

            anchor("g", "gate-conn.p1")

            line("gl", (rel: (0, -width), to: "gl"))

            if channel == "p" {
                circle((-height - 0.31, 0), radius: 0.13, fill: style.fill)
            }
        }
    }
    // Component call
    component("mosfet", name, node, draw: draw, ..params)
}

#let pmos(name, node, ..params) = mosfet(name, node, channel: "p", ..params)
#let nmos(name, node, ..params) = mosfet(name, node, channel: "n", ..params)
#let pmosd(name, node, ..params) = mosfet(name, node, channel: "p", mode: "depletion", ..params)
#let nmosd(name, node, ..params) = mosfet(name, node, channel: "n", mode: "depletion", ..params)

#let pmos_simple(name, node, ..params) = mosfet(name, node, channel: "p", bulk: none, mode: "depletion", variant: "ieee", ..params)

#let nmos_simple(name, node, ..params) = mosfet(name, node, channel: "n", bulk: none, mode: "depletion", variant: "ieee", ..params)
