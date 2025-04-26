#import "dependencies.typ": cetz

#let component(uid, position, draw, variant: "european", scale: 1.0, rotate: 0deg, ..params) = {
    assert(type(uid) == str, message: "component ID must be a string")
    assert(type(scale) == float, message: "scale must be float")
    assert(variant == "american" or variant == "european", message: "variant must be 'european' or 'american'")
    assert(type(position) == array and position.len() == 2, message: "position must be an array of 2 floats")

    cetz.draw.group(name: uid, {
        cetz.draw.set-origin(position)
        cetz.draw.scale(scale)
        cetz.draw.rotate(rotate)
        cetz.draw.set-style(..params)
        draw(variant, scale, rotate, ..params)
    })
}