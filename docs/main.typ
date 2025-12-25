#import "/docs/template/zap.typ"
#import "/docs/template/utils.typ": circ, info, template, warning

#set document(title: [Zap – The circuitikz Typst alternative], description: [])

#show: template

= Introduction <introduction>

== About the project <about>

I initiated Zap in 2025 during my microengineering studies at #link("https://epfl.ch/en")[EPFL] (Federal Institute of Technology, Lausanne) in Switzerland 🇨🇭. I aim to leverage my engineering background to create a tool that is both powerful and a pleasure to use.

== Philosophy <philosophy>

Instead of simply porting the popular `circuitikz` library to Typst, this project tries to establish *a new foundation*. Zap is built around two core principles:
1. *Keep functions clean and intuitive*. This ensures the library is easy to use, requiring minimal code while remaining highly customizable. Users can take advantage of Typst's modernity, avoiding the need to input overly complex symbols or lengthy commands.
2. *Always rely on standard-inspired symbols when possible*. This is the most significant departure from `circuitikz`, which prioritized extensive customization. With Zap, you get direct access to symbols inspired by international standards used in industry.

    Purely aesthetic symbol variations are therefore excluded, as this project is focusing on making the standard symbols visually excellent. This ensures your circuits will be understandable by anyone, anywhere. Of course, I know this might be a constraint, so Zap will always give you the freedom to create your own #link("#custom-symbols")[custom symbols].

== Contributors <contributors>

Special thanks to all the #link("https://github.com/l0uisgrange/zap/graphs/contributors")[contributors] who bring amazing features and bug fixes.

#info(
    title: "How to contribute?",
)[Contributions are very welcome, and it's very easy to set up. You can find more information on how to start on the dedicated #link("https://github.com/l0uisgrange/zap?tab=contributing-ov-file#contributions")[contributing guidelines].]

= Getting started <getting-started>

After this quick introduction, let's get started! You can start using Zap simply by adding the following import at the top of your Typst file. It will automatically install the library from Typst Universe.

```typst
#import "@preview/zap:0.5.0"

#zap.circuit({
    import zap: *

    isource("i1", (0, 0), (5, 0))
})
```

= Positioning <positioning>

The most important part of this library is to know how to position your symbols within your circuit, as it can make your experience a lot more pleasant.

You can choose to either attach your symbols to a single node, or place them between two nodes. If you choose the latest option, wires will be automatically placed between the nodes, like below.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        // using one node ...
        resistor("r1", (-2, 0))

        // ... or using two nodes
        resistor("r2", (1, 0), (4, 0))
    })
    ```,
)

#warning[Note that *some symbols can only be placed using one node*, like operational amplifiers, grounds and transistors.]

You can also customize the position of the symbol alongside the wire using the `position` parameter like below.


#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        resistor("r1", (0, 0), (3, 0), position: 70%)
    })
    ```,
)

The `position` parameter also accepts a distance, which is always relative to the `in` anchor.

=== Mirroring or flipping <mirroring>

If you would like to display your component upside-down (vertically and/or horizontally), it is possible to mirror it using the `scale` parameter.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        nobutton("b1", (0, 0), (3, 0))
        nobutton("b2", (3, 0), (6, 0), scale: (y: -1))
    })
    ```,
)

=== Named anchors <named-anchors>

Sometimes, you just want to connect one symbol to another without worrying about coordinates or doing mental math. That's where named anchors come in.

The name provided as the first argument acts as an identifier for the symbol. If we draw a `resistor` identified as `r1`, we can attach a voltage source to its `out` anchor like below.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        resistor("r1", (0, 0), (3, 0))
        vsource("v1", "r1.out", (3, 3))
    })
    ```,
)

A list of available named anchors is available on each #link(<resistor>)[symbols]. You can also activate #link(<debug>)[debugging] to display the available anchors directly on your circuit.

=== Nodes <nodes>

You can also use the `node` symbol instead of anchors. They work pretty much the same, but nodes are visible on the circuit.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        node("n1", (0, 0), label: "MyNode")
    })
    ```,
)

It's also possible to display nodes directly when calling your symbol, and they will represent the `in` and `out` anchors.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        resistor("r1", (1, 0), (4, 0), n: "*-*")
    })
    ```,
)

You can either have circles using `o` or a filled one using `*`. For example, `o-*` will have a circle on the `in` anchor and a filled circle on the `out` anchor.

== Coordinates <coordinates>

Coordinates are fully managed by CeTZ, and you'll find a very extensive list of features on their #link("https://cetz-package.github.io/docs/basics/coordinate-systems")[online documentation], like relative, perpendicular and polar coordinates. Let's just have a quick look at the main features you'll use in your circuits.

