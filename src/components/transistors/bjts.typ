#import "../../component.typ": component
#import "../../dependencies.typ": cetz
#import cetz.draw: anchor, line, mark, circle, scale as cetzscale
#import "../../mini.typ": adjustable-arrow

#let bjt(uid, node, polarisation: "npn", envelope: false, ..params) = {
    assert(polarisation in ("npn", "pnp"), message: "polarisation must `npn` or `pnp`")
    assert(type(envelope) == bool, message: "envelope must be of type bool")

    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt

    // Style constants
    let radius = 15pt
    let angle = 45deg
    let width = 17pt
    let distance = 6pt
    let base = (-6pt, 0)
    let emitter = (calc.cos(angle) * radius, calc.sin(angle) * radius)
    let collector = (calc.cos(angle) * radius, -calc.sin(angle) * radius)
    if (polarisation == "npn") {
        let temp = emitter
        emitter = collector
        collector = temp
    }
    let wires-direction = - ((int(polarisation == "npn") + 1) * 2 - 3)

    // CeTZ Canvas
    let draw(variant, scale, rotate, wires, ..styling) = {
        cetzscale(1.1)
        // Defining anchors
        if (envelope and not wires) {
            anchor("base", (-radius, 0))
            anchor("emitter", emitter)
            anchor("collector", collector)
        } else if (envelope and wires) {
            anchor("base", (-radius - wires-length, 0))
            anchor("emitter", (emitter.at(0), emitter.at(1) + wires-direction * wires-length))
            anchor("collector", (collector.at(0), collector.at(1) - wires-direction * wires-length))
        } else if (not envelope and wires) {
            anchor("base", (base.at(0) - wires-length, 0))
            anchor("emitter", (emitter.at(0), emitter.at(1) + wires-direction * wires-length))
            anchor("collector", (collector.at(0), collector.at(1) - wires-direction * wires-length))
        } else {
            anchor("base", base)
            anchor("emitter", emitter)
            anchor("collector", collector)
        }
        if (envelope) {
            line(base, (x: -radius), stroke: wires-stroke)
        }

        if (wires) {
            line("base", (rel: (wires-length,0)), stroke: wires-stroke)
            line("emitter", (rel: (0, -wires-length * wires-direction)), stroke: wires-stroke)
            line("collector", (rel: (0, wires-length * wires-direction)), stroke: wires-stroke)
        }

        // Drawing function
        line((base.at(0), -width/2), (base.at(0), width/2), stroke: component-stroke)

        line((base.at(0), wires-direction * distance/2), emitter, name:"line", stroke: wires-stroke)
        line((base.at(0), -distance/2 * wires-direction), collector, name: "line2", stroke: wires-stroke)

        mark("line.centroid", emitter, symbol: if (polarisation == "npn") { ">" } else { "<" }, fill: black, scale: 0.8, anchor: "center")

        if (envelope) {
            circle((0,0), radius: radius, stroke: component-stroke)
        }
    }

    // Componant call
    component(uid, node, none, draw, ..params)
}

#let pnp(uid, node, ..params) = bjt(uid, node, polarisation: "pnp", ..params)
#let npn(uid, node, ..params) = bjt(uid, node, polarisation: "npn", ..params)