// SPDX-FileCopyrightText: 2025-2026 Louis Grange and contributors
// SPDX-License-Identifier: LGPL-3.0-or-later

#import "dependencies.typ": cetz
#import "decorations.typ": current, flow, voltage
#import "symbols/node.typ": node
#import "symbols/wire.typ": wire
#import "utils.typ": get-label-anchor, opposite-anchor
#import cetz.styles: merge
#import cetz.util: merge-dictionary

/// Core symbol function
///
/// - draw (func): Drawing function
/// - label (content | dict): Label content
/// - i (content | dict): Current decoration
/// - f (content | dict): Flow decoration
/// - u (content | dict): Voltage decoration
/// - n (str): Ends nodes types
/// - position (ratio): Position of the symbol
/// - scale (float): Scaling factor
/// - rotate (angle): Rotation angle
/// - debug (bool): Debug mode (displays anchors)
/// -> content
#let symbol(
    draw: none,
    label: none,
    i: none,
    f: none,
    u: none,
    n: none,
    position: 50%,
    scale: 1.0,
    rotate: 0deg,
    debug: none,
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
    assert(type(scale) == float or (type(scale) == dictionary), message: "scale must be a dictionary or a float")
    assert(type(rotate) == angle, message: "rotate must an angle")
    assert(label == none or type(label) in (content, str, dictionary), message: "label must content, dictionary or string")
    assert("variant" not in params.named() or params.named().variant in ("ieee", "iec", auto), message: "variant must be 'iec', 'ieee' or auto")
    assert(n in (none, "*-", "*-*", "-*", "o-*", "*-o", "o-", "-o", "o-o"), message: "nodes are none, *-*, o-*, o-o, o-, etc.")

    let p-rotate = rotate
    let p-scale = scale
    let p-draw = draw
    import cetz.draw: *

    group(name: name, ctx => {
        let user-style = params.named()
        let label-defaults = user-style.remove("label-defaults", default: (:))



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

        // Symbol
        on-layer(1, {
            group(name: "symbol", {
                // Scaling
                let s = style.at("scale", default: (x: 1, y: 1))
                if type(s) == float {
                    s = (x: s, y: s)
                }
                let p-scale = p-scale
                if type(p-scale) == float {
                    p-scale = (x: p-scale, y: p-scale)
                }
                scale(..s)
                scale(..p-scale)
                draw(ctx, position, style)
                copy-anchors("bounds")
            })
        })

        copy-anchors("symbol")

        // Label
        on-layer(0, {
            if label != none {
                let label-style = zap-style.label
                label-style = merge(label-style, style.at("label", default: (:)))
                label-style = merge(label-style, label-defaults)
                label-style = merge(label-style, if type(label) == dictionary { label } else { (content: label) })

                let anchor = get-label-anchor(p-rotate)
                let resolved-anchor = if type(label-style.anchor) == str and "south" in label-style.anchor { opposite-anchor(anchor) } else { anchor }
                content(
                    if type(label-style.anchor) == str { "symbol." + label-style.anchor } else { label-style.anchor },
                    anchor: label-style.at("align", default: resolved-anchor),
                    label-style.content,
                    padding: label-style.distance,
                )
            }
        })

        // Symbol decorations
        if position.len() == 2 {
            wire("in", "symbol.west")
            wire("symbol.east", "out")

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
                } else if "o-" in n {
                    node("", "in", fill: false)
                }
                if "-*" in n {
                    node("", "out")
                } else if "-o" in n {
                    node("", "out", fill: false)
                }
            }
        }

        // Bringing back the current style
        cetz.draw.set-style(..keep-style)
    })

    // Show symbol anchors in debug mode
    cetz.draw.get-ctx(ctx => {
        let debug = if debug == none { get-style(ctx).debug.enabled } else { debug }
        if (debug) {
            on-layer(1, ctx => {
                let style = ctx.zap.style.debug
                for-each-anchor(name, exclude: ("start", "end", "mid", "symbol", "line", "bounds", "gl", "0", "1"), name => {
                    circle((), radius: style.radius, stroke: style.stroke)
                    content((rel: (0, style.shift)), box(inset: style.inset, text(style.font, name, fill: style.fill)), angle: style.angle)
                })
            })
        }
    })
}

// TODO: update this to more modern and resilient function (with "wirein" and "wireout" anchors)
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