=== Perpendicular <perpendicular-coordinates>

You can easily define a new coordinate with the perpendicular position between 2 other coordinates.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        node("n0", (0, 0), label: "O")
        node("n1", (3, -1), label: "A")

        // using either (A, "-|", B) or (A, "|-", B) is possible
        node("n2", ((0, 0), "-|", "n1"), label: "P")
    })
    ```,
)

=== Relative coordinates <relative-coordinates>

You can also define the new coordinate using a previously defined anchor.

In the example below, we want to point `r2` to the `out` anchor of `r1`, but a little bit on the right.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        // relative to the previous coordinate, here (1, 0)
        resistor("r1", (1, 0), (rel: (3, 0)))

        // relative to a specific coordinate
        resistor("r2", (5, -3), (rel: (1, 0), to: "r1.out"))
    })
    ```,
)

= Labels <labels>

You can name your symbols by giving them a label using the `label` parameter.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        heater("h1", (1, 0), (4, 0), label: $R$)
    })
    ```,
)

Sometimes, the label is not displayed where you want (like in the middle of another symbol). In that case, you can just give a dictionary to customize this behavior.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        heater("h1", (1, 0), (4, 0), label: $R$)
        heater("h2", (5, 0), (8, 0), label: (content: $R$, anchor: "south", distance: 0pt))
    })
    ```,
)

= Decorations <decorations>

You can add labels for current, voltage, or generic flow to your symbols using the `i` (current), `u` (voltage), or `f` (flow) parameters, which accept either a string for a simple label or a dictionary for more detailed customization.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        vsource("v1", (1, 0), (5, 0), u: $u_1$, i: $i_1$)
    })
    ```,
)

== Current <current>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        // simple current
        vsource("v1", (1, 0), (4, 0), i: $i_1$)

        // custom current (only "content" key is required)
        vsource("v1", (5, 0), (8, 0), i: (content: $i_1$, anchor: "west", invert: true, distance: 17pt, label-distance: 15pt))
    })
    ```,
)

== Voltage <voltage>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        // simple voltage
        vsource("v1", (1, 0), (4, 0), u: $u_1$)

        // custom voltage (only "content" key is required)
        vsource("v1", (5, 0), (8, 0), u: (content: $u_1$, anchor: "south-west", label-distance: 8pt, distance: 17pt))
    })
    ```,
)

== Flow <flow>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        // simple flow
        vsource("v1", (1, 0), (4, 0), f: $f_1$)

        // custom flow (only "content" key is required)
        vsource("v1", (5, 0), (8, 0), f: (content: $f_1$, anchor: "south-west", label-distance: -20pt, distance: 17pt))
    })
    ```,
)

= Annotations <annotations>

As the `circuit` is just a boosted version of CeTZ' `canvas`, you can also directly draw shapes on it.

#circ(
    ```typst
    #import "./zap.typ"

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
    ```,
)

== Stubs <stubs>

Sometimes, you'll just want to add a small wire with a label to show an entry point. Stubs do just that, in any *vertical or horizontal* direction you want.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        mcu("m1", (0, 0), pins: 10, label: "ESP32", fill: green.lighten(80%), stroke: none)
        wstub("m1.pin2", label: "PORTB2") // or stub(..., dir: "west")
        estub("m1.pin6", label: "PORTC2")
        estub("m1.pin9", label: "PORTD5", length: 0.5)
    })
    ```,
)

To simplify your code, you can use `nstub`, `sstub`, `estub`, and `wstub` for quick directions.

= Styling <styling>

If you want to customize the appearance of a *single symbol* instance, rather than all, simply use the various `params` optional arguments.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        resistor("r1", (0, 0), (3, 0))
        resistor("r2", (3, 0), (6, 0), variant: "ieee", stroke: 1pt + red)
    })
    ```,
)

#info[As the list of available styles for each component is too long, it is only available in the #link("https://github.com/l0uisgrange/zap/blob/main/src/styles.typ")[source code].]

== Global <styling-global>

