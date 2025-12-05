#import "@preview/t4t:0.4.2": get
#import "/docs/template/zap.typ"

#let circ(drawing) = html.elem("div", attrs: (class: "mb-7  rounded-md border dark:border-zinc-800 overflow-hidden flex-col flex *:m-0 *:block *:w-full *:even:rounded-t-none"), {
    html.elem("div", attrs: (class: "p-7 bg-white rounded-t-md dark:invert dark:hue-rotate-180"))[
        #html.frame[
            #eval(drawing.text, mode: "markup")
        ]
    ]
    html.elem("div", attrs: (class: "*:rounded-t-none *:border-none border-t dark:border-zinc-800 *:border-none overflow-x-scroll"), raw(
        drawing.text.split("\n").slice(2).join("\n"),
        block: true,
        lang: "typst",
    ))
})

#let template(doc) = [
    // Configuration
    #set heading(numbering: none)
    // Raw blocks styling
    #show raw.where(block: false): it => {
        html.elem("span", attrs: (class: "border-t px-1 py-0.5 border-none rounded dark:bg-zinc-800 bg-zinc-200/60 text-xs *:not-prose not-prose font-mono"), it)
    }
    #show raw.where(block: true): it => {
        html.elem("div", attrs: (class: "p-4 border bg-zinc-100/30 dark:bg-zinc-900/20 dark:border-zinc-800 not-prose text-[.85rem] rounded-md"), it)
    }
    // Styling sources
    #html.elem("script", attrs: (src: "https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,container-queries"))
    #html.elem("link", attrs: (rel: "preconnect", href: "https://fonts.googleapis.com"))
    #html.elem("link", attrs: (rel: "preconnect", href: "https://fonts.gstatic.com", crossorigin: "anonymous"))
    #html.elem("link", attrs: (rel: "stylesheet", href: "https://fonts.googleapis.com/css2?family=Mona+Sans:ital,wght@0,200..900;1,200..900&display=swap"))
    // Hero section
    #html.elem("div", attrs: (class: "p-3 md:p-5 w-full flex flex-col min-h-screen"), [
        #html.elem(
            "div",
            attrs: (
                class: "bg-white dark:border-zinc-800 overflow-hidden dark:bg-black flex-auto dark:*:invert dark:*:hue-rotate-180 flex items-center justify-center border border-b-0 rounded-t-3xl",
            ),
            html.frame[
                #include "/examples/example2.typ"
            ],
        )
        #html.elem("div", attrs: (class: "md:p-7 justify-center flex flex-col p-5 my-auto min-h-full block rounded-b-3xl bg-sky-200/80 dark:bg-sky-900/80 dark:text-white"), [
            #html.elem("h1", attrs: (class: "text-6xl font-medium mt-auto italic text-sky-500 !font-stretch-ultra-expanded"), "Zap")
            #html.elem("p", attrs: (class: "text-2xl my-5"), "Your Typst circuit drawing companion")
            #link("https://github.com/l0uisgrange/zap?tab=contributing-ov-file#contributions")[
                #html.elem("span", attrs: (class: "rounded-full border border-sky-900/20 p-3 *:inline transition hover:border-sky-900/30 flex items-center gap-3 max-w-max"), [
                    #html.elem("svg", attrs: (class: "size-7 group", xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 1024 1024", fill: "none"), html.elem(
                        "path",
                        attrs: (
                            class: "fill-current",
                            transform: "scale(64)",
                            d: "M8 0C3.58 0 0 3.58 0 8C0 11.54 2.29 14.53 5.47 15.59C5.87 15.66 6.02 15.42 6.02 15.21C6.02 15.02 6.01 14.39 6.01 13.72C4 14.09 3.48 13.23 3.32 12.78C3.23 12.55 2.84 11.84 2.5 11.65C2.22 11.5 1.82 11.13 2.49 11.12C3.12 11.11 3.57 11.7 3.72 11.94C4.44 13.15 5.59 12.81 6.05 12.6C6.12 12.08 6.33 11.73 6.56 11.53C4.78 11.33 2.92 10.64 2.92 7.58C2.92 6.71 3.23 5.99 3.74 5.43C3.66 5.23 3.38 4.41 3.82 3.31C3.82 3.31 4.49 3.1 6.02 4.13C6.66 3.95 7.34 3.86 8.02 3.86C8.7 3.86 9.38 3.95 10.02 4.13C11.55 3.09 12.22 3.31 12.22 3.31C12.66 4.41 12.38 5.23 12.3 5.43C12.81 5.99 13.12 6.7 13.12 7.58C13.12 10.65 11.25 11.33 9.47 11.53C9.76 11.78 10.01 12.26 10.01 13.01C10.01 14.08 10 14.94 10 15.21C10 15.42 10.15 15.67 10.55 15.59C13.71 14.53 16 11.53 16 8C16 3.58 12.42 0 8 0Z",
                        ),
                    ))
                ])
            ]
            #html.elem("span", attrs: (class: "text-sky-900/50 block dark:text-sky-50/50"), [Version #toml("/typst.toml").package.version •
                #link("https://github.com/l0uisgrange/zap")[
                    #html.elem("span", attrs: (class: "underline underline-offset-2"), "Edit this file")
                ]
            ])
        ])
    ])
    // Article
    #html.elem(
        "article",
        attrs: (class: "grid md:grid-cols-[max-content_auto] relative gap-5 p-5 !antialised"),
    )[
        // Navigation
        #html.elem("div", attrs: (class: "w-60 prose overflow-visible "))[
            #html.elem("div", attrs: (class: "sticky top-5"))[#include "nav.typ"]
        ]
        #html.elem("article", attrs: (
            class: "flex-auto !max-w-4xl prose dark:prose-invert overflow-hidden prose-zinc prose-a:underline-offset-2 prose-td:align-middle prose-headings:scroll-my-7 prose-headings:font-medium prose-strong:font-medium",
        ))[
            #doc
            #html.elem("div", attrs: (class: "text-xs pb-5 pt-10 text-zinc-400"), [A project initiated by Louis Grange, under LGPL-3.0 license])
        ]
    ]

    #html.elem(
        "style",
        "
        html { scroll-behavior: smooth; }
        html, body { background: oklch(98.5% 0 0); }
        @media (prefers-color-scheme: dark) {
          body {
            background-color: oklch(14.1% 0.005 285.823);
          }
        }
        body { font-family: \"Mona Sans\", sans-serif !important;  }
    ",
    )
]

