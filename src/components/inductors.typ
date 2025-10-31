#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import "/src/mini.typ": variable-arrow
#import cetz.draw: anchor, arc, line, merge-path, rect, set-style, bezier

#let inductor(name, node, variable: false, ..params) = {
    assert(type(variable) == bool, message: "variable must be of type bool")
    assert(params.named().at("bumps", default: 1) > 0, message: "bumps must be greater than zero")

    // Drawing function
    let draw(ctx, position, style) = {
        style.fall = cetz.util.resolve-number(ctx, style.fall)
        interface((-style.width / 2, -style.height / 2 + style.fall / 2),
                  (style.width / 2, style.height / 2 - style.fall / 2),
                  io: position.len() < 2)

        set-style(stroke: style.stroke)
        if (style.variant == "iec") {
            rect((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), fill: style.fill)
        } else if (style.variant == "ieee") {
            cetz.draw.translate(x: 0., y: -style.fall)

            let bump-radius = style.width / style.bumps / 2
            merge-path({
                let sgn = if position.last().at(0) < position.first().at(0) { -1 } else { 1 }
                let start = (-style.width / 2 - bump-radius, 0)
                for i in range(style.bumps) {
                    let arc-center-x = (
                        start.at(0) + bump-radius + i * 2 * bump-radius
                    )
                    let arc-center = (arc-center-x, 0)
                    arc(arc-center, radius: bump-radius, start: sgn * 180deg, stop: 0deg)
                }
            })
        } else {
            cetz.draw.translate(x: 0., y: -style.fall)

            let ratio = 0.6
            let loop-bottom = style.height * 0.25
            let loop-width = style.width / (ratio * (style.bumps - 1) + 1)
            let step = loop-width * ratio
            let k1 = (0.30, 0.24)
            let k2 = (0.25, 0.65)
            let start = -style.width / 2

            let top-draw(begin) = {
                let a = (begin, 0)
                let c = (a.at(0) + loop-width, 0)
                let b = ((a.at(0) + c.at(0)) / 2, style.height / 2)
                bezier(a, b, (to: a, rel: (0, style.height * k1.at(1))), (to: b, rel: (-loop-width * k1.at(0), 0)))
                bezier(b, c, (to: b, rel: (loop-width * k1.at(0), 0)), (to: c, rel: (0, style.height * k1.at(1))))
            }
            cetz.draw.merge-path({
                for i in range(style.bumps - 1) {
                    top-draw(start + step * i)
                    let c = (start + step * i + loop-width, 0)
                    let a = (c.at(0) - loop-width * (1. - ratio), 0)
                    let b = ((a.at(0) + c.at(0)) / 2, -loop-bottom)
                    bezier(c, b, (to: c, rel: (0, -loop-bottom * k2.at(1))), (to: b, rel: (loop-width * (1. - ratio) * k2.at(0), 0)))
                    bezier(b, a, (to: b, rel: (-loop-width * (1. - ratio) * k2.at(0), 0)), (to: a, rel: (0, -loop-bottom * k2.at(1))))
                }
                top-draw(start + step * (style.bumps - 1))
            })
        }

        if variable {
            variable-arrow(..style.at("arrow", default: (:)))
        }
    }

    // Component call
    component("inductor", name, node, draw: draw, ..params)
}
