#set text(size: 11pt, lang: "en")
#import "../src/exports.typ": *

#show raw.where(block: true): block.with(
fill: luma(245),
inset: 10pt
)

#show link: set text(blue)
#show heading: set text(weight: "semibold", tracking: .3pt)
#set heading(numbering: "1.1")
#set page(margin: (
    y: 2.5cm,
    x: 1.5cm
  ),
  header: [Circuitor User Manual #h(1fr) `v0.1.0 (15/05/2025)`],
  footer: context [Page #counter(page).display(
                 "1/1",
                 both: true,
               ) #h(1fr) May 15, 2025]
)
#show heading: it => {
  it
  v((7-it.level) * .1em)
}

#set align(center)
#v(1fr)

#grid(
    columns: (auto, auto),
    gutter: 25pt,
    align: bottom,
    canvas({
        vsource("v1", (0,0), label: "V1")
        resistor("r1", (3,0), label: "R1")
        wire("v1.plus", (0,2), (rel: (3,0)), "r1.in", name: "wire1")
        wire("v1.minus", (0,-2), (rel: (3,0)), "r1.out")
        inductor("l1",(4.5,2), rotate: 90deg, label: "L1")
        dcmotor("m1", (6,0))
        wire("m1.out", (6,-2), (rel: (-3,0)))
        earth("g1", (0,-2))
        wire("m1.in", (6,2), "l1.out")
        wire("l1.in", (3,2))
    }),
    canvas({
        vsource("v1", (0,0), label: "V1", variant: "ieee")
        resistor("r1", (3,0), label: "R1", variant: "ieee")
        wire("v1.plus", (0,2), (rel: (3,0)), "r1.in", name: "wire1")
        wire("v1.minus", (0,-2), (rel: (3,0)), "r1.out")
        inductor("l1",(4.5,2), rotate: 90deg, label: "L1", variant: "ieee")
        dcmotor("m1", (6,0))
        wire("m1.out", (6,-2), (rel: (-3,0)))
        earth("g1", (0,-2))
        wire("m1.in", (6,2), "l1.in")
        wire("l1.out", (3,2))
    })
)

#v(0.5fr)

#text("Circuitor", size: 30pt, weight: "semibold") \ #v(2pt) The Typst package to draw standard circuits \ #v(5pt) `v0.1.0 (15/05/2025)`

#v(0.5fr)

Louis Grange

May 15, 2025

#v(1fr)
#pagebreak()
#set align(start)
#outline()

#pagebreak()

= Introduction

I'm Louis Grange, an engineering student at EPFL (École Polytechnique Fédérale de Lausanne), and I created Circuitor in April 2025 to address a missing piece in the Typst ecosystem: a library for drawing electrical circuits that adhere to IEC and IEEE standards.

At the time, no such solution existed — so I decided to build one. Circuitor started as a personal project but quickly grew into a structured, reusable library for creating clear, standards-compliant circuit diagrams directly in Typst.

My goal with Circuitor is to make it easier for students, educators, and professionals to integrate high-quality circuit drawings into their documents without leaving the Typst environment. Whether you're preparing lecture notes, technical reports, or academic publications, Circuitor aims to deliver both precision and simplicity.

= Getting started

== Installation

Circuitor is easy to set up and works out of the box with Typst Universe. There are two main ways to start using the library, depending on your workflow.

=== Typst Universe package

If you're working in the #link("https://typst.app", [online Typst app]), you can import Circuitor directly with a single line:

```typst
#import "@preview/circuitor:0.1.0"
```

=== Local package

If you prefer to work offline or want to explore the source code, you can also use Circuitor by downloading it locally from the GitHub repository.

1. Clone or download #link("https://github.com/l0uigrange/circuitor", [the repository]) to your computer.

2. In your Typst project, import the `exports.typ` file located in the `src` folder:

```typst
#import "PATH_TO_CIRCUITOR/src/exports.typ"
```

Make sure the path reflects the actual location of the downloaded folder relative to your `.typ` file.

== Mimium requirements

This table shows the minimum required versions of Typst and CETZ for each release of the Circuitor library.

#table(
  columns: 3,
  stroke: .6pt,
  [Circuitor], [Typst], [CeTZ],
  [`0.1.0`], [`0.13.1`], [`0.3.4`],
)

== Report bugs or suggest features and components

I actively maintain Circuitor and greatly value community feedback.

If you encounter a bug, spot an incorrect symbol, or have an idea for a new feature or electrical component, feel free to open an issue or a discussion on the #link("https://github.com/l0uisgrange/circuitor/issues", [GitHub repository]).
#pagebreak()

#include("chapters/basics.typ")

#include("chapters/components.typ")
