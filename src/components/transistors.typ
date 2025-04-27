#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, line, mark, circle
#import "../mini.typ": adjustable-arrow

#let pnp(uid, position, envelope: false, ..params) = {
    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt

    // Style constants
    let half-length = 6pt
    let p-width = 13pt
    let n-width = 20pt
    let n-distance = 4pt

    // CeTZ Canvas
    let draw(variant, scale, rotate, wires, ..styling) = {
        // Defining anchors
        if (wires) {
            anchor("base", (- half-length - wires-length, 0))
            anchor("emitter", (half-length, n-width / 2 + wires-length))
            anchor("collector", (half-length, -n-width / 2 - wires-length))

            line("base", (- half-length, 0), stroke: wires-stroke)
            line("emitter", (rel: (0, -wires-length)), stroke: wires-stroke)
            line("collector", (rel: (0, wires-length)), stroke: wires-stroke)
        } else {
            anchor("base", (- half-length, 0))
            anchor("emitter", (half-length, n-width / 2))
        }

        // Drawing function
        line((-half-length, -p-width/2), (-half-length, p-width/2), stroke: component-stroke)

        line((-half-length, n-distance/2), (half-length, n-width/2), name:"line", stroke: wires-stroke)
        mark("line.centroid", (half-length, n-width/2), symbol: "<", fill: black, scale: 0.6, anchor: "center")
        line((-half-length, -n-distance/2), (half-length, -n-width/2), stroke: wires-stroke)

        if (envelope) {
            circle((0,0), (half-length, n-width / 2), stroke: wires-stroke)
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}