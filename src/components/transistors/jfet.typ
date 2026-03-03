#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import "/src/components/wire.typ": wire
#import cetz.draw: anchor, circle, content, floating, hide, line, mark, scale, set-origin, set-style, translate

#let jfet(
    name,
    node,
    channel: "n",
    envelope: false,
    ..params,
) = {
    assert(type(envelope) == bool, message: "envelope must be of type bool")
    assert(channel in ("p", "n"), message: "channel must be `p` or `n`")
    
    // Drawing function
    let draw(ctx, position, style) = {
        let (height, width, base-width, base-spacing, radius) = style
        interface((-height, -width / 2), (0, width / 2))

        let center = (-height / 2, 0)

        anchor("d", (0, width / 2))
        anchor("s", (0, -width / 2))

        set-style(stroke: style.stroke)
        if envelope {
            circle(center, radius: radius, fill: style.fill, name: "c")
        } else {
            hide(circle((0, 0), radius: radius, fill: style.fill, name: "c"))
        }

        line((-height / 2, -base-width / 2), (rel: (0, base-width)))
        wire("d", (rel: (height / 2, 0)), (rel: (-height, 0)))
        wire("s", (rel: (height / 2, 0)), (rel: (-height, 0)))
        anchor("gl", (rel: (-height/2 , width /2), to: center))
        wire((rel: (height / 2, -width )), (rel: (-height, 0)))
        anchor("g", (rel: (-height / 2, -width)))
        mark(
            (
                -height, -width / 2
            ),
            (rel: (height, 0)),
            symbol: if (channel == "n") { ">" } else { "<" },
            fill: black,
            anchor: "center",
        )

    }

    // Component call
    component("jfet", name, node, draw: draw, ..params)
}

#let pjfet(name, node, ..params) = jfet(name, node, channel: "p", ..params)
#let njfet(name, node, ..params) = jfet(name, node, channel: "n", ..params)