If you wish to change the default appearance of *all symbols of a specific type* throughout the same circuit, Zap supports the `set-style` method from CeTZ.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        set-style(resistor: (stroke: red, scale: (x: 0.5, y: 1.5)))

        resistor("r1", (0, 0), (3, 0))
        heater("r2", (3, 0), (6, 0))
    })
    ```,
)

== Standards <standards>

As industries have become more interconnected through globalization, numerous standards have emerged. Many of these have since been replaced by a smaller set of conventions that have gained wider global acceptance.

- *IEC 60617* (default) — The leading international standard, widely adopted.
- *IEEE/ANSI 315-1975* — The North-American standard for electrical and electronics symbols.
- *JIS C 0617* — The official Japanese standard, largely harmonized with the international IEC series.
- *GB/T 4728* — The official Chinese national standard, also closely aligned with IEC guidelines.

Zap currently supports either `iec` (default) or `ieee` in the `variant` styling parameter.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        // remember you can use global styling
        // set-style(variant: "ieee")

        resistor("r1", (0, 0), (3, 0))
        resistor("r2", (3, 0), (6, 0), variant: "ieee")
    })
    ```,
)

= Wiring <wiring>

You can choose between squared, zigzag or straight wires using `swire`, `zwire` or `wire`.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        wire((0, 0), (1, 0))
        zwire((2, 0), (4, 2), stroke: blue)
        swire((5, 2), (6, -1), stroke: red)
    })
    ```,
)

== Customization

The position and axis of the wire can also be altered using the `axis` and `ratio` parameters.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        wire((0, 0), (1, 0)) // N/A
        zwire((2, 0), (4, 2), stroke: blue, axis: "y", ratio: 80%)
        swire((5, 2), (6, -1), stroke: red, axis: "y")
    })
    ```,
)

== Anchors

- `in`: the first point
- `out`: the last point
- `p<i>`: an anchor for each given point of the wire (by index i)
- `p<i>-p<i+1>.a`: the first zigzag corner between the points i and i+1 (only for zigzag)
- `p<i>-p<i+1>.b`: the second zigzag corner between the points i and i+1 (only for zigzag)

= Debug <debug>

If you want to know all the anchors available in a symbol, you can either activate the `debug` mode on a single symbol...

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        resistor("r1", (0, 0), (3, 0), debug: true)
    })
    ```,
)

...or on the whole circuit.

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit(debug: true, {
        import zap: *

        resistor("r1", (0, 0), (3, 0))
    })
    ```,
)

= Available symbols <symbols>

As there is a lot of symbols available in Zap, they have been grouped by their original version. If you're not finding yours here, and think it should be included in the library, please #link("https://github.com/l0uisgrange/zap/issues/new?template=feature_request.yml")[open an issue].

== Resistor <resistor>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        resistor("r1", (0, 0), (3, 0))
        resistor("r2", (4, 0), (7, 0), variant: "ieee")
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // heatable
    `heatable`,
    `false`,
    `heater`,
    html.frame(
        zap.circuit({
            import zap: *

            resistor("r1", (0, 0), (3, 0), heatable: true)
        }),
    ),
    // adjustable
    `adjustable`,
    `false`,
    `potentiometer`,
    html.frame(
        zap.circuit({
            import zap: *

            resistor("r1", (0, 0), (3, 0), adjustable: true)
        }),
    ),
    // variable
    `variable`,
    `false`,
    `rheostat`,
    html.frame(
        zap.circuit({
            import zap: *

            resistor("r1", (0, 0), (3, 0), variable: true)
        }),
    ),
    // sensor
    `sensor`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            resistor("r1", (0, 0), (3, 0), sensor: true)
        }),
    ),
    // preset
    `preset`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            resistor("r1", (0, 0), (3, 0), preset: true)
        }),
    ),
)

== Inductor <inductor>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        inductor("i1", (0, 0), (3, 0))
        inductor("i2", (4, 0), (7, 0), variant: "ieee")
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // variable
    `variable`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            inductor("i1", (0, 0), (3, 0), variable: true)
        }),
    ),
    // preset
    `preset`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            inductor("i1", (0, 0), (3, 0), preset: true)
        }),
    ),
    // sensor
    `sensor`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            inductor("i1", (0, 0), (3, 0), sensor: true)
        }),
    ),
)

== Capacitor <capacitor>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        capacitor("c1", (0, 0), (3, 0))
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // variable
    `variable`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            capacitor("c1", (0, 0), (3, 0), variable: true)
        }),
    ),
    // preset
    `preset`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            capacitor("c1", (0, 0), (3, 0), preset: true)
        }),
    ),
    // sensor
    `sensor`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            capacitor("c1", (0, 0), (3, 0), sensor: true)
        }),
    ),
    // polarized
    `polarized`,
    `false`,
    `pcapacitor`,
    html.frame(
        zap.circuit({
            import zap: *

            capacitor("c1", (0, 0), (3, 0), polarized: true)
        }),
    ),
)

