#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, arc-through, circle, content, line, rect, rotate

#let logic(name, node, text: $"&"$, invert: false, inputs: 2, ..params) = {
    assert(inputs >= 1, message: "logic supports minimum one input")

    // Drawing function
    let draw(ctx, position, style) = {
        let height = calc.max(style.min-height, (inputs - 1) * style.spacing + 2 * style.padding)
        let inner-height = height - 2 * style.padding
        interface((-style.width / 2, -height / 2), (style.width / 2, height / 2), io: false)

        rect((-style.width / 2, -height / 2), (rel: (style.width, height)), fill: style.fill, stroke: style.stroke)
        content((0, 0), text, anchor: "center")

        for input in range(1, inputs + 1) {
            let y = if inputs == 1 {
                0
            } else {
                height / 2 - style.padding - (input - 1) * inner-height / (inputs - 1)
            }
            anchor("in" + str(input), (-style.width / 2, y))
        }

        if invert {
            line((style.width / 2, style.invert-height), (rel: (style.invert-width, -style.invert-height)))
            line((style.width / 2, 0), (rel: (style.invert-width, 0)))
            anchor("out", (style.width / 2 + style.invert-width, 0))
        } else {
            anchor("out", (style.width / 2, 0))
        }
    }

    // Component call
    component("logic", name, node, draw: draw, ..params)
}

#let lnot(name, node, ..params) = logic(name, node, inputs: 1, ..params, text: $1$, invert: true)
#let land(name, node, ..params) = logic(name, node, ..params, text: $"&"$)
#let lnand(name, node, ..params) = logic(name, node, ..params, text: $"&"$, invert: true)
#let lor(name, node, ..params) = logic(name, node, ..params, text: $>=1$)
#let lnor(name, node, ..params) = logic(name, node, ..params, text: $>=1$, invert: true)
#let lxor(name, node, ..params) = logic(name, node, ..params, text: $=1$)
#let lxnor(name, node, ..params) = logic(name, node, ..params, text: $=1$, invert: true)
