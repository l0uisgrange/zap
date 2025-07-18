#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *
    draw.set-style(zap: (scale: 1))

    diode("d1", (0,0), (3,0), label: (content: $D_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)

    led("d2", (0,-2), (3,-2), label: (content: $"LED"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)

    photodiode("d3", (0,-4), (3,-4), label: (content: $"PD"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)

    tdiode("d4", (0,-6), (3,-6), label: (content: $"TD"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)

    zdiode("d5", (0,-8), (3,-8), label: (content: $"ZD"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)

    sdiode("d6", (0,-10), (3,-10), label: (content: $"SD"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
})
