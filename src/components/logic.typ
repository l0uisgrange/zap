#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import "/src/mini.typ": ac-sign
#import cetz.draw: anchor, arc-through, circle, content, line, rect, rotate

#let logic(name, node, text: $"&"$, invert: false, inputs: 2, ..params) = {
    assert(inputs.len() >= 2, message: "logic supports minimum two inputs")

    // Drawing function
    let draw(ctx, position, style) = {
        let height = calc.max(style.min-height, inputs * style.spacing + 2 * style.padding)
        interface((-style.width / 2, -height / 2), (style.width / 2, height / 2), io: false)

        rect((-style.width / 2, -height / 2), (rel: (style.width, height)), fill: style.fill, stroke: style.stroke)
        content((0, height / 2 - style.padding), text, anchor: "north")

        for input in range(1, inputs + 1) {
            anchor("in" + str(input), (-style.width / 2, height / 2 - input * style.spacing))
        }

        if invert {
            line((style.width / 2, style.invert-height), (rel: (style.invert-width, -style.invert-height)))
            line((style.width / 2, 0), (rel: (style.invert-width, 0)))
            anchor("out", ())
        } else {
            anchor("out", (style.width / 2, 0))
        }
    }

    // Component call
    component("logic", name, node, draw: draw, ..params)
}

#let land(name, node, ..params) = logic(name, node, text: $"&"$, ..params)
#let lnand(name, node, ..params) = logic(name, node, text: $"&"$, invert: true, ..params)
#let lor(name, node, ..params) = logic(name, node, text: $>=1$, ..params)
#let lnor(name, node, ..params) = logic(name, node, text: $>=1$, invert: true, ..params)
#let lxor(name, node, ..params) = logic(name, node, text: $=1$, ..params)
#let lxnor(name, node, ..params) = logic(name, node, text: $=1$, invert: true, ..params)
