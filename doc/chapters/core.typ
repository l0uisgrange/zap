#import "../../src/exports.typ": *

= Core concepts

== CeTZ coordinate system

#grid(columns: (auto, 1fr), gutter: 10pt,
    cetz.canvas({
        import cetz: *

        draw.grid((0,0), (4,4), stroke: .6pt + luma(60%), step: .5)
        draw.set-origin((2,2))
        draw.line((0,0), (2,0), mark: (end: ">", fill: black))
        draw.line((0,0), (0,2), mark: (end: ">", fill: black))
        isource("id", (0,0), fill: white)
    }),
    [
        The #link("https://cetz-package.github.io/docs/", `CeTZ`) library uses a coordinate system with magic anchors.

        Every component is by default drawn from it's center `(0,0)` in the vertical direction.

        You can use any anchor from every component, such as `center`, `south`, `north`, etc. using the following syntax. The first parameter `uid` is mandatory and used for automatically creating anchors around the component.

        ```typst
        #canvas({
            resistor("r1", "myOtherComponent.south")
        })
        ```
    ]
)

== Components

At the heart of Circuitor lies the `component` function. Every electrical symbol in the library is built on top of this function. It provides a unified structure to place, draw, label, and connect components in a flexible and composable way.

#grid(columns: (auto, 1fr), gutter: 10pt,
    ```typst
    #let component(
        uid,
        position,
        draw,
        label: none,
        variant: "iec",
        wires: true,
        scale: 1.0,
        rotate: 0deg,
        label-anchor: none,
        ..params
    ) = { ... }
    ```,
    block(fill: blue.lighten(85%), inset: 10pt, [
        This low-level function is not meant to be used directly in most cases #emoji.face.smile.sweat, but understanding it helps if you want to define your own components or customize existing ones.
    ])
)

== Simple example

To get started with Circuitor, here’s a minimal working example showing how to draw a simple circuit with just a few lines of code.

```typst
#import "@preview/circuitor:0.1.0"

#canvas({
    resistor("r1", (0,0), label: "I1", rotate: 90deg)
    isource("i1", (1.7,0), rotate: -135deg, label: "I1", rotate: 90deg)
    afuse("f2", (3.5,0), label: "F1", rotate: 90deg)
    wire("r1.out", "i1.minus")
    wire("i1.plus", "f2.in")
})
```

#canvas({
    import cetz: *

    resistor("r1", (0,0), label: "R1", rotate: -90deg)
    isource("i1", (2,0), rotate: 90deg, label: "I1")
    afuse("f2", (4,0), label: "F1", rotate: -90deg)
    wire("r1.out", "i1.minus")
    wire("i1.plus", "f2.in")
})