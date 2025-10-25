#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import "/src/mini.typ": ac-sign
#import cetz.draw: anchor, arc-through, circle, content, line, rect, rotate
#import "/src/utils.typ": get-style

#let logic(name, node, text: $"&"$, invert: false, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width, -style.height), (style.width, style.height), io: false)

        rect((-style.width / 2, -style.height / 2), (rel: (style.width, style.height)), fill: white, stroke: style.stroke)
        content((0, style.height / 2 - style.padding), text, anchor: "north")
        anchor("in1", (-style.width / 2, style.spacing / 2))
        anchor("in2", (-style.width / 2, -style.spacing / 2))
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
