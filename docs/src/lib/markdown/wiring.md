---
title: Wiring
subtitle: Wiring has been made intuitive and easy to do in Zap.
---

## Shapes

You can choose between squared, zigzag or straight wires using `swire`, `zwire` or `wire`.

![dede](/docs/wires.svg)

```typst
#zap.circuit({
    import zap: *

    wire((0, 0), (1, 0))
    zwire((2, 0), (4, 2), stroke: blue)
    swire((5, 2), (6, -1), stroke: red)
})
```

### Customization

The position and axis of the wire can also be altered using the `axis` and `ratio` parameters.

![dede](/docs/wires-altered.svg)

```typst
#zap.circuit({
    import zap: *

    wire((0, 0), (1, 0)) // N/A
    zwire((2, 0), (4, 2), stroke: blue, axis: "y", ratio: 80%)
    swire((5, 2), (6, -1), stroke: red, axis: "y")
})
```

### Anchors
- `in`: the first point
- `out`: the last point
- `p<i>`: an anchor for each given point of the wire (by index i)
- `p<i>-p<i+1>.a`: the first zigzag corner between the points i and i+1 (only for zigzag)
- `p<i>-p<i+1>.b`: the second zigzag corner between the points i and i+1 (only for zigzag)
