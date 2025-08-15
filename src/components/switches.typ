#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, line, mark, rect, hide

#let switch(name, node, closed: false, ..params) = {
    // Switch style
    let style = (
        width: .8,
        angle: 35deg
    )

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -0.2), (style.width/2, 0.2), io: position.len() < 2)

        line((-style.width/2,0), (radius: style.width / 2, angle: if closed { 0deg } else { style.angle }), ..style.at("wires"))
    }

    // Componant call
    component("switch", name, node, draw: draw, style: style, ..params)
}

#let button(name, node, no: false, closed: false, ..params) = {
    // Switch style
    let style = (
        width: .8,
        angle: 35deg,
        overflow: .2,
        distance: 1
    )

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -0.2), (style.width/2, 0.2), io: position.len() < 2)

        //panic(repr(style))

        let y = calc.tan(style.angle) * style.width

        if not no {
            line((style.width/2, 0), (rel: (0, -y - style.overflow)), ..style.at("wires"))
        }
        line((-style.width/2,0), (style.width * calc.cos(if closed { 0deg } else { -style.angle * if no { -1 } else { 1 } })), ..style.at("wires"))

        line((0,-y/2), (0, style.distance), ..style.at("wires"), stroke: (thickness: .5pt, dash: (9pt, 3pt)))
    }

    // Componant call
    component("button", name, node, draw: draw, style: style, ..params)
}

#let nobutton(name, node, ..params) = button(name, node, no: true, ..params)
#let ncbutton(name, node, ..params) = button(name, node, ..params)