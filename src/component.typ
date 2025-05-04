#import "dependencies.typ": cetz

#let component(uid, node, draw: none, label: none, variant: "iec", wires: true, scale: 1.0, rotate: 0deg, label-anchor: none, debug: false, ..params) = {
    let node2 = params.pos().at(0, default: none)
    assert(params.pos().len() < 2, message: "accepts only 2 or 3 (for 2 nodes components only) positional arguments")
    assert(node2 == none or rotate == 0deg, message: "cannot use rotate argument with 2 nodes")
    assert(type(uid) == str, message: "component ID must be a string")
    assert(type(scale) == float, message: "scale must be float")
    assert(type(rotate) == angle, message: "scale must be float")
    assert(variant in ("ieee", "iec", "pretty"), message: "variant must be 'iec', 'ieee' or 'pretty'")
    assert(type(wires) == bool, message: "wires must be a bool")

    let final-angle = if (node2 != none) { calc.atan2(node.at(0) - node2.at(0), node.at(1) - node2.at(1)) } else { rotate }

    // Draw component
    cetz.draw.group(name: uid, {
        cetz.draw.floating(cetz.draw.circle(node2, radius: 6pt, fill: red))
        if (node2 == none) {
            cetz.draw.set-origin(node)
        } else {
            cetz.draw.hide(cetz.draw.line(node, node2, name: "LINE_ACROSS"))
            cetz.draw.set-origin("LINE_ACROSS.centroid")
            cetz.draw.floating(cetz.draw.circle((0,0), radius: 6pt, stroke: red))
        }
        cetz.draw.scale(scale)
        cetz.draw.rotate(final-angle)
        draw(node2, variant, scale, final-angle, wires, ..params.named())
    })

    if (debug) {
        cetz.draw.for-each-anchor(uid, (name) => {
           cetz.draw.content((), box(inset: 1pt, fill: black, text(4pt, [#name], fill: white)), angle: -30deg)
        })
    }

    // Draw label
    if (label != none) {
        let label-anchor = if (
            (final-angle > -45deg and final-angle < 45deg) or
            (final-angle > 135deg or final-angle < -135deg)
        ) {
            ("north", "south")
        } else {
            ("east", "west")
        }
        let content = if (type(label) == str) { $label$ } else { label }
        cetz.draw.content(uid+"."+label-anchor.at(0), content, anchor: label-anchor.at(1), padding: 6pt)
    }
}