---
title: Labels & decorations
subtitle: Using Zap, you can easily add labels and decorations to your components to represent currents, voltages, and flows.
---

## Labels

You can name your components by giving them a label using the `label` parameter.

![dede](/docs/label.svg)

```typst
#zap.circuit({
    import zap: *

    heater("h1", (1, 0), (4, 0), label: $R$)
})
```

Sometimes, the label is not displayed where you want (like in the middle of another component). In that case, you can just give a dictionary to customize this behavior.

```typst
#zap.circuit({
    import zap: *

    heater("h2", (5, 0), (8, 0), label: (content: $R$, anchor: "south", distance: 5pt))
})
```

## Decorations

You can add labels for current, voltage, or generic flow to components using the i (current), u (voltage), or f (flow) parameters. These parameters accept either a string for a simple label or a dictionary for more detailed customization, using the same intuitive behaviour as labels.

```typst
#zap.circuit({
    import zap: *

    vsource("v1", (0,-2), (0,2), u: $u_1$, i: (content: $i_1$, anchor: "west"), label: "5V")
})
```

## Standards

_It is currently not possible to use a different style than IEC. This feature is still under development_