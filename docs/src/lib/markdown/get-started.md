---
title: Getting started
subtitle: Everything has been thought to give you a complete and easy-to-use library. Zap is even published on Typst Universe.
---

<div class="flex items-start gap-4">
<div class="mt-7 flex-none bg-neutral-900 text-white text-center size-5 text-sm rounded-full">1</div>
<div>

## Installation

You can start using Zap simply by adding the following import at the top of your Typst file.

```typst
#import "@preview/zap:0.4.0"
```

It will automatically install the library from Typst Universe.

</div>
</div>

<div class="flex items-start gap-4">
<div class="mt-7 flex-none bg-neutral-900 text-white text-center size-5 text-sm rounded-full">2</div>
<div>

## Create your first circuit

To get started with Zap, here's a minimal working example.

```typst
#import "@preview/zap:0.4.0"

#zap.circuit({
    import zap: *
    
    isource("i1", (0, 0), (5, 0))
})
```

</div>
</div>