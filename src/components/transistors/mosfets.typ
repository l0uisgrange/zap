#import "../../component.typ": component
#import "../../dependencies.typ": cetz
#import cetz.draw: anchor, line, mark, circle, set-origin
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
    let width = 20pt
    let base-spacing = 3pt
    let base-width = width + 8pt
    let bar-length = (base-width - 2*base-spacing)/3
    let height = 15pt
    let base-delta = 5pt

    // CeTZ Canvas
    let draw(variant, scale, rotate, wires, ..styling) = {
        if (wires) {
            anchor("gate", (-height/2 + base-delta - wires-length, 0))
            anchor("drain", (height/2 + base-delta, width / 2 + wires-length))
            anchor("source", (height/2 + base-delta, - width / 2 - wires-length))

            line("gate", (rel: (wires-length, 0)), stroke: wires-stroke)
            line("drain", (rel: (0, -wires-length)), (rel: (-height, 0)), stroke: wires-stroke)
            line("source", (rel: (0, wires-length)), (rel: (-height, 0)), stroke: wires-stroke)
        } else {
            anchor("gate", (-height/2 + base-delta - wires-length, 0))
            anchor("drain", (-height/2 + base-delta - wires-length, 0))
            anchor("source", (-height/2 + base-delta - wires-length, 0))

            line((-height/2 + base-delta, width/2), (rel: (height, 0)), stroke: wires-stroke)
            line((-height/2 + base-delta, -width/2), (rel: (height, 0)), stroke: wires-stroke)
        }

        if (mode == "enhancement") {
            let bar-length = (base-width - 2*base-spacing)/3
            for i in range(3) {
                line(((-height/2 + base-delta, -base-width/2 + i * (bar-length + base-spacing))), (rel: (0, bar-length)))
            }
        } else {
            line((-height/2 + base-delta, -base-width/2), (rel: (0, base-width)))
        }
        if (not substrate == none) {
            line((-height/2 + base-delta, 0), (rel: (height, 0)), name: "line", stroke: wires-stroke)
            mark("line.centroid", "gate", symbol: if (channel == "n") { ">" } else { "<" }, fill: black, scale: 0.8, anchor: "center")
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}

#let pmos(uid, position, ..params) = mosfet(uid, position, polarisation: "pmos", ..params)
#let nmos(uid, position, ..params) = mosfet(uid, position, polarisation: "nmos", ..params)
#let pmosd(uid, position, ..params) = mosfet(uid, position, polarisation: "pmos", mode: "depletion", ..params)
#let nmosd(uid, position, ..params) = mosfet(uid, position, polarisation: "nmos", mode: "depletion", ..params)