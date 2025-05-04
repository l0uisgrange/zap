let get-origin(node, node2) = {
    if (node2 == none) {
        return node
    } else {
        cetz.draw.hide(cetz.draw.line(node, node2, name: "line"))
        cetz.draw.set-origin("line.centroid")
        cetz.draw.floating(cetz.draw.circle((0,0), radius: 6pt, stroke: red))
    }
}