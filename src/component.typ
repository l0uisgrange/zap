#import "dependencies.typ": cetz
#import cetz.draw: group, rotate as cetzrotate, scale as cetzscale, set-style, set-origin

#let component(uid, position, draw, variant: "iec", scale: 1.0, rotate: 90deg, ..params) = {
    assert(type(uid) == str, message: "component ID must be a string")
    assert(type(scale) == float, message: "scale must be float")
    assert(type(rotate) == angle, message: "scale must be float")
    assert(variant == "ieee" or variant == "iec", message: "variant must be 'iec' or 'ieee'")

    group(name: uid, {
        set-origin(position)
        cetzscale(scale)
        cetzrotate(rotate)
        set-style(..params)
        draw(variant, scale, rotate, ..params)
    })
}