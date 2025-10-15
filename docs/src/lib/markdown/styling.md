---
title: Styling
subtitle: Zap allows you to style most electrical components using optional arguments passed during their declaration or simple global settings.
---

## Inline

If you want to customize the appearance of a **single symbol** instance, rather than all, simply use the various `params` optional arguments.

![st](/docs/style-params.svg)

```typst
#zap.circuit({
    import zap: *

    resistor("r1", (0, 0), (3, 0))
    resistor("r2", (3, 0), (6, 0), variant: "ieee", stroke: 1pt + red)
})
```

## Global

If you wish to change the default appearance of **all symbols of a specific type** throughout the same circuit, Zap supports the `set-style` method from CeTZ.

![st](/docs/style.svg)

```typst
#zap.circuit({
    import zap: *

    set-style(zap: (
        resistors: (
            stroke: red
        ),
        heaters: (
            stroke: blue,
            fill: blue.lighten(90%),
            scale: 1.4
        )
    ))

    resistor("r1", (0, 0), (3, 0))
    heater("r2", (3, 0), (6, 0))
})
```

## Standards

As industries have become more interconnected through globalization, numerous standards have emerged. Many of these have since been replaced by a smaller set of conventions that have gained wider global acceptance.

- **IEC 60617** (default) — The leading international standard, widely adopted.
- **IEEE/ANSI 315-1975** — The North-American standard for electrical and electronics symbols.
- **JIS C 0617** — The official Japanese standard, largely harmonized with the international IEC series.
- **GB/T 4728** — The official Chinese national standard, also closely aligned with IEC guidelines.

Zap currently supports either `iec` (default) or `ieee` in the `variant` styling parameter.

![st](/docs/standards.svg)

```typst
#zap.circuit({
    import zap: *

    // remember you can use global styling
    // set-style(zap: (variant: "ieee"))

    resistor("r1", (0, 0), (3, 0))
    resistor("r2", (3, 0), (6, 0), variant: "ieee")
})
```

## Available options

The following constant is used in the background and represents all the available customization option for each symbol.

```typst
#let default = (
    style: (
        variant: "iec",
        scale: (x: 1.0, y: 1.0),
        stroke: (thickness: .8pt, paint: black),
        label: (
            scale: auto,
            content: none,
            distance: 7pt,
            anchor: "north",
        ),
        node: (
            radius: .05,
            stroke: (thickness: .4pt, paint: black),
            fill: black,
            nofill: white,
        ),
        wire: (
            stroke: (thickness: .5pt, paint: black),
        ),
        arrow: (
            variant: "default",
            scale: 1.0,
            stroke: (thickness: 1pt, paint: black),
            variable: (
                length: 40pt,
                angle: 55deg,
                ratio: (0.5, 0.5),
            ),
            radiation: (
                scale: 0.8,
                stroke: (thickness: .55pt, paint: black),
                distance: 3pt,
                length: 12pt,
                angle: -120deg,
                reversed: false,
            ),
            adjustable: (
                length: 0.8,
            ),
        ),
        debug: (
            radius: .7pt,
            stroke: (
                thickness: .2pt,
                paint: red,
            ),
            angle: -30deg,
            shift: 3pt,
            inset: 1pt,
            font: 3pt,
            fill: red,
        ),

        // Components
        capacitor: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: .8,
            distance: .25,
            radius: 0.6,
            angle: 40deg,
        ),
        diode: (
            variant: auto,
            scale: auto,
            stroke: auto,
            radius: .3,
            width: .25,
            tunnel-length: .11,
        ),
        opamp: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: 1.8,
            height: 1.75,
            padding: .28,
            sign-stroke: .55pt,
            sign-size: .14,
            sign-delta: .45,
        ),
        switch: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: .8,
            angle: 35deg,
        ),
        fuse: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: .88,
            height: .88 / 2.4,
            asymmetry: 25%,
        ),
        ground: (
            variant: auto,
            scale: auto,
            stroke: auto,
            radius: 0.22,
            distance: 0.28,
        ),
        frame: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: 0.46,
            angle: 20deg,
            depth: 0.25,
            distance: 0.28,
        ),
        earth: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: .53,
            delta: .09,
            spacing: .11,
            distance: .28,
        ),
        vcc: (
            variant: auto,
            scale: auto,
            stroke: auto,
            angle: 35deg,
            radius: .4,
            distance: .6,
        ),
        vee: (
            variant: auto,
            scale: auto,
            stroke: auto,
            angle: 35deg,
            radius: .4,
            distance: .6,
        ),
        inductor: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: 1.41,
            height: 1.41 / 3,
            bumps: 3,
        ),
        resistor: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: 1.41,
            height: .47,
            zigs: 3,
        ),
        vsource: (
            variant: auto,
            scale: auto,
            stroke: auto,
            radius: .53,
            padding: .25,
            sign-stroke: .55pt,
            sign-size: .14,
            sign-delta: .07,
        ),
        isource: (
            variant: auto,
            scale: auto,
            stroke: auto,
            radius: .53,
            padding: .25,
            arrow-scale: 1,
        ),
        acmotor: (
            variant: auto,
            scale: auto,
            stroke: auto,
            radius: .49,
            magnet-width: 1.23,
            magnet-height: 1.23 / 4,
        ),
        dcmotor: (
            variant: auto,
            scale: auto,
            stroke: auto,
            radius: .49,
            magnet-width: 1.23,
            magnet-height: 1.23 / 4,
        ),
        bjt: (
            variant: auto,
            scale: auto,
            stroke: auto,
            radius: .65,
            base-height: .6,
            base-distance: .12,
            aperture: 50deg,
        ),
        mosfet: (
            variant: auto,
            scale: auto,
            stroke: auto,
            height: 0.795,
            width: 1.065,
            base-width: 1.35,
            base-spacing: 0.165,
            base-distance: 0.165,
            radius: 1.05,
        ),
        antenna: (
            variant: auto,
            scale: auto,
            stroke: auto,
            distance: 0.8,
            spacing: 0.35,
            length: 0.5,
        ),
        transformer: (
            variant: auto,
            scale: auto,
            stroke: auto,
            radius: 0.35,
            distance: 0.45,
        ),
        converter: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: 1.7,
            height: 0.7,
            arrow-width: 0.4,
            label: (
                align: "center",
            ),
        ),
        mcu: (
            variant: auto,
            scale: auto,
            stroke: auto,
            width: 3,
            min-height: 1,
            padding: 0.2,
            spacing: 0.4,
        ),
    ),
    params: (
        debug: false,
    ),
)

```
