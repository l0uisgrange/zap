#set text(font: "Inter", size: 10.5pt, lang: "en")
#import "../src/exports.typ": *
#set page(margin: (
    y: 2.5cm,
    x: 1.5cm
  ),
  header: context [User Manual `v0.1.0` #h(1fr) Page #counter(page).display(
      "1/1",
      both: true,
    )],
    footer: [ #h(1fr) May 1, 2025]
)
#show heading: it => {
  it
  v((7-it.level) * .1em)
}

#set align(center)
#v(1fr)

#text("Circuitor", size: 30pt, weight: "semibold") \ #v(5pt) `v0.1.0 (01/05/2025)`

#v(0.3fr)

Louis Grange

May 1, 2025

#v(1fr)
#pagebreak()
#set align(start)
#outline()

#pagebreak()

= Introduction

Circuitor is initiated by Louis Grange in 2025, during his studies at the Federal Institute of Technology of Lausanne, Switzerland.

= Getting started

Let's say we want to create a circuit to show a basic voltage source with resistor.

First, you will need to import the package in your project using the ```typst #import``` instruction from Typst.

```typst
#import "@preview/circuitor:0.1.0"
```

You will now be able to create outstanding circuits.



```typst
#import "@preview/circuitor:0.1.0"
```

#pagebreak()

= Components

== Resistor

#canvas({
    resistor("r1", (0,0))
})


```typst
#import "@preview/circuitor:0.1.0"

#canvas({
  resistor("resistor", (3,0))
})
```

== Capacitor

== Inductor



#table(
  columns: (auto, auto, auto),
  stroke: .5pt,
  [fefefe]
)

== Source

