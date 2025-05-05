#import "dependencies.typ": cetz

#let get-origin(node, node2) = {
    if (node2 == none) {
        return node
    } else {
        return ((node.at(0) + node2.at(0))/2, (node.at(1) + node2.at(1))/2)
    }
}

#let get-angle(rotate, node, node2) = {
    if (node2 != none) {
        return calc.atan2(node.at(0) - node2.at(0), node.at(1) - node2.at(1))
    } else {
        return rotate
    }
}