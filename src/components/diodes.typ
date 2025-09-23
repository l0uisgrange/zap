#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, line, polygon, scope, translate
#import "/src/mini.typ": radiation-arrows
#import "/src/components/wires.typ": wire
#import "/src/utils.typ": get-style

#let diode(name, node, type: none, ..params) = {
    assert((type in ("emitting", "receiving", "tunnel", "zener", "schottky") or type == none), message: "type must be tunnel, zener, schottky, ...")

    // Drawing function
    let draw(ctx, position, style) = {
        translate((-style.radius / 4, 0))
        interface((-style.radius / 2, -style.radius), (style.radius, style.radius), io: position.len() < 2)

        polygon((0, 0), 3, radius: style.radius, fill: white, ..style)
        wire((0deg, style.radius), (180deg, style.radius / 2))

        // Diode specific lines - horizontal lines orthogonal to cathode
        if (type in ("tunnel", "zener", "schottky")) {
            // Calculate extension to account for cathode line thickness
            cetz.draw.merge-path(..style, {
                // Shottky specific line
                if (type == "schottky") {
                    line((style.radius + style.tunnel-length, style.width), (style.radius + style.tunnel-length, style.width - style.tunnel-length))
                }
                if (type == "tunnel") {
                    line((style.radius - style.tunnel-length, style.width), (style.radius, style.width))
                } else {
                    line((style.radius + style.tunnel-length, style.width), (style.radius, style.width))
                }

                // Main cathode line (vertical)
                line((style.radius, style.width), (style.radius, -style.width))

                // Lower line toward anode
                line((style.radius, -style.width), (style.radius - style.tunnel-length, -style.width))

                // Shottky specific line
                if (type == "schottky") {
                    line((style.radius - style.tunnel-length, -style.width), (style.radius - style.tunnel-length, -style.width + style.tunnel-length))
                }
            })
        } else {
            // Main cathode line (vertical)
            line((style.radius, style.width), (style.radius, -style.width), ..style)
        }

        if (type in ("emitting", "receiving")) {
            let reversed = (type == "receiving")
            radiation-arrows((to: (0, 0), rel: (0.25, 0.65)), reversed: reversed)
        }
    }

    // Component call
    component("diode", name, node, draw: draw, ..params)
}

#let led(name, node, ..params) = diode(name, node, type: "emitting", ..params)
#let photodiode(name, node, ..params) = diode(name, node, type: "receiving", ..params)
#let tunnel(name, node, ..params) = diode(name, node, type: "tunnel", ..params)
#let zener(name, node, ..params) = diode(name, node, type: "zener", ..params)
#let schottky(name, node, ..params) = diode(name, node, type: "schottky", ..params)
