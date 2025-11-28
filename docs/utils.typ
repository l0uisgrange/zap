#let circ(content) = html.elem("div", attrs: (class: "rounded-md p-5 bg-zinc-100"))[
    #html.frame[
        #content
    ]
]