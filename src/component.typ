#import "dependencies.typ": cetz
#import cetz.draw: group, translate
#import "utils.typ": *

#let component(uid, node, draw: none, label: none, variant: "iec", wires: true, scale: 1.0, rotate: 0deg, label-anchor: none, debug: false, ..params) = {
    let node2 = params.pos().at(0, default: none)
    assert(params.pos().len() < 2, message: "accepts only 2 or 3 (for 2 nodes components only) positional arguments")
    assert(node2 == none or rotate == 0deg, message: "cannot use rotate argument with 2 nodes")
    assert(type(uid) == str, message: "component ID must be a string")
    assert(type(scale) == float, message: "scale must be a float")
    assert(type(rotate) == angle, message: "rotate must an angle")
    assert(variant in ("ieee", "iec", "pretty"), message: "variant must be 'iec', 'ieee' or 'pretty'")
    assert(type(wires) == bool, message: "wires must be a bool")

    // Draw component
    group(name: uid, {
        let angle = get-angle(rotate, node, node2)
        cetz.draw.on-layer(1, {
            cetz.draw.scope({
                let origin = get-origin(node, node2)
                cetz.draw.floating(cetz.draw.circle(origin, stroke: red, radius: 1pt))
                cetz.draw.scale(scale)
                cetz.draw.set-origin(origin)
                cetz.draw.rotate(angle)
                (draw.anchors)(node2, variant, scale, angle, wires, ..params.named())
                (draw.component)(node2, variant, scale, angle, wires, ..params.named())
            })
        })
        cetz.draw.on-layer(0, {
            (draw.wires)(node2, variant, scale, angle, wires, ..params.named())
        })
    })

    if (debug) {
        cetz.draw.for-each-anchor(uid, (name) => {
           cetz.draw.content((), box(inset: 1pt, fill: black, text(4pt, [#name], fill: white)), angle: -30deg)
        })
    }

    // Draw label
    if (label != none) {
        let angle = get-angle(rotate, node, node2)
        let label-anchor = if (
            (angle > -45deg and angle < 45deg) or
            (angle > 135deg or angle < -135deg)
        ) {
            ("north", "south")
        } else {
            ("east", "west")
        }
        let content = if (type(label) == str) { $label$ } else { label }
        cetz.draw.content(uid+"."+label-anchor.at(0), content, anchor: label-anchor.at(1), padding: 6pt)
    }
}