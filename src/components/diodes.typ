#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, line, polygon, scope, translate
#import "/src/mini.typ": radiation-arrows

#let diode(name, node, emitting: false, receiving: false, tunnel: false, ..params) = {
    assert(type(emitting) == bool, message: "emitting must be of type bool")
    assert(type(receiving) == bool, message: "receiving must be of type bool")
    assert(type(tunnel) == bool, message: "tunnel must be of type bool")

    // Diode style
    let style = (
        radius: .3,
        line: .25,
        tunnel-line-length: .15,
    )

    // Drawing function
    let draw(ctx, position, style) = {
        translate((-style.radius / 4, 0))
        interface((-style.radius / 2, -style.radius), (style.radius, style.radius), io: position.len() < 2)

        polygon((0, 0), 3, radius: style.radius, fill: white, ..style)
        line((0deg, style.radius), (180deg, style.radius / 2), ..style.at("wires"))
        
        // Main cathode line (vertical)
        line((style.radius, -style.line), (style.radius, style.line), ..style)
        
        // Tunnel diode specific lines - horizontal lines orthogonal to cathode
        if (tunnel) {
            // Calculate extension to account for cathode line thickness
            let stroke-width = style.at("stroke", default: 0.8pt)
            let half-stroke = (stroke-width / 2).cm()  // Convert to float
            
            // Extension on each side
            line((style.radius - style.tunnel-line-length, style.line), 
                 (style.radius + half-stroke, style.line), ..style)
            line((style.radius - style.tunnel-line-length, -style.line), 
                 (style.radius + half-stroke, -style.line), ..style)
        }
        
        if (emitting or receiving) {
            radiation-arrows((to: (0, 0), rel: (0.25, 0.65)), reversed: receiving)
        }
    }

    // Component call
    component("diode", name, node, draw: draw, style: style, ..params)
}

#let led(name, node, ..params) = diode(name, node, emitting: true, ..params)
#let photodiode(name, node, ..params) = diode(name, node, receiving: true, ..params)
#let tunnel-diode(name, node, ..params) = diode(name, node, tunnel: true, ..params)