#let warning(content, title: "Warning", ..params) = block(
    ..params,
    html.elem("div", attrs: (class: "px-3 py-2.5 rounded-md bg-orange-600/10"), {
        html.elem("span", attrs: (class: "flex items-center gap-2 not-prose"), {
            html.elem("svg", attrs: (class: "size-5", xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 640 640"), html.elem(
                "path",
                attrs: (
                    class: "fill-orange-600",
                    d: "M256.5 37.6C265.8 29.8 279.5 30.1 288.4 38.5C300.7 50.1 311.7 62.9 322.3 75.9C335.8 92.4 352 114.2 367.6 140.1C372.8 133.3 377.6 127.3 381.8 122.2C382.9 120.9 384 119.5 385.1 118.1C393 108.3 402.8 96 415.9 96C429.3 96 438.7 107.9 446.7 118.1C448 119.8 449.3 121.4 450.6 122.9C460.9 135.3 474.6 153.2 488.3 175.3C515.5 219.2 543.9 281.7 543.9 351.9C543.9 475.6 443.6 575.9 319.9 575.9C196.2 575.9 96 475.7 96 352C96 260.9 137.1 182 176.5 127C196.4 99.3 216.2 77.1 231.1 61.9C239.3 53.5 247.6 45.2 256.6 37.7zM321.7 480C347 480 369.4 473 390.5 459C432.6 429.6 443.9 370.8 418.6 324.6C414.1 315.6 402.6 315 396.1 322.6L370.9 351.9C364.3 359.5 352.4 359.3 346.2 351.4C328.9 329.3 297.1 289 280.9 268.4C275.5 261.5 265.7 260.4 259.4 266.5C241.1 284.3 207.9 323.3 207.9 370.8C207.9 439.4 258.5 480 321.6 480z",
                ),
            ))
            html.elem("span", attrs: (class: "font-medium text-orange-600 *:p-0  !*:m-0 "), title)
        })
        content
    }),
)

#let tip(content, title: "Tip", ..params) = block(
    ..params,
    html.elem("div", attrs: (class: "px-3 py-2.5 rounded-md bg-green-600/10"), {
        html.elem("span", attrs: (class: "flex items-center gap-2 not-prose"), {
            html.elem("svg", attrs: (class: "size-5", xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 640 640"), html.elem(
                "path",
                attrs: (
                    class: "fill-green-600",
                    d: "M420.9 448C428.2 425.7 442.8 405.5 459.3 388.1C492 353.7 512 307.2 512 256C512 150 426 64 320 64C214 64 128 150 128 256C128 307.2 148 353.7 180.7 388.1C197.2 405.5 211.9 425.7 219.1 448L420.8 448zM416 496L224 496L224 512C224 556.2 259.8 592 304 592L336 592C380.2 592 416 556.2 416 512L416 496zM312 176C272.2 176 240 208.2 240 248C240 261.3 229.3 272 216 272C202.7 272 192 261.3 192 248C192 181.7 245.7 128 312 128C325.3 128 336 138.7 336 152C336 165.3 325.3 176 312 176z",
                ),
            ))
            html.elem("span", attrs: (class: "font-medium text-green-600 *:p-0  !*:m-0 "), title)
        })
        content
    }),
)


#let info(content, title: "Info", ..params) = block(
    ..params,
    html.elem("div", attrs: (class: "px-3 py-2.5 rounded-md bg-blue-600/10"), {
        html.elem("span", attrs: (class: "flex items-center gap-2 not-prose"), {
            html.elem("svg", attrs: (class: "size-5", xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 640 640"), html.elem(
                "path",
                attrs: (
                    class: "fill-blue-600",
                    d: "M320 576C461.4 576 576 461.4 576 320C576 178.6 461.4 64 320 64C178.6 64 64 178.6 64 320C64 461.4 178.6 576 320 576zM288 224C288 206.3 302.3 192 320 192C337.7 192 352 206.3 352 224C352 241.7 337.7 256 320 256C302.3 256 288 241.7 288 224zM280 288L328 288C341.3 288 352 298.7 352 312L352 400L360 400C373.3 400 384 410.7 384 424C384 437.3 373.3 448 360 448L280 448C266.7 448 256 437.3 256 424C256 410.7 266.7 400 280 400L304 400L304 336L280 336C266.7 336 256 325.3 256 312C256 298.7 266.7 288 280 288z",
                ),
                [],
            ))
            html.elem("span", attrs: (class: "font-medium text-blue-600 *:p-0  !*:m-0 "), title)
        })
        content
    }),
)
