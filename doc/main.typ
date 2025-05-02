#set text(font: "Inter", size: 10pt, lang: "en")
#import "../src/exports.typ": *

#show raw.where(block: true): block.with(
fill: luma(245),
inset: 10pt
)

#show link: set text(blue)
#show heading: set text(weight: "semibold")
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

At the time, no such solution existed, so I decided to build one #emoji.construction. Circuitor started as a personal project but quickly grew into a structured, reusable library for creating clear, standards-compliant circuit diagrams directly in Typst.

My goal with Circuitor is to make it easier for students, educators, and professionals to integrate high-quality circuit drawings into their documents without leaving the Typst environment. Whether you're preparing lecture notes, technical reports, or academic publications, Circuitor aims to deliver both precision and simplicity #emoji.fencing.

#include("chapters/getting_started.typ")

#pagebreak()

#include("chapters/core.typ")

#pagebreak()

#include("chapters/components.typ")
