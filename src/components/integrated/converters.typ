#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, content, line, polygon, rect, scope, translate, merge-path, scale

#let adc(name, node, input: "a", ..params) = {
    assert(input in ("a", "d"), message: "input can only be d or a")

    // Converter style
    let style = (
        width: 2,
        height: 1,
        arrow-width: 0.5
    )

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: position.len() < 2)

        scope({
            scale(x: if input == "d" { -1 } else { 1 })
            merge-path(close: true, {
                line((-style.width/2, style.height/2), (style.width/2 - style.arrow-width, style.height/2), (style.width/2, 0), (style.width/2 - style.arrow-width, -style.height/2), (-style.width/2, -style.height/2), (-style.width/2, style.height/2))
            })
        })
    }

    // Component call
    component("converter", name, node, draw: draw, style: style, label-default-position: (-0.15 * if input == "d" { -1 } else { 1 },0), label-default-align: "center", ..params)
}

#let dac(name, node, ..params) = adc(name, node, input: "d", ..params)
