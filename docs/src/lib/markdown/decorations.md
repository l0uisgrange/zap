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

![dede](/docs/custom-label.svg)

Sometimes, the label is not displayed where you want (like in the middle of another component). In that case, you can just give a dictionary to customize this behavior.

```typst
#zap.circuit({
    import zap: *

    heater("h1", (1, 0), (4, 0), label: $R$)
    heater("h2", (5, 0), (8, 0), label: (content: $R$, anchor: "south", distance: 0pt))
})
```

## Decorations

You can add labels for current, voltage, or generic flow to components using the `i` (current), `u` (voltage), or `f` (flow) parameters. These parameters accept either a string for a simple label or a dictionary for more detailed customization.

![dede](/docs/decorations.svg)

```typst
#zap.circuit({
    import zap: *

    vsource("v1", (1, 0), (5, 0), u: $u_1$, i: $i_1$)
})
```

### Current

![dede](/docs/current.svg)

```typst
#zap.circuit({
    import zap: *

    // simple current
    vsource("v1", (1, 0), (4, 0), i: $i_1$)
    
    // custom current (only "content" key is required)
    vsource("v1", (5, 0), (8, 0), i: (content: $i_1$, anchor: "west", invert: true, distance: 17pt, label-distance: 15pt))
})
```

### Voltage

### Flow

## Standards

_It is currently not possible to use a different style than IEC. This feature is still under development_