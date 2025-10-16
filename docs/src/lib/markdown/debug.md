---
title: Debug
subtitle: It is not always easy to know where the mistakes come from. Here, Zap has you covered.
---

## Positioning

You can draw a grid to better understand the coordinates used by Zap to draw your components.

```typst
#import "@preview/cetz:0.4.2": grid
#import "@preview/zap:0.4.0"

#zap.circuit({
    import zap: *

    grid((-5, -5), (5, 5))
})
```

## Anchors

To check the anchors of your component, you can use the debug option, which will show you the exact anchors position and name.
