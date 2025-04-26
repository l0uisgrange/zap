# Circuitor for Typst

![Latest release](https://img.shields.io/github/v/release/l0uisgrange/circuitor?include_prereleases&style=flat-square&logo=typst&color=%23239dad)
![License](https://img.shields.io/github/license/l0uisgrange/circuitor?style=flat-square)
![Code size](https://img.shields.io/github/languages/code-size/l0uisgrange/circuitor?style=flat-square)

> [!IMPORTANT]
> Circuitor is not yet available on Typst Universe. Follow [this discussion](https://github.com/l0uisgrange/circuitor/discussions/2) to stay updated on the first release 🌟!

**Circuitor** is a lightweight ⚡️ Typst package that makes drawing electronic circuits simple and intuitive.

```typst
#import "@preview/circuitor:0.1.0"

#canvas({
    isource("isource", (0,0))
    wire("isource.plus", "resistor.in")
    resistor("resistor", (3,0))
    wire("resistor.out", "isource.minus")
})
```

Circuitor is built on top of CeTZ, allowing you to combine CeTZ shapes and your circuit elements on the same canvas seamlessly.

## Supported Components

Circuitor supports a wide range of electronic components 🤓, with symbols for both European (IEEE) and American (ANSI) standards.

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

Feel free to suggest 💡 any new component by [opening a new issue](https://github.com/l0uisgrange/circuitor/issues/new?template=new_component.yml)!

### Standard Variants

Each component can be displayed using either the American 🇺🇸 (ANSI) or European 🇪🇺 (IEEE) symbol style. For example, here are the resistor variants:

![Resistor variants](assets/resistor.png)

### Styling Parameters

Each component supports flexible styling through the following parameters:

| Name     | Required | Type                     | Description                            |
|:---------|:---------|:-------------------------|:---------------------------------------|
| uid      | Yes      | `string`                 | Unique identifier                      |
| position | Yes      | `(float, float)`         | Coordinates for the component’s center |
| color    | No       | `color`                  | Color of the component's drawing       |
| variant  | No       | `american` or `european` | Symbol standard (ANSI or IEEE)         |

## Contributing

I highly welcome contributions 🌱! Creating and maintaining `circuitor` takes time and love. If you'd like to help, check out the [contribution guidelines](CONTRIBUTING.md) and join the journey 🤩!
