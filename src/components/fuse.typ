#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import "/src/utils.typ": get-style
#import cetz.draw: anchor, circle, floating, line, rect, set-style

#let fuse(name, node, asymmetric: false, ..params) = {
    assert(type(asymmetric) == bool, message: "asymmetric must be of type bool")

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: position.len() < 2)

        let wire-thickness = get-style(ctx).wire.stroke.thickness
        rect((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), stroke: style.stroke, fill: style.fill)
        line((-style.width / 2, 0), (style.width / 2, 0), stroke: (thickness: wire-thickness))

        if (asymmetric) {
            rect((-style.width / 2, -style.height / 2), (-style.width / 2 + float(style.asymmetry * style.width), style.height / 2), stroke: none, fill: style.stroke.paint)
        }
    }

    // Component call
    component("fuse", name, node, draw: draw, ..params)
}

#let afuse(name, node, ..params) = fuse(name, node, ..params, asymmetric: true)
