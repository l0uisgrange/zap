#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, hide, line, mark, rect
#import "/src/components/wires.typ": wire

#let switch(name, node, closed: false, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -0.2), (style.width / 2, 0.2), io: position.len() < 2)

        wire((-style.width / 2, 0), (radius: style.width / 2, angle: if closed { 0deg } else { style.angle }))
    }

    // Component call
    component("switch", name, node, draw: draw, ..params)
}
