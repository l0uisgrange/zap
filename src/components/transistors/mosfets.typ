#import "../../component.typ": component
#import "../../dependencies.typ": cetz
#import cetz.draw: anchor, line, mark, circle
#import "../../mini.typ": adjustable-arrow

#let mosfet(uid, position, channel: "n", envelope: false, gates: 1, mode: "enhancement", substrate: "internal", ..params) = {
    assert(type(envelope) == bool, message: "envelope must be of type bool")
    assert(mode in ("enhancement", "depletion"), message: "mode must be `enhancement` or `depletion`")
    assert(gates in (1,2), message: "gates number must be 1 or 2")
    assert(channel in ("p", "n"), message: "channel must be `p` or `n`")
    assert(substrate in ("internal", "external", none), message: "substrate must be `internal`, `external` or none")

    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt

    // Style constants


    // CeTZ Canvas
    let draw(variant, scale, rotate, wires, ..styling) = {

    }

    // Componant call
    component(uid, position, draw, ..params)
}

#let pmos(uid, position, ..params) = mosfet(uid, position, polarisation: "pmos", ..params)
#let nmos(uid, position, ..params) = mosfet(uid, position, polarisation: "nmos", ..params)