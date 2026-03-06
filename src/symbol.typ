// SPDX-FileCopyrightText: 2026 Louis Grange and contributors
// SPDX-License-Identifier: LGPL-3.0-or-later

#import "dependencies.typ": cetz
#import "decorations.typ": current, flow, voltage
#import "symbols/node.typ": node
#import "symbols/wire.typ": wire
#import "styles.typ": default
#import "utils.typ": get-label-anchor, opposite-anchor
#import cetz.styles: merge
#import cetz.util: merge-dictionary
#import cetz.draw: anchor, circle, copy-anchors, for-each-anchor, get-ctx, group, on-layer, scope, set-origin

#let c = angle

/// Core function for creating circuit symbols. Used internally for all built-in symbols and can also be used to create custom ones.
///
/// https://zap.grangelouis.ch/#custom
///
/// - draw (func): Drawing function
/// - label (content | dict): Label content
/// - i (content | dict): Current decoration
/// - f (content | dict): Flow decoration
/// - u (content | dict): Voltage decoration
/// - n (str): Ends nodes types
/// - position (ratio): Position of the symbol
/// - scale (float): Scaling factor
/// - angle (angle): Rotation angle
/// - debug (bool): Debug mode (displays anchors)
/// -> content
#let symbol(
    uid,
    name,
    draw: none,
    label: none,
    i: none,
    f: none,
    u: none,
    n: none,
    position: 50%,
    // NOTE: `position` gets shadowed below by coordinate.resolve results
    scale: 1.0,
    angle: 0deg,
    debug: none,
    label-defaults: (:),
    ..params,
) = {
    let nodes = params.pos()
    assert(nodes.len() in (1, 2), message: "only 1 or 2 nodes are accepted")
    assert(nodes.len() == 1 or angle == 0deg, message: "cannot use rotate argument with 2 nodes")
    assert(type(name) == str, message: "identifier must be a string")
    assert(type(scale) == float or (type(scale) == dictionary), message: "scale must be a dictionary or a float")
    assert(type(angle) == c, message: "rotation must an angle")
    assert(label == none or type(label) in (content, str, dictionary), message: "label must content, dictionary or string")
    assert("variant" not in params.named() or params.named().variant in ("ieee", "iec", auto), message: "variant must be 'iec', 'ieee' or auto")
    assert(n in (none, "*-", "*-*", "-*", "o-*", "*-o", "o-", "-o", "o-o"), message: "nodes are none, *-*, o-*, o-o, o-, etc.")

    let p-ratio = position

    group(name: name, ctx => {
        let style = cetz.styles.resolve(ctx.style.zap, merge: params.named(), root: uid)
        let (ctx, ..position) = cetz.coordinate.resolve(ctx, ..nodes)
        let p-origin = position.first()
        let p-rotate = angle
        let p-position = position
        let p-scale = scale
        if position.len() == 2 {
            anchor("in", position.first())
            anchor("out", position.last())
            p-rotate = cetz.vector.angle2(..position)
            p-origin = (position.first(), p-ratio, position.last())
        }
        set-origin(p-origin)
        cetz.draw.rotate(p-rotate)

        // Symbol
        on-layer(1, {
            group(name: "symbol", {
                // Scaling
                let s = style.at("scale", default: (x: 1, y: 1))
                if type(s) == float { s = (x: s, y: s) }
                let p-scale = p-scale
                if type(p-scale) == float {
                    p-scale = (x: p-scale, y: p-scale)
                }
                cetz.draw.scale(..s)
                cetz.draw.scale(..p-scale)
                draw(ctx, position, style)
                copy-anchors("bounds")
            })
        })

        copy-anchors("symbol")

        // Label
        on-layer(0, {
            if label != none {
                let style = cetz.styles.resolve(ctx.style, root: "zap.label")
                let label-style = ctx.style.zap.label
                label-style = merge(label-style, style.at("label", default: (:)))
                label-style = merge(label-style, label-defaults)
                label-style = merge(label-style, if type(label) == dictionary { label } else { (content: label) })

                let anchor = get-label-anchor(p-rotate)
                let resolved-anchor = if type(label-style.anchor) == str and "south" in label-style.anchor { opposite-anchor(anchor) } else { anchor }
                cetz.draw.content(
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

            if i != none { current(ctx, i) }
            if f != none { flow(ctx, f) }
            if u != none { voltage(ctx, u, p-rotate) }
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
        // TODO cetz.draw.set-style(..keep-style)
    })

    // Show symbol anchors in debug mode
    get-ctx(ctx => {
        let debug = if debug == none { ctx.style.zap.debug.enabled } else { debug }
        if (debug) {
            on-layer(1, ctx => {
                let style = ctx.style.zap.debug
                for-each-anchor(name, exclude: ("start", "end", "mid", "symbol", "line", "bounds", "gl", "0", "1"), name => {
                    circle((), radius: style.radius, stroke: style.stroke)
                    cetz.draw.content((rel: (0, style.shift)), box(inset: style.inset, text(style.font, name, fill: style.fill)), angle: style.angle)
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
