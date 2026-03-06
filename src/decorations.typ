// SPDX-FileCopyrightText: 2026 Louis Grange and contributors
// SPDX-License-Identifier: LGPL-3.0-or-later

#import "/src/dependencies.typ": cetz
#import cetz.draw: bezier-through, catmull, circle, content, hobby, line, mark
#import cetz.styles: merge

#let resolve-directions(direction) = {
    let vertical = "north"
    let horizontal = "east"
    if "south" in direction {
        vertical = "south"
    }
    if "west" in direction {
        horizontal = "west"
    }
    return (x: horizontal, y: vertical)
}

#let resolve-decoration(ctx, dec, decor-type) = {
    if type(dec) == dictionary and dec.at("content", default: none) == none { panic("Decoration dictionary needs at least the 'content' key") }

    let zap-style = ctx.style.zap
    zap-style.decoration.at(decor-type) = merge(zap-style.decoration.at(decor-type), if type(dec) == dictionary { dec } else { (content: dec) })

    let dec = zap-style.decoration.at(decor-type)

    // Resolve auto values using the parent decoration defaults
    let parent = zap-style.decoration
    for (k, v) in dec {
        if k not in parent { continue }
        let pv = parent.at(k)
        if v == auto {
            dec.insert(k, pv)
        } else if type(v) == dictionary and type(pv) == dictionary {
            for (pk, ppv) in pv {
                if pk not in v {
                    v.insert(pk, ppv)
                } else if v.at(pk) == auto {
                    v.insert(pk, ppv)
                }
            }
            dec.insert(k, v)
        }
    }

    // Ensure stroke has a paint key, resolving auto to black
    if type(dec.stroke) == dictionary {
        if "paint" not in dec.stroke {
            dec.stroke.insert("paint", black)
        } else if dec.stroke.paint == auto {
            dec.stroke.insert("paint", black)
        }
    } else if dec.stroke == auto {
        dec.insert("stroke", (thickness: .6pt, paint: black))
    }

    dec.size = cetz.util.measure(ctx, dec.content)
    dec.position = resolve-directions(dec.anchor)
    dec.side = if dec.position.y == "north" { 1 } else { -1 }
    dec.label-distance = dec.at("label-distance", default: (0.1 + dec.size.last()) * dec.side)

    return dec
}

#let current(ctx, label) = {
    let style = resolve-decoration(ctx, label, "current")
    style.scale *= ctx.style.zap.decoration.scale

    let mark-position = if style.position.x == "west" {
        (("in", style.distance, "symbol.west"), "in")
    } else {
        (("symbol.east", style.distance, "out"), "out")
    }

    mark(..mark-position, symbol: style.symbol, reverse: style.invert, anchor: "center", fill: style.stroke.paint, stroke: 0pt, scale: style.scale)
    content((rel: (0, style.label-distance), to: mark-position.at(0)), style.content)
}

#let flow(ctx, label) = {
    let style = resolve-decoration(ctx, label, "flow")
    style.scale *= ctx.style.zap.decoration.scale

    let west = style.position.x == "west"
    let a-start = (to: ("symbol." + style.position.x, style.distance, if west { "in" } else { "out" }), rel: (0, style.indent * style.side))
    let a-end = (to: a-start, rel: (style.length * if west { -1 } else { 1 }, 0))

    line(
        a-start,
        a-end,
        mark: (
            (if style.invert { "start" } else { "end" }): style.symbol,
            stroke: 0pt,
            fill: style.stroke.paint,
            scale: style.scale,
        ),
        stroke: style.stroke,
    )
    content((rel: (0, style.label-distance), to: (a-start, style.label-ratio, a-end)), style.content)
}

#let voltage(ctx, label, p-rotate) = {
    let style = resolve-decoration(ctx, label, "voltage")
    style.scale *= ctx.style.zap.decoration.scale

    let r-distance = cetz.util.resolve-number(ctx, style.distance)
    let a-start = (rel: (style.start.at(0), (r-distance + style.start.at(1)) * style.side), to: "symbol." + style.position.y + "-west")
    let a-end = (rel: (style.end.at(0), (r-distance + style.end.at(1)) * style.side), to: "symbol." + style.position.y + "-east")
    let a-center = (rel: (style.center.at(0), (r-distance + style.center.at(1)) * style.side), to: "symbol." + style.position.y)

    let (a-start, a-end) = if style.position.x == "west" { (a-end, a-start) } else { (a-start, a-end) }
    content((rel: (0, style.label-distance), to: a-center), style.content)
    hobby(
        a-start,
        a-center,
        a-end,
        mark: (
            (if style.invert { "start" } else { "end" }): style.symbol,
            stroke: 0pt,
            fill: style.stroke.paint,
            scale: style.scale,
        ),
        stroke: style.stroke,
    )
}
