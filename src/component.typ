#import "dependencies.typ": cetz
#import "decorations.typ": current, flow, voltage
#import "components/nodes.typ": node
#import "components/wires.typ": wire
#import "utils.typ": get-style, get-label-anchor, opposite-anchor
#import cetz.util: merge-dictionary

#let component(
    draw: none,
    label: none,
    i: none,
    f: none,
    u: none,
    n: none,
    position: 50%,
    scale: 1.0,
    rotate: 0deg,
    debug: false,
    ..params,
) = {
    let p-position = position
    let (uid, name, ..position) = params.pos()
    if position.at(1, default: none) == none {
        position = (position.first(),)
    }
    assert(position.len() in (1, 2), message: "accepts only 2 or 3 (for 2 nodes components only) positional arguments")
    assert(position.at(1, default: none) == none or rotate == 0deg, message: "cannot use rotate argument with 2 nodes")
    assert(type(name) == str, message: "component name must be a string")
    assert(type(scale) == float or (type(scale) == array and scale.len() == 2), message: "scale must be a float or an array of two floats")
    assert(type(rotate) == angle, message: "rotate must an angle")
    assert(label == none or type(label) in (content, str, dictionary), message: "label must content, dictionary or string")
    assert("variant" not in params.named() or params.named().variant in ("ieee", "iec", "pretty"), message: "variant must be 'iec', 'ieee' or 'pretty'")
    assert(n in (none, "*-", "*-*", "-*", "o-*", "*-o", "o-", "-o", "o-o"))

    let p-rotate = rotate
    let p-scale = scale
    let p-draw = draw
    import cetz.draw: *

    group(name: name, ctx => {
        let zap-style = get-style(ctx)
        let style = zap-style.at(uid)
        
        style = merge-dictionary(style, params.named())
        style = merge-dictionary(style, style.at(style.variant, default: (:)))

        let p-rotate = p-rotate
        let (ctx, ..position) = cetz.coordinate.resolve(ctx, ..position)
        let p-origin = position.first()
        if position.len() == 2 {
            anchor("in", position.first())
            anchor("out", position.last())
            p-rotate = cetz.vector.angle2(..position)
            p-origin = (position.first(), p-position, position.last())
        }
        set-origin(p-origin)
        rotate(p-rotate)

        // Component
        on-layer(1, {
            group(name: "component", {
                //Scaling
                if (type(p-scale) == float) {
                    scale(x: p-scale * style.scale.x,
                          y: p-scale * style.scale.y)
                } else {
                    scale(x: p-scale.at(0, default: 1.0) * style.scale.x,
                          y: p-scale.at(1, default: 1.0) * style.scale.y)
                }
                draw(ctx, position, style)
                copy-anchors("bounds")
            })
        })

        copy-anchors("component")

        // Label
        on-layer(0, {
            if label != none {
                let label-style = zap-style.label
                label-style = merge-dictionary(label-style, style.at("label", default: (:)))
                label-style = merge-dictionary(label-style, params.named().at("label-defaults", default: (:)))

                let l = if type(label) == dictionary {
                    merge-dictionary(label, label-style, overwrite: false)
                } else {
                    merge-dictionary(label-style, (content: label,))
                }
                let anchor = get-label-anchor(p-rotate)
                let resolved-anchor = if type(l.anchor) == str and "south" in l.anchor { opposite-anchor(anchor) } else { anchor }
                content(
                    if type(l.anchor) == str { "component." + l.anchor } else { l.anchor },
                    anchor: l.at("align", default: resolved-anchor),
                    l.content,
                    padding: l.distance,
                )
            }
        })

        // Decorations
        if position.len() == 2 {
            wire("in", "component.west")
            wire("component.east", "out")

            if i != none {
                current(ctx, i)
            }
            if f != none {
                flow(ctx, f)
            }
            if u != none {
                voltage(ctx, u, p-rotate)
            }
            if n != none {
                if "*-" in n {
                    node("", "in")
                }
                if "-*" in n {
                    node("", "out")
                }
                if "o-" in n {
                    node("", "in", fill: false)
                }
                if "-o" in n {
                    node("", "out", fill: false)
                }
            }
        }
    })

    if (debug) {
        on-layer(1, ctx => {
            let style = ctx.zap.style.debug
            for-each-anchor(name, exclude: ("start", "end", "mid", "component", "line", "bounds", "gl", "0", "1"), name => {
                circle((), radius: style.radius, stroke: style.stroke)
                content((rel: (0, style.shift)), box(inset: style.inset, text(style.font, name, fill: style.fill)), angle: style.angle)
            })

        })
    }
}

#let interface(node1, node2, ..params, io: false) = {
    import cetz.draw: *

    hide(rect(node1, node2, name: "bounds"))
    if io {
        let (node3, node4) = (0, 0)
        if params.pos().len() == 2 {
            (node3, node4) = params.pos()
        } else {
            (node3, node4) = ("bounds.west", "bounds.east")
        }

        anchor("in", node3)
        anchor("out", node4)
    }
}
