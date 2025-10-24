#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, hide, line, mark, rect, hobby, merge-path
#import "/src/components/wires.typ": wire
#import "/src/mini.typ": lamp

#let button(name, node, nc: false, illuminated: false, head: "standard", latching: false, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -0.2), (style.width / 2, 0.2), io: position.len() < 2)

        let angle = 180deg - if nc { -1 } else { 1 } * style.angle
        line((style.width / 2, 0), (rel: (radius: style.width / calc.cos(style.angle), angle: angle)), stroke: style.stroke, name: "support")
        line((), (rel: (radius: style.overlap, angle: angle)), stroke: style.stroke)
        if nc {
            line((-style.width / 2, 0), (rel: (0, -style.overlap - style.width * calc.tan(style.angle))), stroke: style.stroke)
        }
        if latching {
          line("support.50%", (0, style.distance), stroke: (dash: (array: (6.5pt, 3pt))))
        } else {
          line("support.50%", (0, style.distance), stroke: (dash: (array: (6.5pt, 3pt))))
        }

        merge-path(stroke: style.stroke, close: head == "mushroom", {
          if head == "mushroom" {
            line((-style.button-width / 2, style.distance), (rel: (style.button-width, 0)))
            hobby((), (rel: (-style.button-width/2, style.button-height)), (rel: (-style.button-width/2, -style.button-height)), omega: style.button-omega, name: "top")
          } else if head == "standard" {
            line((-style.button-width / 2, style.distance - style.button-height), (rel: (0, style.button-height)), (rel: (style.button-width, 0)), (rel: (0, -style.button-height)), name: "top")
          }
        })

        if illuminated {
          line("top.50%", (rel: (0, style.lamp-distance), to: "top.50%"), stroke: style.stroke)
          lamp((rel: (0, style.button-width/2 + style.lamp-distance), to: "top.50%"), radius: style.button-width/2, stroke: style.stroke)
        }
    }

    // Component call
    component("button", name, node, draw: draw, ..params)
}

#let nobutton(name, node, ..params) = button(name, node, ..params)
#let noibutton(name, node, ..params) = button(name, node, illuminated: true, ..params)
#let ncbutton(name, node, ..params) = button(name, node, nc: true, ..params)
#let ncibutton(name, node, ..params) = button(name, node, nc: true, illuminated: true, ..params)
