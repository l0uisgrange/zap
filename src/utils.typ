#import "dependencies.typ": cetz
#import cetz.draw: line, floating, get-ctx

#let get-origin(node, node2) = {
    if (node2 == none) {
        return node
    } else {
        if (type(node) == array and type(node2) == array) {
            return ((node.at(0) + node2.at(0))/2, (node.at(1) + node2.at(1))/2)
        } else {
            return "center"
        }
    }
}

#let get-angle(rotate, node, node2) = {
    if (node2 != none) {
        return calc.atan2(node2.at(0) - node.at(0), node2.at(1) - node.at(1))
    } else {
        return rotate
    }
}

#let quick-wires(node, node2, node-anchor, node2-anchor, rotate) = {
    let wires-stroke = .6pt

    if (node2 != none) {
        floating(line(node, node2, stroke: wires-stroke))
    } else {
        floating(line(node-anchor, (rel: (angle: rotate, radius: 1)), stroke: wires-stroke))
        floating(line(node2-anchor, (rel: (angle: 180deg+rotate, radius: 1)), stroke: wires-stroke))
    }
}