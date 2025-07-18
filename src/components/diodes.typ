#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, line, polygon, scope, translate
#import "/src/mini.typ": radiation-arrows

#let diode(name, node, standard: none, ..params) = {
    assert(
        (standard in ("emitting", "receiving", "tunnel", "zener", "shottky") or standard == none),
        message: "Diode standard not correctly set"
    )

    // Diode style
    let style = (
        radius: .3,
        line: .25,
        tunnel-line-length: .1,
    )

    // Drawing function
    let draw(ctx, position, style) = {
        translate((-style.radius / 4, 0))
        interface((-style.radius / 2, -style.radius), (style.radius, style.radius), io: position.len() < 2)

        polygon((0, 0), 3, radius: style.radius, fill: white, ..style)
        line((0deg, style.radius), (180deg, style.radius / 2), ..style.at("wires"))

        // Main cathode line (vertical)
        line((style.radius, -style.line), (style.radius, style.line), ..style)

        // Diode specific lines - horizontal lines orthogonal to cathode
        if (standard in ("tunnel", "zener", "shottky")) {
            // Calculate extension to account for cathode line thickness
            let stroke-width = style.at("stroke", default: 0.8pt)
            let half-stroke = (stroke-width / 2).cm()  // Convert to float

            if (standard == "tunnel") {
                line((style.radius - style.tunnel-line-length, style.line),
                    (style.radius + half-stroke, style.line), ..style)
            } else {
                line((style.radius + style.tunnel-line-length, style.line),
                    (style.radius - half-stroke, style.line), ..style)
            }

            // lower line toward anode
            line((style.radius - style.tunnel-line-length, -style.line),
                (style.radius + half-stroke, -style.line), ..style)

            // Shottky specific lines
            if (standard == "shottky") {
                let shottky-offset = style.tunnel-line-length - half-stroke
                line((style.radius + shottky-offset, style.line),
                    (style.radius + shottky-offset, style.line - style.tunnel-line-length), ..style)
                line((style.radius - shottky-offset, -style.line),
                    (style.radius - shottky-offset, -style.line + style.tunnel-line-length), ..style)
            }
        }

        if (standard in ("emitting", "receiving")) {
            let reversed = (standard == "receiving")
            radiation-arrows((to: (0, 0), rel: (0.25, 0.65)), reversed: reversed)
        }
    }

    // Component call
    component("diode", name, node, draw: draw, style: style, ..params)
}

#let led(name, node, ..params) = diode(name, node, standard: "emitting", ..params)
#let photodiode(name, node, ..params) = diode(name, node, standard: "receiving", ..params)
#let tdiode(name, node, ..params) = diode(name, node, standard: "tunnel", ..params)
#let zdiode(name, node, ..params) = diode(name, node, standard: "zener", ..params)
#let sdiode(name, node, ..params) = diode(name, node, standard: "shottky", ..params)
