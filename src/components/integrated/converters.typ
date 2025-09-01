#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, content, line, polygon, rect, scope, translate

#let adc(name, node, input: "a", label: none, ..params) = {
    assert(params.pos().len() == 0, message: "can supports only one node")

    // MCU style
    let style = (
        width: 1.8,
        height: 2.5,
    )


    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: true)

    }

    // Componant call
    component("converter", name, node, draw: draw, style: style, ..params, label: none)
}

#let dac(name, node, ..params) = adc(name, node, input: "d", ..params)