#import "dependencies.typ": cetz
#import "utils.typ": *
#import "styles.typ": default-style

#let component(draw: none, label: none, scale: 1.0, wires: true, rotate: 0deg, label-angle: 0deg, label-anchor: "center", label-distance: 20pt, debug: false, style: none, ..params) = {
    let (uid, name, ..position) = params.pos()
    assert(position.len() in (1, 2), message: "accepts only 2 or 3 (for 2 nodes components only) positional arguments")
    assert(position.at(1, default: none) == none or rotate == 0deg, message: "cannot use rotate argument with 2 nodes")
    assert(type(name) == str, message: "component name must be a string")
    assert(type(scale) == float, message: "scale must be a float")
    assert(type(rotate) == angle, message: "rotate must an angle")
    assert(label == none or type(label) in (content, str), message: "label must content or string")
    assert(params.at("variant", default: default-style.variant) in ("ieee", "iec", "pretty"), message: "variant must be 'iec', 'ieee' or 'pretty'")
    assert(type(wires) == bool, message: "wires must be a bool")

    let p-rotate = rotate
    let p-scale = scale
    let p-draw = draw
    let p-style = style
    import cetz.draw: *

    group(name: name, ctx => {
        let pre-style = cetz.styles.resolve(
             ctx.style,
             root: "zap",
             base: default-style
        )
        let p-rotate = p-rotate
        let (ctx, ..position) = cetz.coordinate.resolve(ctx, ..position)
        let p-origin = position.first()
        if position.len() == 2 {
            anchor("in", position.first())
            anchor("out", position.last())
            p-rotate = cetz.vector.angle2(..position)
            p-origin = (position.first(), 50%, position.last())
        }
        set-origin(p-origin)
        rotate(p-rotate)

        // Component
        on-layer(1, {
            group(name: "component", anchor: "center", {
                let style = cetz.styles.resolve(
                    pre-style,
                    merge: pre-style.at(uid),
                    base: cetz.util.merge-dictionary(params.named(), p-style),
                )
                scale(p-scale * style.at("scale", default: 1))
                draw(ctx, style)
                hide(rect("0", "1", name: "rect"))
                copy-anchors("rect")
            })
        })
        //let label-size =  cetz.util.resolve-number(ctx, cetz.util.measure(ctx, "component").at(1))

        // Wires and label
        on-layer(0, {
            if (label != none) {
                let display = if type(label) == str { $label$ } else { label }
                p-rotate = p-rotate + label-angle
                let angle = if (p-rotate >= 90deg) { -90deg + p-rotate } else { 90deg + p-rotate }
                content((rel: (angle, label-distance), to: "component.center"), display, anchor: label-anchor, padding: 6pt)
            }
        })
        if position.len() == 2 {
            line("in", "component.west", stroke: pre-style.at("wires").stroke)
            line("out", "component.east", stroke: pre-style.at("wires").stroke)
        }
        copy-anchors("component")
    })

    if (debug) {
        on-layer(1, {
            for-each-anchor(name, exclude: ("start", "end", "mid"), (name) => {
               content((), box(inset: 1pt, fill: black, text(4pt, [#name], fill: white)))
            })
        })
    }
}