#import "dependencies.typ": cetz
#import cetz.draw: group, rotate as cetzrotate, scale as cetzscale, set-style, set-origin, for-each-anchor, content

#let component(uid, position, draw, label: none, variant: "iec", wires: true, scale: 1.0, rotate: 0deg, ..params) = {
    assert(type(uid) == str, message: "component ID must be a string")
    assert(type(scale) == float, message: "scale must be float")
    assert(type(rotate) == angle, message: "scale must be float")
    assert(variant == "ieee" or variant == "iec" or variant == "pretty", message: "variant must be 'iec' or 'ieee'")
    assert(type(wires) == bool, message: "wires must be a bool")
    assert(type(label) in (content, str) or label == none, message: "label must be content, none, str")

    group(name: uid, {
        set-origin(position)
        cetzscale(scale)
        cetzrotate(-90deg - rotate) // dependent with motors dc symbol
        draw(variant, scale, rotate, wires, ..params)
    })

    if (not label == none) {
        let anchor = "east"
        let text-anchor = "west"
        if ((rotate < 135deg and rotate > 45deg) or (rotate > -135deg and rotate < -45deg)) {
            anchor = "north"
            text-anchor = "south"
        }
        content(uid+"."+anchor, label, anchor: text-anchor, padding: 6pt)
    }
}