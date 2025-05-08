#import "dependencies.typ": cetz
#import "utils.typ": *

#let component(draw: none, label: none, variant: "iec", wires: true, scale: 1.0, rotate: 0deg, label-anchor: none, debug: false, ..params) = {
    let (name, ..position) = params.pos()
    assert(position.len() in (1, 2), message: "accepts only 2 or 3 (for 2 nodes components only) positional arguments")
    assert(position.at(1, default: none) == none or rotate == 0deg, message: "cannot use rotate argument with 2 nodes")
    assert(type(name) == str, message: "component ID must be a string")
    assert(type(scale) == float, message: "scale must be a float")
    assert(type(rotate) == angle, message: "rotate must an angle")
    assert(type(label) in (content, str), message: "rotate must an angle")
    assert(variant in ("ieee", "iec", "pretty"), message: "variant must be 'iec', 'ieee' or 'pretty'")
    assert(type(wires) == bool, message: "wires must be a bool")

    let p-rotate = rotate
    let p-scale = scale
    let p-draw = draw
    import cetz.draw: *

    group(name: name, ctx => {
        let p-rotate = p-rotate
        let (ctx, ..position) = cetz.coordinate.resolve(ctx, ..position)
        let p-origin = position.first()
        if position.len() == 2 {
            p-rotate = cetz.vector.angle2(..position)
            p-origin = (position.first(), 50%, position.last())
        }
        // Component
        on-layer(1, {
            (p-draw.anchors)(position.at(1, default: none), variant, p-scale, p-rotate, wires, ..params.named())
            group(name: name+"-component", {
                set-origin(p-origin)
                rotate(p-rotate)
                scale(p-scale)
                (p-draw.component)(position.at(1, default: none), variant, p-scale, p-rotate, wires, ..params.named())
            })
        })
        // Wires
        on-layer(0, {
            if (wires) {
                (p-draw.wires)(position.at(1, default: none), variant, p-scale, p-rotate, wires, ..params.named())
            }
        })
        // Label
        on-layer(0, {
            if (label != none) {
                let label-anchor = if (
                    (p-rotate > -45deg and p-rotate < 45deg) or
                    (p-rotate > 135deg or p-rotate < -135deg)
                ) {
                    ("north", "south")
                } else {
                    ("east", "west")
                }
                let display = if (type(label) == str) { $label$ } else { label }
                content(name+"-component."+label-anchor.at(0), display, anchor: label-anchor.at(1), padding: 6pt)
            }
        })
    })

    if (debug) {
        cetz.draw.for-each-anchor(name, (name) => {
           cetz.draw.content((), box(inset: 1pt, fill: black, text(4pt, [#name], fill: white)), angle: -30deg)
        })
    }
}