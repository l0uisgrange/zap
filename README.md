# CirCeTZ

![Latest release](https://img.shields.io/github/v/release/l0uisgrange/circetz?include_prereleases&style=flat-square&logo=typst&color=%23239dad)
![License](https://img.shields.io/github/license/l0uisgrange/circetz?style=flat-square)
![Code size](https://img.shields.io/github/languages/code-size/l0uisgrange/circetz?style=flat-square)

> [!IMPORTANT]
> This package is not available on Typst Universe for the time being. Check out the [related discussion](https://github.com/l0uisgrange/circetz/discussions/2) for the first release.

CirCeTZ is a lightweight typst package to draw electronic circuits. The main goal of CirCeTZ is to be intuitive.

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