#set document(title: [Zap – The circuitikz Typst alternative], description: [])
#set heading(numbering: "1.")

#html.elem("script", attrs: (src: "https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,container-queries"))
#html.elem(
    "div",
    attrs: (class: "lg:flex antialised items-stretch p-5 md:p-10 hidden gap-10"),
)[
    #html.elem("div", attrs: (class: "w-52 relative"))[
        #html.elem("div", attrs: (class: "sticky top-5 md:top-10"))[#include "nav.typ"]
    ]
    #html.elem("article", attrs: (class: "prose prose-zinc prose-headings:font-medium prose-strong:font-medium max-w-3xl mx-auto!"))[#include "docs.typ"]
]

#html.elem("style")[
    svg.typst-frame { margin: 1rem; background: oklch(0.967 0.001 286.375) }
    html { scroll-behavior: smooth; }
]
