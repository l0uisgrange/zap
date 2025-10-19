#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, hide, line, mark, rect
#import "/src/components/wires.typ": wire

#let button(name, node, nc: false, illuminated: false, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -0.2), (style.width / 2, 0.2), io: position.len() < 2)

        let angle = 180deg - if nc { -1 } else { 1 } * style.angle
        line((style.width / 2, 0), (rel: (radius: style.width / calc.cos(style.angle), angle: angle)), stroke: style.stroke, name: "support")
        line((), (rel: (radius: style.overlap, angle: angle)), stroke: style.stroke)
        if nc {
            line((-style.width / 2, 0), (rel: (0, -style.overlap - style.width * calc.tan(style.angle))), stroke: style.stroke)
        }
        line("support.50%", (0, style.distance), stroke: (dash: (array: (6.5pt, 3pt))))

        let width = .25
        let height = .15
        line((-width / 2, style.distance - height), (rel: (0, height)), (rel: (width, 0)), (rel: (0, -height)))
    }

    // Component call
    component("button", name, node, draw: draw, ..params)
}

#let nobutton(name, node, ..params) = button(name, node, ..params)
#let noibutton(name, node, ..params) = button(name, node, illuminated: true, ..params)
#let ncbutton(name, node, ..params) = button(name, node, nc: true, ..params)
#let ncibutton(name, node, ..params) = button(name, node, nc: true, illuminated: true, ..params)