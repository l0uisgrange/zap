#import "dependencies.typ": cetz

#let component(uid, node, draw: none, label: none, variant: "iec", wires: true, scale: 1.0, rotate: 0deg, label-anchor: none, ..params) = {
    assert(type(uid) == str, message: "component ID must be a string")
    assert(type(scale) == float, message: "scale must be float")
    assert(type(rotate) == angle, message: "scale must be float")
    assert(variant in ("ieee", "iec", "pretty"), message: "variant must be 'iec', 'ieee' or 'pretty'")
    assert(type(wires) == bool, message: "wires must be a bool")

    let node2 = none
    if (params.pos().len() > 2) {
        node2 = params.pos().at(0)
    }

    // Draw component
    cetz.draw.group(name: uid, {
        cetz.draw.circle(node, radius: 1pt, stroke: green)
        if (node2 == none) {
            cetz.draw.set-origin(node)
        } else {
            cetz.draw.hide(cetz.draw.line(node, node2, name: "LINE_ACROSS"))
            cetz.draw.circle(node2, radius: 1pt, stroke: green)
            cetz.draw.set-origin("LINE_ACROSS.centroid")
            cetz.draw.circle((0,0), radius: 1pt, stroke: red)
        }
        cetz.draw.scale(scale)
        cetz.draw.rotate(rotate)
        draw(variant, scale, rotate, wires, ..params.named())
    })

    // Draw wires
    if (node2 != none) {
        cetz.draw.line(node, node)
    }

    // Draw label
    if (label != none) {
        let label-anchor = if (
            (rotate > -45deg and rotate < 45deg) or
            (rotate > 135deg or rotate < -135deg)
        ) {
            ("north", "south")
        } else {
            ("east", "west")
        }
        let content = if (type(label) == str) { $label$ } else { label }
        cetz.draw.content(uid+"."+label-anchor.at(0), content, anchor: label-anchor.at(1), padding: 6pt)
    }
}