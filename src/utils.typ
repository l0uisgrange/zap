#import "dependencies.typ": cetz
#import cetz.draw: line, floating, get-ctx

#let quick-wires(node, node2, node-anchor, node2-anchor, rotate) = {
    let wires-stroke = .6pt

    if (node2 != none) {
        floating(line(node, node2, stroke: wires-stroke))
    } else {
        floating(line(node-anchor, (rel: (angle: rotate, radius: 1)), stroke: wires-stroke))
        floating(line(node2-anchor, (rel: (angle: 180deg+rotate, radius: 1)), stroke: wires-stroke))
    }
}