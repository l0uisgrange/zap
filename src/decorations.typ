#import "/src/dependencies.typ": cetz
#import cetz.draw: bezier-through, catmull, circle, content, hobby, line, mark
#import cetz.util: merge-dictionary
#import "/src/utils.typ": get-style

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

#let resolve-decoration(ctx, dec, ..style) = {
    if type(dec) == dictionary and dec.at("content", default: none) == none { panic("Decoration dictionary needs at least the 'content' key") }

    let dec = merge-dictionary(style.named(), if type(dec) == dictionary {dec} else {(content: dec)})
    dec.size = cetz.util.measure(ctx, dec.content)
    dec.position = resolve-directions(dec.anchor)
    dec.side = if dec.position.y == "north" { 1 } else { -1 }
    dec.label-distance = dec.at("label-distance", default: (0.1 + dec.size.last()) * dec.side)

    return dec
}

#let current(ctx, label) = {
    let decor-style = get-style(ctx).decoration
    let style = resolve-decoration(ctx, label, ..decor-style.current)
    style.scale *= decor-style.scale

    let mark-position = if style.position.x == "west" {
        (("in", style.distance, "component.west"), "in")
    } else {
        (("component.east", style.distance, "out"), "out")
    }

    mark(..mark-position,
        symbol: style.variant,
        reverse: style.invert,
        anchor: "center",
        fill: style.stroke.paint,
        scale: style.scale,
    )
    content((rel: (0, style.label-distance), to: mark-position.at(0)), style.content)
}

#let flow(ctx, label) = {
    let decor-style = get-style(ctx).decoration
    let style = resolve-decoration(ctx, label, ..decor-style.flow)
    style.scale *= decor-style.scale

    let (a-start, a-end) = if style.position.x == "west" {
        let first = ("component.west", style.distance, "in")
        (first, (rel: (-.7, 0), to: first))
    } else {
        let first = ("component.east", style.distance, "out")
        (first, (rel: (.7, 0), to: first))
    }
    let a-start = (rel: (0, .2 * style.side), to: a-start)
    let a-end = (rel: (0, .2 * style.side), to: a-end)
    let (a-start, a-end) = if style.invert { (a-end, a-start) } else { (a-start, a-end) }

    line(a-start, a-end,
        mark: (end: style.variant),
        fill: style.stroke.paint,
        stroke: style.stroke,
        scale: style.scale,
    )
    content((rel: (0, style.label-distance), to: (a-start, 50%, a-end)), style.content)
}

#let voltage(ctx, label, p-rotate) = {
    let decor-style = get-style(ctx).decoration
    let style = resolve-decoration(ctx, label, ..decor-style.voltage)
    style.scale *= decor-style.scale

    let c = cetz.util.resolve-number(ctx, 9pt)
    let r-distance = cetz.util.resolve-number(ctx, style.distance)
    let a-start = (rel: (-.4, (r-distance - c + .1) * style.side), to: "component." + style.position.y + "-west")
    let a-end = (rel: (.4, (r-distance - c + .1) * style.side), to: "component." + style.position.y + "-east")
    let a-center = (rel: (0, (r-distance - c + .3) * style.side), to: "component." + style.position.y)

    let (a-start, a-end) = if style.position.x == "west" { (a-end, a-start) } else { (a-start, a-end) }
    content((rel: (0, style.label-distance), to: a-center), style.content)
    hobby(a-start, a-center, a-end,
        mark: (
            (if style.invert { "start" } else { "end" }): style.variant,
            fill: style.stroke.paint
        ),
        scale: style.scale,
        stroke: style.stroke
    )
}
