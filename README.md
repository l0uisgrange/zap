# circuitor

![Latest release](https://img.shields.io/github/v/release/l0uisgrange/circuitor?include_prereleases&style=flat-square&logo=typst&color=%23239dad)
![License](https://img.shields.io/github/license/l0uisgrange/circuitor?style=flat-square)
![Code size](https://img.shields.io/github/languages/code-size/l0uisgrange/circuitor?style=flat-square)

> [!IMPORTANT]
> This package is not available on Typst Universe for the time being. Check out the [related discussion](https://github.com/l0uisgrange/circuitor/discussions/2) for the first release 🌟!

Circuitor is a lightweight ⚡️ typst package to draw electronic circuits. The main goal of `circuitor` is to be intuitive.

```typst
#import "@preview/circuitor:0.1.0"

#canvas({
    isource("isource", (0,0))
    wire("isource.plus", "resistor.in")
    resistor("resistor", (3,0))
    wire("resistor.out", "isource.minus")
})
```

Circuitor uses CeTZ to draw the circuit components. This means that you can draw CeTZ shapes directly in the same canvas.

## Supported Components

The `circuitor` package supports many electrical components 🤓, both in european (IEE) and american (ANSI) variants.

| Name            | Declaration           | Symbol                                |
|:----------------|:----------------------|:--------------------------------------|
| Current Source  | `isource(..params)`   | ![Current Source](assets/isource.png) |
| Voltage Source  | `vsource(..params)`   | ![Voltage Source](assets/vsource.png) |
| Resistor        | `resistor(..params)`  | ![Resistor](assets/resistor.png)      |
| Capacitor       | `capacitor(..params)` | ![Capacitor](assets/resistor.png)     |
| Inductor        | `inductor(..params)`  | ![Inductor](assets/inductor.png)      |
| Motor           | `motor(..params)`     | ![Motor](assets/inductor.png)         |
| NPN Transistor  | `npn(..params)`       | ![NPN](assets/nmos.png)               |
| PNP Transistor  | `pnp(..params)`       | ![PNP](assets/pmos.png)               |
| NMOS Transistor | `nmos(..params)`      | ![NMOS](assets/nmos.png)              |
| PMOS Transistor | `pmos(..params)`      | ![PMOS](assets/pmos.png)              |

### Standard Variants

Every component is available as american 🇺🇸 (ANSI) or european 🇪🇺 (IEEE). For example, the resistor can look like

![Resistor variants](assets/resistor.png)

### Styling Parameters

| Name     | Required | Type                     | Description                                   |
|:---------|:---------|:-------------------------|:----------------------------------------------|
| uid      | Yes      | `string`                 | Unique identifier                             |
| position | Yes      | `(float, float)`         | Position of the center of the component       |
| color    | No       | `color`                  | Color of the component's drawing              |
| variant  | No       | `american` or `european` | Component drawing standard ("IEEE" or "ANSI") |

## Contributing

I highly welcome contributions 🌱! Developing a package like this involves significant effort. Please check out the dedicated [contribution guidelines] to get started 🤩!