== Button <button>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        button("b1", (0, 0), (3, 0))
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // nc
    `nc`,
    `false`,
    `ncbutton`,
    html.frame(
        zap.circuit({
            import zap: *

            button("b1", (0, 0), (3, 0), nc: true)
        }),
    ),
    // illuminated
    `illuminated`,
    `false`,
    `noibutton`,
    html.frame(
        zap.circuit({
            import zap: *

            button("b1", (0, 0), (3, 0), illuminated: true)
        }),
    ),
    // head
    `head`,
    `"standard"`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            button("b1", (0, 0), (3, 0), head: "mushroom")
        }),
    ),
    // latching
    `latching`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            button("b1", (0, 0), (3, 0), latching: true)
        }),
    ),
)

== Voltage source <vsource>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        vsource("b1", (0, 0), (3, 0))
        vsource("b2", (4, 0), (7, 0), variant: "ieee")
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // dependent
    `dependent`,
    `false`,
    `dvsource`,
    html.frame(
        zap.circuit({
            import zap: *

            vsource("b1", (0, 0), (3, 0), dependent: true)
        }),
    ),
    // current
    `current`,
    `"dc"`,
    `acvsource`,
    html.frame(
        zap.circuit({
            import zap: *

            vsource("b1", (0, 0), (3, 0), current: "ac")
        }),
    ),
)

== Current source <isource>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        isource("b1", (0, 0), (3, 0))
        isource("b2", (4, 0), (7, 0), variant: "ieee")
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // dependent
    `dependent`,
    `false`,
    `disource`,
    html.frame(
        zap.circuit({
            import zap: *

            isource("b1", (0, 0), (3, 0), dependent: true)
        }),
    ),
)

== Diode <diode>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        diode("b1", (0, 0), (3, 0))
    })
    ```,
)

==== Types

The `diode` symbol accepts only one parameter, called `type`, and its appearance changes a lot depending on the value.

#table(
    columns: (auto, auto, auto),
    align: left + top,
    table.header([*Value*], [*Alias*], [*Image*]),
    // zener
    `zener`,
    `zener`,
    html.frame(
        zap.circuit({
            import zap: *

            zener("b1", (0, 0), (3, 0))
        }),
    ),
    // tunnel
    `tunnel`,
    `tunnel`,
    html.frame(
        zap.circuit({
            import zap: *

            tunnel("b1", (0, 0), (3, 0))
        }),
    ),
    // schottky
    `schottky`,
    `schottky`,
    html.frame(
        zap.circuit({
            import zap: *

            schottky("b1", (0, 0), (3, 0))
        }),
    ),
    // led
    `emitting`,
    `led`,
    html.frame(
        zap.circuit({
            import zap: *

            led("b1", (0, 0), (3, 0))
        }),
    ),
    // recieving
    `recieving`,
    `photodiode`,
    html.frame(
        zap.circuit({
            import zap: *

            photodiode("b1", (0, 0), (3, 0))
        }),
    ),
)

== Supply <supply>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        wire((0, 0), (8, 0))
        vcc("s1", (0, 0))
        vee("s2", (2, 0))
        earth("s3", (4, 0))
        frame("s4", (6, 0))
        ground("s5", (8, 0))
    })
    ```,
)

== Fuse <fuse>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        fuse("f1", (0, 0), (3, 0))
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // dependent
    `asymmetric`,
    `false`,
    `afuse`,
    html.frame(
        zap.circuit({
            import zap: *

            fuse("b1", (0, 0), (3, 0), asymmetric: true)
        }),
    ),
)

== Operational amplifier <opamp>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        opamp("o1", (0, 0))
        opamp("o2", (3, 0), variant: "ieee")
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // dependent
    `invert`,
    `false`,
    `iopamp`,
    html.frame(
        zap.circuit({
            import zap: *

            opamp("o1", (0, 0), invert: true)
        }),
    ),
)

