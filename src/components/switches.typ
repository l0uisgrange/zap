#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, line, mark, rect

#let switch(name, node, ..params) = {
    // Isource style
    let style = (
        radius: .53,
        padding: .25,
        arrow-scale: 3,
    )

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.radius, -style.radius), (style.radius, style.radius), io: position.len() < 2)


    }

    // Componant call
    component("switch", name, node, draw: draw, style: style, ..params)
}