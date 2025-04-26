# CirCeTZ

![Latest release](https://img.shields.io/github/v/release/l0uisgrange/circetz?include_prereleases&style=flat-square&logo=typst&color=%23239dad)
![License](https://img.shields.io/github/license/l0uisgrange/circetz?style=flat-square)
![Code size](https://img.shields.io/github/languages/code-size/l0uisgrange/circetz?style=flat-square)

> [!IMPORTANT]
> This package is not available on Typst Universe for the time being. Check out the [related discussion](https://github.com/l0uisgrange/circetz/discussions/2) for the first release 🌟!

CirCeTZ is a lightweight ⚡️ typst package to draw electronic circuits. The main goal of CirCeTZ is to be intuitive.

```typst
#import "@preview/circetz:0.1.0"

#canvas({
    isource((0,1))
    isource((0,2))
    nmos((0,3))
    resistor((0,2))
    resistor((0,6))
})
```

CirCeTZ uses CeTZ to draw the circuit components. This means that you can draw CeTZ shapes directly in the same canvas, like this:

## Supported components

The `circetz` package supports 10+ electrical components 🤓, both in european (IEE) and american (ANSI) variants.

| Component       | Usage Example      | Symbol                                |
|:----------------|:-------------------|:--------------------------------------|
| Current Source  | `isource((0,0))`   | ![Current Source](assets/isource.png) |
| Voltage Source  | `vsource((0,0))`   | ![Voltage Source](assets/vsource.png) |
| Resistor        | `resistor((0,0))`  | ![Resistor](assets/resistor.png)      |
| Capacitor       | `capacitor((0,0))` | ![Capacitor](assets/resistor.png)     |
| Inductor        | `inductor((0,0))`  | ![Inductor](assets/inductor.png)      |
| Motor           | `motor((0,0))`     | ![Motor](assets/inductor.png)         |
| NPN Transistor  | `npn((0,0))`       | ![NPN](assets/nmos.png)               |
| PNP Transistor  | `pnp((0,0))`       | ![PNP](assets/pmos.png)               |
| NMOS Transistor | `nmos((0,0))`      | ![NMOS](assets/nmos.png)              |
| PMOS Transistor | `pmos((0,0))`      | ![PMOS](assets/pmos.png)              |

### Variants

Every component is available as american 🇺🇸 (ANSI) or european 🇪🇺 (IEEE). For example, the resistor looks like

```typst
resistor((0,0), variant: "american")
```

![Resistor](assets/resistor.png)

```typst
resistor((0,0), variant: "european")
```

![Resistor](assets/resistor.png)

## Contributing

We highly welcome contributions 🌱! Developing a package like this involves significant effort. Please check out the dedicated [contribution guidelines] to get started 🤩!