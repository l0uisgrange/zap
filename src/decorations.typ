#import "/src/dependencies.typ": cetz
#import cetz.draw: bezier-through, catmull, circle, content, hobby, line, mark

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

#let resolve-decoration(ctx, dec) = {
    if type(dec) == dictionary and dec.at("content", default: none) == none { panic("Decoration dictionary needs at least the 'content' key") }
    let result = if type(dec) == dictionary {
        (
            dec.at("content", default: none),
            dec.at("distance", default: 7pt),
            cetz.util.measure(ctx, dec.at("content")),
            dec.at("invert", default: false),
            resolve-directions(dec.at("anchor", default: "north-east")),
            dec.at("label-distance", default: 7pt),
        )
    } else {
        (dec, 7pt, cetz.util.measure(ctx, dec), false, (x: "east", y: "north"), 7pt)
    }
    return result
}

#let current(ctx, label) = {
    let (p-label, p-distance, p-size, p-invert, p-position, p-label-distance) = resolve-decoration(ctx, label)

    let side = if p-position.y == "north" { (1, ">", "<") } else { (-1, ">", "<") }
    let mark-position = if p-position.x == "east" {
        (("in", p-distance, "component.west"), "in")
    } else {
        (("component.east", p-distance, "out"), "out")
    }
    let label-distance = if p-label-distance == none {
        (.2 + p-size.last()) * side.first()
    } else {
        p-label-distance
    }

    mark(..mark-position, symbol: if p-invert { "<" } else { ">" }, anchor: "center", fill: black, scale: 0.8)
    content((rel: (0, label-distance), to: mark-position.at(0)), p-label)
}

#let flow(ctx, label) = {
    let (p-label, p-distance, p-size, p-invert, p-position, p-label-distance) = resolve-decoration(ctx, label)

    let bottom = p-position.y == "south"

    let (a-start, a-end) = if p-position.x == "west" {
        let first = ("component.west", p-distance, "in")
        (first, (rel: (-.7, 0), to: first))
    } else {
        let first = ("component.east", p-distance, "out")
        (first, (rel: (.7, 0), to: first))
    }
    let a-start = (rel: (0, if bottom { -.2 } else { .2 }), to: a-start)
    let a-end = (rel: (0, if bottom { -.2 } else { .2 }), to: a-end)
    let (a-start, a-end) = if p-invert { (a-end, a-start) } else { (a-start, a-end) }
    let label-distance = if p-label-distance == none {
        p-size.last() * if bottom { -1 } else { 1 }
    } else {
        p-label-distance
    }

    line(a-start, a-end, mark: (end: ">"), fill: black, stroke: 0.55pt, scale: 0.8)
    content((rel: (0, label-distance), to: (a-start, 50%, a-end)), p-label)
}

#let voltage(ctx, label, p-rotate) = {
    let (p-label, p-distance, p-size, p-invert, p-position, p-label-distance) = resolve-decoration(ctx, label)

    let side = if p-position.y == top { (1, "north") } else { (-1, "south") }

    let a-start = (rel: (-.4, .1 * side.first()), to: "component." + side.last() + "-west")
    let a-end = (rel: (.4, .1 * side.first()), to: "component." + side.last() + "-east")
    let a-center = (rel: (0, .3 * side.first()), to: "component." + side.last())
    let a-label = if p-label-distance == none {
        (p-size.first() / 2 * calc.abs(calc.sin(p-rotate)) + p.size.last() / 2 * calc.abs(calc.cos(p-rotate)) + cetz.util.resolve-number(ctx, 5pt * side.first()))
    } else {
        p-label-distance
    }

    content((rel: (0, a-label), to: a-center), p-label)
    if p-position.x == start {
        hobby(a-end, a-center, a-start, mark: (end: ">", fill: black), scale: 0.8, stroke: 0.55pt)
    } else {
        hobby(a-start, a-center, a-end, mark: (end: ">", fill: black), scale: 0.8, stroke: 0.55pt)
    }
}
