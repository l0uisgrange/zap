---
title: Positioning
subtitle: Zap simplifies component positioning through CeTZ, providing two methods for placing your circuit elements.
---

## Basic placement

To position components within your circuit, you can choose to either attach them to a single node, or place them between two nodes. If you choose the latest option, wires will be automatically placed between the nodes.

![dede](/docs/ded.svg)

```typst
#zap.circuit({
    import zap: *

    // using one node ...
    resistor("r1", (-2, 0))

    // ... or using two nodes
    resistor("r2", (1, 0), (4, 0))
})
```

Note that **some components can only be placed using one node**, like operational amplifiers, grounds and transistors.

You can also customize the position of the component alongside the wire using the `position` parameter like below.

![dede](/docs/position.svg)

```typst
#zap.circuit({
    import zap: *

    resistor("r1", (0, 0), (3, 0), position: 70%)
})
```

The `position` parameter also accepts a distance, which is always relative to the `in` anchor.

## Named anchors

Sometimes, you just want to connect a component to another without worrying about coordinates or doing mental math. That's where named anchors come in.

The name provided as the first argument acts as an identifier for the component. If we draw a `resistor` identified as `r1`, we can attach a voltage source to its `out` anchor like below.

![dede](/docs/positioning.svg)

```typst
#zap.circuit({
    import zap: *

    resistor("r1", (0, 0), (3, 0))
    vsource("v1", "r1.out", (3, 3))
})
```

A list of available named anchors for each component is available on the [component page](/docs/components/resistor). You can also activate [debugging](/docs/debug) to display the available anchors directly on your circuit.

## Nodes

You can also use the `node` component instead of anchors. They work pretty much the same, but nodes are visible on the circuit.

![dede](/docs/node.svg)

```typst
#zap.circuit({
    import zap: *

    node("n1", (2, 0), label: "MyNode")
})
```

It's also possible to display nodes directly when calling your components, and they will represent the `in` and `out` anchors.

![dede](/docs/nodes.svg)

```typst
#zap.circuit({
    import zap: *

    resistor("r1", (1, 0), (4, 0), n: "*-*")
})
```

You can either have circles using `o` or a filled one using `*`. For example, `o-*` will have a circle on the `in` anchor and a filled circle on the `out` anchor.

## Coordinates

Coordinates are fully managed by CeTZ, and you'll find a very extensive list of features on their [online documentation](https://cetz-package.github.io/docs/basics/coordinate-systems), like relative, perpendicular and polar coordinates. Let's just have a quick look at the main features you'll use in your circuits.

### Perpendicular

You can easily define a new coordinate with the perpendicular position between 2 other coordinates.

![dede](/docs/perpendicular.svg)

```typst
#zap.circuit({
    import zap: *

    node("n1", (3, -1), label: "A")

    // using either (A, "-|", B) or (A, "|-", B) is possible
    node("n2", ((0, 0), "-|", "n1"), label: "P")
})
```

### Relative coordinates

You can also define the new coordinate using a previously defined anchor.

In the example below, we want to point `r2` to the `out` anchor of `r1`, but a little bit on the right.

![dede](/docs/relative.svg)

```typst
#zap.circuit({
    import zap: *

    // relative to the previous coordinate, here (1, 0)
    resistor("r1", (1, 0), (rel: (3, 0)))

    // relative to a specific coordinate
    resistor("r2", (5, -3), (rel: (1, 0), to: "r1.out"))
})
```
