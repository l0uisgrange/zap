#import "dependencies.typ": cetz
#import cetz.draw: group, rotate as cetzrotate, scale as cetzscale, set-style, set-origin

#let component(uid, position, draw, variant: "iec", wires: true, scale: 1.0, rotate: 0deg, ..params) = {
    assert(type(uid) == str, message: "component ID must be a string")
    assert(type(scale) == float, message: "scale must be float")
    assert(type(rotate) == angle, message: "scale must be float")
    assert(variant == "ieee" or variant == "iec", message: "variant must be 'iec' or 'ieee'")
    assert(type(wires) == bool, message: "wires must be a bool")

    group(name: uid, {
        set-origin(position)
        cetzscale(scale)
        cetzrotate(rotate)
        draw(variant, scale, rotate, wires, ..params)
    })
}