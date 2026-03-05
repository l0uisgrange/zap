#import "/src/dependencies.typ": cetz
#import "/src/utils.typ": get-style, opposite-anchor, resolve-style
#import cetz.draw: anchor, circle, content, group, hide, line, mark, set-origin, set-style
#import cetz.styles: merge

#let ra = ratio

/// Wire component: Draws a wire between multiple points with optional markers and decorations.
/// - bits (int|string, optional):
///     - int: number of parallel lines (only drawn if > 1)
///     - string: label text displayed on the wire
/// - shape (string, optional): "direct", "zigzag", "dodge"; defines wire shape
/// - ratio (float|ratio|length, optional): position of mid-point for zigzag wires
/// - axis (string, optional): "x" or "y"; alignment axis for zigzag bends
/// - i (any, optional): current decoration style for the wire
/// - name (string, optional): unique name of the wire group for anchors
/// - pos (list of coordinates, required): at least two points defining the wire
/// *Anchors:* `in` (start), `out` (end), `p0..pn` (intermediate points)
#let wire(bits: 0, shape: "direct", ratio: 50%, axis: "x", i: none, name: none, ..params) = {
    assert(type(bits) in (int, str), message: "bits must be an int")
    assert(params.pos().len() >= 2, message: "wires need at least two points")
    assert(type(ratio) in (ra, int, float, length), message: "ratio must be a ratio, a number or a length")
    assert(shape in ("direct", "zigzag", "dodge"), message: "shape must be direct, zigzag or dodge")

    group(name: name, ctx => {
        let style = get-style(ctx).wire
        let (ctx, ..points) = cetz.coordinate.resolve(ctx, ..params.pos())

        set-style(stroke: style.stroke)
        let final-points = ()

        // Drawing the wire using the shape parameter
        anchor("in", points.first())
        anchor("out", points.last())
        for (index, point) in points.enumerate() {
            anchor("p" + str(index), point)
        }
        if shape == "direct" {
            final-points = points
            line(..points, name: "line")
        } else if shape == "zigzag" {
            if points.len() < 2 { return }

            let generated-points = ()
            for i in range(points.len() - 1) {
                let p1 = points.at(i)
                let p2 = points.at(i + 1)
                let (ctx, p-mid) = cetz.coordinate.resolve(ctx, (p1, ratio, p2))

                let p-mid1 = if axis == "x" { (p-mid.at(0), p1.at(1)) } else { (p1.at(0), p-mid.at(1)) }
                let p-mid2 = if axis == "x" { (p-mid.at(0), p2.at(1)) } else { (p2.at(0), p-mid.at(1)) }

                group(name: "p" + str(i) + "-p" + str(i + 1), {
                    anchor("a", p-mid1)
                    anchor("b", p-mid2)
                })

                generated-points = (..generated-points, p1, p-mid1, p-mid2)
            }
            final-points = (..generated-points, points.last())
            line(..generated-points, points.last(), name: "line")
        }
        for (index, point) in final-points.enumerate() {
            anchor("p" + str(index), point)
        }

        // --- Multi-bits wiring (robust marker placement) ---
        if bits != 0 and final-points.len() >= 2 and type(bits) == str {
            let n = final-points.len()

            let min-dist = style.marker.min-dist
            let max-dist = style.marker.max-dist

            let pick-segment = (ctx, start: true) => {
                if n < 2 { return (ctx, none, none) }

                for k in range(n - 1) {
                    let a = if start { k } else { n - 1 - k }
                    let b = if start { k + 1 } else { n - 2 - k }

                    let p-a = final-points.at(a)
                    let p-b = final-points.at(b)

                    let seg-len = cetz.vector.dist(p-a, p-b)

                    if seg-len >= min-dist {
                        return (ctx, p-a, p-b)
                    }
                }

                let p0 = if start { final-points.at(0) } else { final-points.at(n - 1) }
                let p1 = if start { final-points.at(1) } else { final-points.at(n - 2) }
                return (ctx, p0, p1)
            }

            let marker-configs = (
                (start: true, name: "start"),
                (start: false, name: "end"),
            )

            for m in marker-configs {
                group(name: "bus-marker-" + m.name, {
                    cetz.draw.get-ctx(ctx => {
                        let (ctx, p-s, p-e) = pick-segment(ctx, start: m.start)
                        if p-s == none or p-e == none { return }

                        let seg-len = cetz.vector.dist(p-s, p-e)

                        let actual-dist = calc.min(max-dist, seg-len * 0.45)
                        actual-dist = calc.max(actual-dist, min-dist)

                        let near-threshold = calc.min(style.marker.kink-threshold, seg-len * 0.25)
                        let is-near-kink = (seg-len - actual-dist) < near-threshold

                        set-origin((p-s, actual-dist, p-e))

                        let angle = cetz.vector.angle2(p-s, p-e)

                        let idx = none

                        for j in range(n) {
                            if final-points.at(j) == p-e {
                                idx = j
                            }
                        }

                        let text-anchor = "north"
                        let text-pos = (0, -0.175)

                        if is-near-kink and idx != none {
                            let next-idx = if m.start { idx + 1 } else { idx - 1 }

                            if next-idx >= 0 and next-idx < n {
                                let p-next = final-points.at(next-idx)

                                let dx = p-next.at(0) - p-e.at(0)
                                let dy = p-next.at(1) - p-e.at(1)

                                if calc.abs(dx) > calc.abs(dy) {
                                    if dx > 0 {
                                        text-anchor = "north"
                                        text-pos = (0, -0.175)
                                    } else {
                                        text-anchor = "south"
                                        text-pos = (0, 0.175)
                                    }
                                } else {
                                    if dy > 0 {
                                        text-anchor = "west"
                                        text-pos = (0.175, 0)
                                    } else {
                                        text-anchor = "east"
                                        text-pos = (-0.175, 0)
                                    }
                                }
                            }
                        }

                        group({
                            cetz.draw.rotate(angle + 30deg)
                            line((0, -0.15), (0, 0.15), stroke: style.stroke)
                        })

                        let display = if type(bits) == int { [#bits] } else { bits }

                        let dx = p-e.at(0) - p-s.at(0)
                        let dy = p-e.at(1) - p-s.at(1)

                        let text-gap = style.marker.text-gap

                        let text-pos = (0, -text-gap)
                        let text-anchor = "north"

                        if calc.abs(dy) > calc.abs(dx) {
                            let side-gap = style.marker.side-gap
                            if dy > 0 {
                                text-pos = (-side-gap, 0)
                                text-anchor = "west"
                            } else {
                                text-pos = (side-gap, 0)
                                text-anchor = "east"
                            }
                        } else {
                            if dx > 0 {
                                text-pos = (0, -text-gap)
                                text-anchor = "north"
                            } else {
                                text-pos = (0, text-gap)
                                text-anchor = "south"
                            }
                        }

                        content(
                            (text-pos.at(0), text-pos.at(1)),
                            text(0.7em, weight: "bold", display),
                            anchor: text-anchor,
                        )
                    })
                })
            }
        }

        if type(bits) == int and bits > 1 {
            let spacing = style.spacing
            for i in range(bits - 1) {
                let offset = (i - (bits - 1) / 2) * spacing
                let shifted-points = final-points.map(p => (p.at(0), p.at(1) + offset))
                line(..shifted-points)
            }
        }

        if i != none {
            let zap-style = ctx.zap.style
            zap-style.decoration.current.wire = merge(zap-style.decoration.current.wire, if type(i) == dictionary { i } else {
                (content: i)
            })

            let dec = resolve-style(zap-style).decoration.current.wire
            mark(
                (name: "line", anchor: dec.position),
                (name: "line", anchor: dec.position + if type(dec.position) == ra { 1% } else { 0.1 }),
                symbol: dec.symbol,
                reverse: dec.invert,
                anchor: "center",
                fill: dec.stroke.paint,
                stroke: 0pt,
                scale: dec.scale * get-style(ctx).decoration.scale,
            )
            content(
                (name: "line", anchor: dec.position),
                anchor: opposite-anchor(dec.anchor),
                dec.content,
                padding: dec.distance,
            )
        }
    })
}

/// Zigzag wire shortcut: Same as `wire` but with `shape: "zigzag"`.
/// All other parameters are passed through.
/// - bits (int|string, optional):
///     - int: number of parallel lines (only drawn if > 1)
///     - string: label text displayed on the wire
/// *Anchors:* same as `wire`
#let zwire(..params) = wire(shape: "zigzag", ..params)

/// Creates an L-shaped or step-shaped wire by setting ratio to 100%
/// - bits (int|string, optional):
///     - int: number of parallel lines (only drawn if > 1)
///     - string: label text displayed on the wire
/// *Anchors:* same as `wire`
#let swire(..params) = wire(shape: "zigzag", ratio: 100%, ..params)
