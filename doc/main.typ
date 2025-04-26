#set text(font: "Inter", size: 10.5pt, lang: "en")
#set page(margin: (
    y: 2.5cm,
    x: 1.5cm
  ),
  header: context [CirCeTZ Manual #h(1fr) Page #counter(page).display(
      "1/1",
      both: true,
    )],
    footer: [ #h(1fr) efe]
)

#set align(center)
#v(1fr)

#text("CirCeTZ User Manual", size: 30pt, weight: "semibold")

#text("v0.1.0 (01/05/2025)", font: "IBM Plex Mono", size: 11pt)

#v(0.5fr)

Louis Grange

April 25, 2025

#v(1fr)
#pagebreak()
#set align(start)
#outline()

#pagebreak()

= Introduction

CirCeTZ is initiated by Louis Grange in 2025, during his studies at the Federal Institute of Technology of Lausanne, Switzerland.

= Getting started

Let's say we want to create a circuit to show a basic voltage source with resistor.

First, you will need to import the package in your project using the ```typst #import``` instruction from Typst.

```typst
#import "@preview/circetz:0.1.0"
```

You will now be able to create outstanding circuits.



```typst
#import "@preview/circetz:0.1.0"

#canvas({
  isource((0,1))
  resistor((0,4))
  wire((0,4), (0,2), (0,7), (0,3))
  ground((0,3))
})
```

= Components

== Source

