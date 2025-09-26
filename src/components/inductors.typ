#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, arc, line, rect, rotate, translate, bezier, bezier-through, merge-path
#import "/src/mini.typ": variable-arrow

#let inductor(name, node, variable: false, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        let bump-radius = style.width / style.bumps / 2
        if (style.variant == "iec") {
            interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: position.len() < 2)
            rect((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), fill: black, ..style)
        } else if style.variant == "ieee" {
            interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: position.len() < 2)
            
            let sgn = if position.last().at(0) < position.first().at(0) { -1 } else { 1 }
            let start = (-style.width / 2 - bump-radius, 0)
            for i in range(style.bumps) {
                let arc-center-x = (
                    start.at(0) + bump-radius + i * 2 * bump-radius
                )
                let arc-center = (arc-center-x, 0)
                arc(arc-center, radius: bump-radius, start: sgn * 180deg, stop: 0deg, ..style)
            }
        } else {
            interface((-style.width / 2, -style.height / 2 + style.fall / 2), (style.width / 2, style.height / 2 - style.fall / 2))
            if position.last().at(0) < position.first().at(0) {
                rotate(180deg)
            }
            translate(x: 0., y: -style.fall)
            
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
            merge-path(..style, {
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
            variable-arrow(..style.at(style.variant, default: (:)).at("arrow", default: (:)))
        }
    }

    // Component call
    component("inductor", name, node, draw: draw, ..params)
}
