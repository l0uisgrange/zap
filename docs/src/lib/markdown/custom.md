---
title: Custom symbol
subtitle: For circuits demanding specialized symbols, Zap delivers the intuitive tools you need to easily manufacture your own.
---

## Base template

Let's create a new symbol, called `square`, using the template below.

All you have to do is define a `draw` function and call the `component` function at the end.

```typst
#import "@preview/cetz:0.4.2": rect
#import "@preview/zap:0.4.0": component, interface

#let square(name, node, ..params) = {

    // Custom styling properties
    let custom-style = (
        width: 1,
		height: 1
    )

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-custom-style.width / 2, -custom-style.height / 2), (custom-style.width / 2, custom-style.height / 2), io: position.len() < 2)

        rect((-custom-style.width / 2, -custom-style.height / 2), (custom-style.width / 2, custom-style.height / 2), fill: white, ..style)
    }

    // Component call
    component("square", name, node, draw: draw, ..params)
}
```

Note that the `draw` function takes the following arguments

- `ctx` is the drawing context, which you can use to resolve coordinates, strokes, etc. You can find more information about this parameter on the CeTZ [online documentation](https://cetz-package.github.io/docs/advanced/custom-types/#context).
- `position` is a 2d array representing the x and y values of the center coordinate
- `style` is the resolved style. It does not contain your `custom-style` properties, but contains resolved constants like the current `variant` or `fill` color.
