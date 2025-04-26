#import "dependencies.typ": cetz
#import "defaults.typ": get-defaults

#let component(uid, position, draw, variant: "european", scale: 1.0, rotate: 0deg, stroke: luma(0%), stroke-width: 1pt, ..params) = {
    assert(type(uid) == str, message: "component ID must be a string")
    assert(type(scale) == float, message: "scale must be float")
    assert(variant == "american" or variant == "european", message: "variant must be 'european' or 'american'")
    assert(type(position) == array and position.len() == 2, message: "position must be an array of 2 floats")

    let global-params = get-defaults()

    assert(type(global-params) == dictionary, message: "ERREUR: global-params n'est pas un dictionnaire ! Type reçu: " + repr(type(global-params)))

    let final-params = global-params + params.named()

    cetz.draw.group(name: uid, {
        cetz.draw.set-origin(position1)
        cetz.draw.scale(scale)
        cetz.draw.rotate(rotate)
        cetz.draw.set-style(..params)
        draw(position1, position2, variant, scale, rotate, ..final-params)
    })
}