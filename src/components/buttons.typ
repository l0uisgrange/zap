#import "/src/component.typ": component, interface
#import "/src/components/nodes.typ": node as no
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, line, mark, rect

#let button(name, node, steady: "no", pressed: false, ..params) = {
    assert(type(pressed) == bool, message: "pressed must be of type bool")
    assert(type(steady) == str, message: "steady must be either no or nc")

    // Switch style
    let style = (
        width: .8,
        distance: .3,
        length: .2
    )

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -0.1), (style.width/2, 0.1), io: position.len() < 2)

        let altitude = if (pressed and steady == "no") or (not pressed and steady == "nc") { .04 } else { style.distance }
        if steady == "nc" { altitude *= -1 }

        line((-style.width/2, altitude), (rel: (style.width, 0)))
        line((0, altitude), (rel: (0, style.length)))
        no("d", (-style.width/2,0), fill: false)
        no("d", (style.width/2,0), fill: false)
    }

    // Componant call
    component("button", name, node, draw: draw, style: style, ..params)
}

#let ncbutton(name, node, ..params) = button(name, node, steady: "nc", ..params)
#let nobutton(name, node, ..params) = button(name, node, steady: "no", ..params)