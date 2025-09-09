#import "../dependencies.typ": cetz
#import "../styles.typ": default-style
#import cetz.draw: line, group, hide

#let ra = ratio

#let wire(bits: 0, shape: "direct", ratio: 50%, axis: "y", ..params) = {
    assert(type(bits) == int, message: "bits must be an int")
    assert(params.pos().len() >= 2, message: "wires need at least two points")
    assert(type(ratio) in (ra, int, float, length), message: "ratio must be a ratio, a number or a length")
    assert(shape in ("direct", "zigzag", "dodge"), message: "shape must be direct, zigzag or dodge")

    group(name: "wireeeweeee", ctx => {
        let pre-style = cetz.styles.resolve(ctx.style, root: "zap", base: default-style)
        let style = cetz.styles.resolve(pre-style, merge: params.named())
        let (ctx, ..points) = cetz.coordinate.resolve(ctx, ..params.pos())

        if shape == "direct" {
            line(..points, ..style.at("wires"), name: "line")
        } else if shape == "zigzag" {
            if points.len() < 2 { return }

            let generated-points = ()
            for i in range(points.len() - 1) {
                let p1 = points.at(i)
                let p2 = points.at(i+1)
                let (ctx, p-mid) = cetz.coordinate.resolve(ctx, (p1, ratio, p2))

                let p-mid1 = if axis == "x" { (p-mid.at(0), p1.at(1)) } else { (p1.at(0), p-mid.at(1)) }
                let p-mid2 = if axis == "x" { (p-mid.at(0), p2.at(1)) } else { (p2.at(0), p-mid.at(1)) }

                generated-points = (..generated-points, p1, p-mid1, p-mid2)
            }

            line(..generated-points, points.last(), ..style.at("wires"), name: "line")
        }

        // Handle multi-bits wiring by displaying a slash with a number
        for i in range(bits) {
            let delta = i * 0.4
            line((rel: (0,-0.2), to: "line.50%"), (rel: (0,0.2), to: "line.50%"), ..style.at("wires"))
        }
    })
}


#let zwire(..params) = wire(shape: "zigzag", ..params)
#let swire(..params) = wire(shape: "zigzag", ratio: 100%, ..params)