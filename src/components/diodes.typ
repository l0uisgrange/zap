#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, polygon, line

#let diode(uid, position, ..params) = {
    // TODO: move to defaults
    let wires-length = 7pt
    let component-stroke = 1pt
    let wires-stroke = 0.6pt
    let sign-stroke = 0.6pt
    // IEC style constants
    let polygon-radius = 12pt
    let height = polygon-radius * calc.sin(calc.pi/4)
    // TODO: replace with polygon once cetz.polygon accepts length as radius
    let tangent = polygon-radius * calc.cos(calc.pi/4) * 0.7

    // IEEE/ANSI style constants
    let bumps = 3
    let bump-radius = polygon-radius / bumps / 2

    // CeTZ Canvas
    let draw(variant, scale, rotate, wires, ..styling) = {
        // Defining anchors
        if (wires) {
            anchor("in", (- tangent - wires-length, 0))
            anchor("out", (polygon-radius + wires-length, 0))

            line("in", "out", stroke: wires-stroke)
        } else {
            anchor("in", (- polygon-radius/2, 0))
            anchor("out", (rel: (polygon-radius, 0)))
        }

        // Drawing function
        if (variant == "iec") {
            let radius = .3
            // TODO: replace with polygon once cetz.polygon accepts length as radius
            // polygon((0,0), 3, radius: polygon-radius)
            line((-tangent, -height), (-tangent, height), stroke: component-stroke)
            line((-tangent, -height), (polygon-radius, 0), stroke: component-stroke)
            line((-tangent, height), (polygon-radius, 0), stroke: component-stroke)

            line((polygon-radius, -height), (polygon-radius, height), stroke: component-stroke)
        } else {
            /*let start = (-width / 2 - bump-radius, 0pt)
            for i in range(bumps) {
                let arc-center-x = start.at(0) + bump-radius + i * 2 * bump-radius
                let arc-center = (arc-center-x, 0pt)
                arc(arc-center, radius: bump-radius, start: 180deg, stop: 0deg)
            }*/
        }
    }

    // Componant call
    component(uid, position, draw, ..params)
}