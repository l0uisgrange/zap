---
title: Basics
subtitle: Before diving into the complexity, it is necessary to explore some fundamental concepts from Zap, which will help you start very easily.
---

## Components

After you set up your circuit, you will start adding different items called components, which are declared like below.

```typst
#import "@preview/zap:0.4.0"

#zap.circuit({
    import zap: *

    resistor("r1", (0, 0), (3, 0), label: $R_1$)
})
```