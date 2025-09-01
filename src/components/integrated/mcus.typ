#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, content, line, polygon, rect, scope, translate

#let mcu(name, node, invert: false, label: none, ..params) = {
    assert(params.pos().len() == 0, message: "mcu supports only one node")

    // MCU style
    let style = (
        width: 1.8,
        height: 2.5,
        padding: .28,
        sign-stroke: .55pt,
        sign-size: .14,
        sign-delta: .45,
    )


    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: true)

        let sgn = if invert { -1 } else { 1 }

        rect((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), fill: white, ..style)
    }

    // Componant call
    component("mcu", name, node, draw: draw, style: style, ..params, label: none)
}
