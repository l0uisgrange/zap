#import "dependencies.typ": cetz
#import cetz.draw: anchor, hobby, line, rotate, scope, set-origin, set-style
#import cetz.styles: merge
#import "utils.typ": get-style

#let center-mark(symbol: ">") = {
    (end: ((pos: 50%, symbol: symbol, fill: black, anchor: "center"), (pos: 0%, symbol: ">", scale: 0)))
}

#let variable-arrow(..params) = {
    scope(ctx => {
        let arrow-style = get-style(ctx).arrow
        let style = merge(arrow-style, arrow-style.variable)
        style = merge(style, params.named())
        style.scale *= arrow-style.scale

        let origin = (
            -style.ratio.at(0) * calc.cos(style.angle) * style.length,
            -style.ratio.at(1) * calc.sin(style.angle) * style.length,
        )
        anchor("adjust", origin)

        set-origin(origin)
        rotate(style.angle)
        line((0, 0), (style.length, 0),
            stroke: style.stroke,
            mark: (
                end: style.variant,
                fill: style.stroke.paint,
                scale: style.scale,
                ..arrow-style.at(style.variant, default: (:))
            ),
        )
    })
}

#let radiation-arrows(origin, ..params) = {
    scope(ctx => {
        let arrow-style = get-style(ctx).arrow
        let style = merge(arrow-style, arrow-style.radiation)
        style = merge(style, params.named())
        style.scale *= arrow-style.scale

        set-origin(origin)
        rotate(style.angle)
        set-style(
            stroke: style.stroke,
            mark: (
                scale: style.scale,
                fill: style.stroke.paint,
                ..arrow-style.at(style.variant, default: (:)),
            ),
        )

        if (style.reversed) {
            line((style.length, -style.distance), (0, -style.distance), mark: (start: style.variant))
            line((style.length, +style.distance), (0, +style.distance), mark: (start: style.variant))
        } else {
            line((style.length, -style.distance), (0, -style.distance), mark: (end: style.variant))
            line((style.length, +style.distance), (0, +style.distance), mark: (end: style.variant))
        }
    })
}

#let adjustable-arrow(node, ..params) = {
    scope(ctx => {
        let arrow-style = get-style(ctx).arrow
        let style = merge(arrow-style, arrow-style.adjustable)
        style = merge(style, params.named())
        style.scale *= arrow-style.scale

        anchor("a", (to: node, rel: (0, style.length)))
        anchor("tip", node)

        line("a", node,
            stroke: style.stroke,
            mark: (
                end: style.variant,
                fill: style.stroke.paint,
                scale: style.scale,
                ..arrow-style.at(style.variant, default: (:))
            ),
        )
    })
    anchor("tip", "tip")
    anchor("a", "a")
}

#let dc-sign() = {
    let width = 10pt
    let spacing = 1.5pt
    let vspace = 3pt
    let symbol-stroke = 0.55pt
    let tick-width = (width - 2 * spacing) / 3

    set-style(stroke: symbol-stroke)

    line((-width / 2, 0), (width / 2, 0))
    line((-width / 2, -vspace), (-width / 2 + tick-width, -vspace))
    line((-tick-width / 2, -vspace), (tick-width / 2, -vspace))
    line((width / 2, -vspace), (width / 2 - tick-width, -vspace))
}

#let ac-sign(size: 1) = {
    let width = 10pt * size
    let height = 4pt * size
    let symbol-stroke = 0.55pt

    set-style(stroke: symbol-stroke)

    hobby((-width / 2, 0), (-width / 4, height / 2), (width / 4, -height / 2), (width / 2, 0))
}
