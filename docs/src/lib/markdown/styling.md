---
title: Styling
subtitle: Zap allows you to style most electrical components using optional arguments passed during their declaration or simple global settings.
---

## Specific component

If you want to customize the appearance `dede` of a **single component** instance, rather than all components of the same type, simply use the various params optional arguments.

```typst
#zap.circuit({
    import zap: *

    resistor("r1", (0,0), (3,0), variant: "iec", fill: red.lighten(80%), stroke: 1pt + red)
})
```

## Contributors

Special thanks to all the contributors who bring amazing features and bug fixes.

