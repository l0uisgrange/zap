#import "../../src/exports.typ": *

= Components

Circuitor provides a wide set of predefined components based on IEC and IEEE standards #emoji.clip. These include resistors, capacitors, voltage sources, switches, diodes, transistors and more. Each component is built on top of the core `component` function and is ready to use with sensible defaults #box(emoji.gear, height: 9pt).

== Resistors

#grid(
    columns: (auto, auto, 1fr),
    gutter: 10pt,
    ```typst
    #let resistor(
        uid,
        position,
        adjustable: false,
        movable: false,
        ..params
    ) = { ... }
    ```,
    table(
        columns: 2,
        stroke: .6pt + luma(60%),
        "IEC", "IEEE",
        [
            #canvas({
                resistor("r1", (0,0), rotate: 90deg)
            })
        ],
        [
            #canvas({
                resistor("r1", (0,0), rotate: 90deg, variant: "ieee")
            })
        ]
    ),
    table(
         columns: 2,
         stroke: .6pt + luma(60%),
         `adjustable`, `movable`,
         [
             #canvas({
                 resistor("r1", (0,0), rotate: 90deg, adjustable: true)
             })
         ],
         [
             #canvas({
                 resistor("r1", (0,0), rotate: 90deg, movable: true)
             })
         ]
     )
)

Available shortcuts: `potentiometer` for `adjustable: true`

== Capacitors

#grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    ```typst
    #let capacitor(
        uid,
        position,
        adjustable: false,
        ..params
    ) = { ... }
    ```,
    table(
        columns: 2,
        stroke: .6pt + luma(60%),
        "IEC", "IEEE",
        [
            #canvas({
                capacitor("r1", (0,0), rotate: 90deg)
            })
        ],
        [
            #canvas({
                capacitor("r1", (0,0), rotate: -90deg, variant: "ieee")
            })
        ]
    )
)

== Inductors

#grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    ```typst
    #let inductor(
        uid,
        position,
        ..params
    ) = { ... }
    ```,
    table(
        columns: 2,
        stroke: .6pt + luma(60%),
        "IEC", "IEEE",
        [
            #canvas({
                inductor("r1", (0,0), rotate: 90deg)
            })
        ],
        [
            #canvas({
                inductor("r1", (0,0), rotate: -90deg, variant: "ieee")
            })
        ]
    )
)

== Voltage sources

#grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    ```typst
    #let vsource(
        uid,
        position,
        ..params
    ) = { ... }
    ```,
    table(
        columns: 2,
        stroke: .6pt + luma(60%),
        "IEC", "IEEE",
        [
            #canvas({
                vsource("r1", (0,0), rotate: 90deg)
            })
        ],
        [
            #canvas({
                vsource("r1", (0,0), rotate: 90deg, variant: "ieee")
            })
        ]
    )
)

== Current sources

#grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    ```typst
    #let isource(
        uid,
        position,
        ..params
    ) = { ... }
    ```,
    table(
        columns: 2,
        stroke: .6pt + luma(60%),
        "IEC", "IEEE",
        [
            #canvas({
                isource("r1", (0,0), rotate: 90deg)
            })
        ],
        [
            #canvas({
                isource("r1", (0,0), rotate: 90deg, variant: "ieee")
            })
        ]
    )
)

== Motors

#grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    ```typst
    #let dcmotor(
        uid,
        position,
        ..params
    ) = { ... }
    ```,
    table(
        columns: 3,
        stroke: .6pt + luma(60%),
        "IEC", "IEEE", "Pretty",
        align: horizon,
        [
            #canvas({
                dcmotor("r1", (0,0), rotate: 90deg)
            })
        ],
        [
            #canvas({
                dcmotor("r1", (0,0), rotate: 90deg)
            })
        ],
        [
            #canvas({
                dcmotor("r1", (0,0), rotate: 90deg, variant: "pretty")
            })
        ]
    )
)

== Fuses

#grid(
    columns: (auto, auto, 1fr),
    gutter: 10pt,
    ```typst
    #let fuse(
        uid,
        position,
        asymmetric: false,
        ..params
    ) = { ... }
    ```,
    table(
        columns: 2,
        stroke: .6pt + luma(60%),
        "IEC", "IEEE",
        align: horizon,
        [
            #canvas({
                fuse("r1", (0,0), rotate: 90deg)
            })
        ],
        [
            #canvas({
                fuse("r1", (0,0), rotate: 90deg, variant: "ieee")
            })
        ]
    ),
    table(
         columns: 1,
         stroke: .6pt + luma(60%),
         `asymmetric`,
         [
             #canvas({
                 fuse("r1", (0,0), rotate: 90deg, asymmetric: true)
             })
         ]
     )
)

Available shortcuts: `afuse` for `asymmetric: true`

== Bipolar junction transistors (BJTs)

#grid(
    columns: (auto, auto, 1fr),
    gutter: 10pt,
    ```typst
    #let bjt(
        uid,
        position,
        polarisation: "npn",
        envelope: false
        ..params
    ) = { ... }
    ```,
    table(
        columns: 2,
        stroke: .6pt + luma(60%),
        "IEC", "IEEE",
        align: horizon,
        [
            #canvas({
                bjt("r1", (0,0), rotate: -90deg)
            })
        ],
        [
            #canvas({
                bjt("r1", (0,0), rotate: -90deg, variant: "ieee")
            })
        ]
    ),
    table(
         columns: 1,
         stroke: .6pt + luma(60%),
         `envelope`,
         [
             #canvas({
                 bjt("r1", (0,0), rotate: -90deg, envelope: true)
             })
         ]
     )
)

Available shortcuts: `npn` for `polarisation: npn`, `pnp` for `polarisation: pnp`

== MOSFETs

#grid(
    columns: (auto, auto, 1fr),
    gutter: 10pt,
    ```typst
    #let mosfet(
        uid,
        position,
        channel: "n",
        envelope: false,
        gates: 1,
        mode: "enhancement",
        substrate: "internal"
        ..params
    ) = { ... }
    ```,
    table(
        columns: 2,
        stroke: .6pt + luma(60%),
        "IEC", "IEEE",
        align: horizon,
        [
            #canvas({
                mosfet("r1", (0,0), rotate: -90deg)
            })
        ],
        [
            #canvas({
                mosfet("r1", (0,0), rotate: -90deg, variant: "ieee")
            })
        ]
    ),
    table(
         columns: 2,
         stroke: .6pt + luma(60%),
         `mode`, `channel`,
         canvas({
             mosfet("m1", (0,0), rotate: -90deg, mode: "depletion", variant: "ieee")
         }),
         canvas({
             mosfet("m1", (0,0), rotate: -90deg, channel: "p", variant: "ieee")
         }),
     )
)

Available shortcuts: `pmos` for `channel: p`, `nmos` for `channel: n`

== Custom components

Circuitor is not limited to the built-in components, you can also create your own #emoji.pencil.

At the core of every element is the `component` function, which gives you full control over the drawing logic, positioning, orientation, labeling, and wiring behavior. To define a custom component, simply write your own drawing function and pass it to `component`, along with metadata like position and UID.

```typst
#let mycustomcomponent(uid, position, ..params) = {
    // Drawing function
    let draw(variant, scale, rotate, wires, ..styling) = {
        rect((-1,-1), (0,0))
    }
    // Low-level component call
    component(uid, position, draw, ..params)
}
```

#block(fill: purple.lighten(85%), inset: 10pt, [
    If you've designed a component that you're proud of #emoji.face.cool, feel free to open an issue on the #link("https://github.com/l0uigrange/issues/new", [GitHub repository]) and propose it for inclusion in a future release!
])