== Converter <converter>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        adc("c1", (0, 0), (3, 0))
        dac("c2", (4, 0), (7, 0))
    })
    ```,
)

== BJT transistors <bjt>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        bjt("t1", (0, 0))
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Type*], [*Alias*], [*Image*]),
    // polarisation
    `polarisation`,
    `"npn"`,
    [`"npn"` / `"pnp"`],
    [`npn` / `pnp`],
    html.frame(
        zap.circuit({
            import zap: *

            bjt("t1", (0, 0), polarisation: "pnp")
        }),
    ),
    // envelope
    `envelope`,
    `false`,
    `bool`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            bjt("t1", (0, 0), envelope: true)
        }),
    ),
)

== MOSFET transistors <mosfet>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        mosfet("t1", (0, 0))
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Type*], [*Alias*], [*Image*]),
    // dependent
    `channel`,
    `"n"`,
    [`"n"` / `"p"`],
    [`pmos` / `nmos`],
    html.frame(
        zap.circuit({
            import zap: *

            mosfet("t1", (0, 0), channel: "p")
        }),
    ),
    // envelope
    `envelope`,
    `false`,
    [`bool`],
    none,
    html.frame(
        zap.circuit({
            import zap: *

            mosfet("t1", (0, 0), envelope: true)
        }),
    ),
    // mode
    `mode`,
    `"enhancement"`,
    [`"enhancement"` / `"depletion"`],
    [`nmosd` / `pmosd`],
    html.frame(
        zap.circuit({
            import zap: *

            mosfet("t1", (0, 0), mode: "depletion")
        }),
    ),
    // bulk
    `bulk`,
    `"internal"`,
    [`"internal"` / `"external"` / `none`],
    none,
    html.frame(
        zap.circuit({
            import zap: *

            mosfet("t1", (0, 0), bulk: none)
        }),
    ),
)

== Transformer <transformer>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        transformer("t1", (0, 0), (3, 0))
    })
    ```,
)

== Instruments <instruments>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        voltmeter("i1", (0, 0), (3, 0))
        ammeter("i2", (4, 0), (7, 0))
        ohmmeter("i3", (8, 0), (11, 0))
        wattmeter("i4", (12, 0), (15, 0))
    })
    ```,
)

== Switch <switch>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        switch("s1", (0, 0), (3, 0))
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // closed
    `closed`,
    `false`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            switch("s1", (0, 0), (3, 0), closed: true)
        }),
    ),
)

== Antenna <antenna>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        wire((0, 0), (2, 0))
        antenna("a1", (1, 0))
    })
    ```,
)

== Circulator <circulator>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        circulator("c1", (0, 0), (3, 0))
    })
    ```,
)

== Logic <logic>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        lnot("l1", (0, 0))
        land("l2", (2, 0))
        lor("l3", (4, 0))
        lxor("l4", (6, 0))
    })
    ```,
)

==== Options

#table(
    columns: (auto, auto, auto, auto),
    align: left + top,
    table.header([*Name*], [*Default value*], [*Alias*], [*Image*]),
    // dependent
    `invert`,
    `false`,
    [`lnand` / `lnor` / `lxnor`],
    html.frame(
        zap.circuit({
            import zap: *

            land("b1", (0, 0), invert: true)
        }),
    ),
    // inputs
    `inputs`,
    `2`,
    none,
    html.frame(
        zap.circuit({
            import zap: *

            land("b1", (0, 0), inputs: 5)
        }),
    ),
)

#info(
    title: [Inputs],
)[When setting a number of inputs, each input will be available at `inX` anchor. For example, for three inputs you will have access to `l1.in1`, `l1.in2` and `l1.in3`.]

== Microcontrolling unit <mcu>

#circ(
    ```typst
    #import "./zap.typ"

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

        mcu("mcu", (3, 0), pins: pins)
    })
    ```,
)

You have to provide either a number of pins or a complete list of dictionaries. Each pin can have these keys:

- `content` is the label of the pin displayed on the controller. If not provided, the pin is considered as a gap instead of an actual pin.
- `side` represents the position of the pin on the microcontroller. It is only possible to represent `west` and `east` labels for now, but support for more positions is planned.

== Flipflop <flipflop>

#circ(
    ```typst
    #import "./zap.typ"

    #zap.circuit({
        import zap: *

        flipflop("f1", (0, 0))
        dflipflop("f2", (3, 0))
        jkflipflop("f3", (6, 0))
    })
    ```,
)

= Custom Symbols <custom-symbols>
Zap will take care of styles, positioning and anchors for you. All you need to do is draw the symbol. The symbol in the example below is just a rectangle, you can use it as a starting point to draw your own symbols.

#circ(
    ```typst
    #import "./zap.typ" as zap: component, interface, cetz, set-style

    #let custom(name, ..params) = {
        let const = (w:2, h:1)

        let draw(ctx, position, style) = {
            interface(
                (-const.w / 2, -const.h / 2),
                (const.w / 2, const.h / 2),
                io: position.len() < 2
            )

            // draw your symbol here with cetz and zap...

            // pass style to entire scope: `cetz.draw.set-style(..style)`
            // or just a single item:
            cetz.draw.rect("bounds.north-east", "bounds.south-west", ..style)
        }
        component("my-custom-component", name, draw: draw, ..params)
    }

    #zap.circuit({
        custom("c1", (0, 0), (5, 0))
    })
    ```,
)
