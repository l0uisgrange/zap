#import "./template/zap.typ"
#import "./template/utils.typ": circ, template

#set document(title: [Zap – The circuitikz Typst alternative], description: [])

#show: template

= Introduction

== About the project

I initiated Zap in 2025 during my microengineering studies at #link("https://epfl.ch/en")[EPFL] (Federal Institute of Technology, Lausanne) in Switzerland 🇨🇭. I aim to leverage my engineering background to create a tool that is both powerful and a pleasure to use.

== Philosophy

Instead of simply porting the popular `circuitikz` library to Typst, this project tries to establish *a new foundation*. Zap is built around two core principles:
1. *Keep functions clean and intuitive*. This ensures the library is easy to use, requiring minimal code while remaining highly customizable. Users can take advantage of Typst's modernity, avoiding the need to input overly complex symbols or lengthy commands.
2. *Always rely on standard-inspired symbols when possible*. This is the most significant departure from `circuitikz`, which prioritized extensive customization. With Zap, you get direct access to symbols inspired by international standards used in industry.

    Purely aesthetic symbol variations are therefore excluded, as this project is focusing on making the standard symbols visually excellent. This ensures your circuits will be understandable by anyone, anywhere. Of course, I know this might be a constraint, so Zap will always give you the freedom to create your own #link("#")[custom symbols].

== Contributors

Special thanks to all the #link("https://github.com/l0uisgrange/zap/graphs/contributors")[contributors] who bring amazing features and bug fixes.

=== How to contribute

Contributions are very welcome, and it's very easy to set up. You have a lot more information on the dedicated #link("https://github.com/l0uisgrange/zap?tab=contributing-ov-file#contributions")[contributing guidelines].

#circ[
    #zap.circuit({
        import zap: *
        zap.resistor("r1", (0, 0), (5, 0))
    })
]

= Getting started

You can start using Zap simply by adding the following import at the top of your Typst file. It will automatically install the library from Typst Universe.

```typst
#import "@preview/zap:0.4.0"

#zap.circuit({
    import zap: *

    isource("i1", (0, 0), (5, 0))
})
```

= Positioning

To position components within your circuit, you can choose to either attach them to a single node, or place them between two nodes. If you choose the latest option, wires will be automatically placed between the nodes.

#circ[
    #zap.circuit({
        import zap: *

        // using one node ...
        resistor("r1", (-2, 0))

        // ... or using two nodes
        resistor("r2", (1, 0), (4, 0))
    })
]

Note that *some components can only be placed using one node*, like operational amplifiers, grounds and transistors. You can also customize the position of the component alongside the wire using the `position` parameter like below.


#circ[
    #zap.circuit({
        import zap: *

        resistor("r1", (0, 0), (3, 0), position: 70%)
    })
]

The `position` parameter also accepts a distance, which is always relative to the `in` anchor.

=== Mirroring

If you would like to display your component upside-down (vertically and/or horizontally), it is possible to mirror it using the `scale` parameter. The second value of the `scale` array represents the axis perpendicular to the wires.

#circ[
    #zap.circuit({
        import zap: *

        nobutton("b1", (0, 0), (3, 0))
        nobutton("b2", (3, 0), (6, 0), scale: (1, -1))
    })
]

=== Named anchors

Sometimes, you just want to connect a component to another without worrying about coordinates or doing mental math. That's where named anchors come in.

The name provided as the first argument acts as an identifier for the component. If we draw a `resistor` identified as `r1`, we can attach a voltage source to its `out` anchor like below.

#circ[
    #zap.circuit({
        import zap: *

        resistor("r1", (0, 0), (3, 0))
        vsource("v1", "r1.out", (3, 3))
    })
]

A list of available named anchors for each component is available on the [component page](/docs/components/resistor). You can also activate [debugging](/docs/debug) to display the available anchors directly on your circuit.

=== Nodes

You can also use the `node` component instead of anchors. They work pretty much the same, but nodes are visible on the circuit.

#circ[
    #zap.circuit({
        import zap: *

        node("n1", (2, 0), label: "MyNode")
    })
]

It's also possible to display nodes directly when calling your components, and they will represent the `in` and `out` anchors.

#circ[
    #zap.circuit({
        import zap: *

        resistor("r1", (1, 0), (4, 0), n: "*-*")
    })
]

You can either have circles using `o` or a filled one using `*`. For example, `o-*` will have a circle on the `in` anchor and a filled circle on the `out` anchor.

=== Coordinates

Coordinates are fully managed by CeTZ, and you'll find a very extensive list of features on their #link("https://cetz-package.github.io/docs/basics/coordinate-systems")[online documentation], like relative, perpendicular and polar coordinates. Let's just have a quick look at the main features you'll use in your circuits.

=== Perpendicular

You can easily define a new coordinate with the perpendicular position between 2 other coordinates.

#circ[
    #zap.circuit({
        import zap: *

        node("n1", (3, -1), label: "A")

        // using either (A, "-|", B) or (A, "|-", B) is possible
        node("n2", ((0, 0), "-|", "n1"), label: "P")
    })
]

=== Relative coordinates

You can also define the new coordinate using a previously defined anchor.

In the example below, we want to point `r2` to the `out` anchor of `r1`, but a little bit on the right.

#circ[
    #zap.circuit({
        import zap: *

        // relative to the previous coordinate, here (1, 0)
        resistor("r1", (1, 0), (rel: (3, 0)))

        // relative to a specific coordinate
        resistor("r2", (5, -3), (rel: (1, 0), to: "r1.out"))
    })
]

= Labels

You can name your components by giving them a label using the `label` parameter.

#circ[
    #zap.circuit({
        import zap: *

        heater("h1", (1, 0), (4, 0), label: $R$)
    })
]

