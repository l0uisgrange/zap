---
title: Annotations
subtitle: Draw additional content on your circuits, for example to regroup a set of symbols or to add a note somewhere.
---

## Basics

As the `circuit` is just a boosted version of CeTZ' `canvas`, you can directly draw shapes on it.

![](/docs/annotations.svg)

```typst
#import "@preview/zap:0.4.0"
#import "@preview/cetz:0.4.2": draw

#zap.circuit({
    import zap: *

    // classic circuit
    vsource("v1", (1, 0), (1, 3), u: $u_1$)
    resistor("r1", "v1.out", (rel: (3, 0)), i: $i_1$)

    // annotations
    draw.rect((0.7, 2.5), (4, 4), stroke: (dash: "dashed", thickness: .8pt, paint: red), name: "rect")
    draw.content("rect.north", text(fill: red)[This is a rectangle], anchor: "south")
    draw.line((2, 2), (4, 0), mark: (end: ">", fill: purple), stroke: purple + .8pt)
})
```
