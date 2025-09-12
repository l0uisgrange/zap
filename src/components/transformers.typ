#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, hide, line, mark, rect

#let transformers(name, node, closed: false, ..params) = {
    // Switch style
    let style = (
        radius: 0.7,
        distance: 1
        // nothing
    )

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -0.2), (style.width / 2, 0.2), io: position.len() < 2)

        // fill here
    }

    // Component call
    component("transformer", name, node, draw: draw, style: style, ..params)
}