Sometimes, the label is not displayed where you want (like in the middle of another component). In that case, you can just give a dictionary to customize this behavior.

#circ[
    #zap.circuit({
        import zap: *

        heater("h1", (1, 0), (4, 0), label: $R$)
        heater("h2", (5, 0), (8, 0), label: (content: $R$, anchor: "south", distance: 0pt))
    })
]

= Decorations

You can add labels for current, voltage, or generic flow to components using the `i` (current), `u` (voltage), or `f` (flow) parameters. These parameters accept either a string for a simple label or a dictionary for more detailed customization.

#circ[
    #zap.circuit({
        import zap: *

        vsource("v1", (1, 0), (5, 0), u: $u_1$, i: $i_1$)
    })
]

== Current

#circ[
    #zap.circuit({
        import zap: *

        // simple current
        vsource("v1", (1, 0), (4, 0), i: $i_1$)

        // custom current (only "content" key is required)
        vsource("v1", (5, 0), (8, 0), i: (content: $i_1$, anchor: "west", invert: true, distance: 17pt, label-distance: 15pt))
    })
]

== Voltage

#circ[
    #zap.circuit({
        import zap: *

        // simple voltage
        vsource("v1", (1, 0), (4, 0), u: $u_1$)

        // custom voltage (only "content" key is required)
        vsource("v1", (5, 0), (8, 0), u: (content: $u_1$, anchor: "south-west", label-distance: 8pt, distance: 17pt))
    })
]

== Flow

#circ[
    #zap.circuit({
        import zap: *

        // simple flow
        vsource("v1", (1, 0), (4, 0), f: $f_1$)

        // custom flow (only "content" key is required)
        vsource("v1", (5, 0), (8, 0), f: (content: $f_1$, anchor: "south-west", label-distance: -20pt, distance: 17pt))
    })
]

= Annotations

As the `circuit` is just a boosted version of CeTZ' `canvas`, you can also directly draw shapes on it.

#circ[
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
]

= Styling <styling>

If you want to customize the appearance of a *single symbol* instance, rather than all, simply use the various `params` optional arguments.

#circ[
    #zap.circuit({
        import zap: *

        resistor("r1", (0, 0), (3, 0))
        resistor("r2", (3, 0), (6, 0), variant: "ieee", stroke: 1pt + red)
    })
]

== Global

If you wish to change the default appearance of *all symbols of a specific type* throughout the same circuit, Zap supports the `set-style` method from CeTZ.

#circ[
    #zap.circuit({
        import zap: *

        set-style(zap: (
            resistors: (
                stroke: red,
            ),
            heaters: (
                stroke: blue,
                fill: blue.lighten(90%),
                scale: 1.4,
            ),
        ))

        resistor("r1", (0, 0), (3, 0))
        heater("r2", (3, 0), (6, 0))
    })
]

== Standards

As industries have become more interconnected through globalization, numerous standards have emerged. Many of these have since been replaced by a smaller set of conventions that have gained wider global acceptance.

- *IEC 60617* (default) — The leading international standard, widely adopted.
- *IEEE/ANSI 315-1975* — The North-American standard for electrical and electronics symbols.
- *JIS C 0617* — The official Japanese standard, largely harmonized with the international IEC series.
- *GB/T 4728* — The official Chinese national standard, also closely aligned with IEC guidelines.

Zap currently supports either `iec` (default) or `ieee` in the `variant` styling parameter.

#circ[
    #zap.circuit({
        import zap: *

        // remember you can use global styling
        // set-style(zap: (variant: "ieee"))

        resistor("r1", (0, 0), (3, 0))
        resistor("r2", (3, 0), (6, 0), variant: "ieee")
    })
]

== Available options

The `style.typ` file #link("https://github.com/l0uisgrange/zap/blob/main/src/styles.typ")[available on GitHub] is used in the background and represents all the available customization option for each symbol.

= Wiring

You can choose between squared, zigzag or straight wires using `swire`, `zwire` or `wire`.

#circ[
    #zap.circuit({
        import zap: *

        wire((0, 0), (1, 0))
        zwire((2, 0), (4, 2), stroke: blue)
        swire((5, 2), (6, -1), stroke: red)
    })
]

== Customization

The position and axis of the wire can also be altered using the `axis` and `ratio` parameters.

#circ[
    #zap.circuit({
        import zap: *

        wire((0, 0), (1, 0)) // N/A
        zwire((2, 0), (4, 2), stroke: blue, axis: "y", ratio: 80%)
        swire((5, 2), (6, -1), stroke: red, axis: "y")
    })
]

== Anchors

- `in`: the first point
- `out`: the last point
- `p<i>`: an anchor for each given point of the wire (by index i)
- `p<i>-p<i+1>.a`: the first zigzag corner between the points i and i+1 (only for zigzag)
- `p<i>-p<i+1>.b`: the second zigzag corner between the points i and i+1 (only for zigzag)

= Microcontroller Unit

The `mcu` is the most complex component, hence this dedicated page.

#circ[
    #let pins = (
        (content: "VCC", side: "west"),
        (content: "UVCC", side: "west"),
        (content: "AVCC", side: "west"),
        (side: "west"),
        (content: "PD0", side: "west"),
        (content: "PD1", side: "west"),
        // ...
    )

    #zap.circuit({
        import zap: *

        mcu(
            "mcu",
            (3, 0),
            pins: pins, // you can also provide a number instead of a list
            label: "ESP32",
            width: 4,
            fill: purple.lighten(80%),
            stroke: none,
        )
    })
]

You have to provide either a number of pins or a complete list of dictionaries. Each pin can have these keys:

- `content` is the label of the pin displayed on the controller. If not provided, the pin is considered as a gap instead of an actual pin.
- `side` represents the position of the pin on the microcontroller

