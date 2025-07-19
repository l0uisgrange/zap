#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    diode("d1", (0,0), (3,0), label: (content: $D_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
    led("d2", (0,-3), (3,-3), label: (content: $"LED"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
    photodiode("d3", (0,-6), (3,-6), label: (content: $"PD"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
    tunnel("d4", (0,-9), (3,-9), label: (content: $"TD"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
    zener("d5", (0,-12), (3,-12), label: (content: $"ZD"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
    schottky("d6", (0,-15), (3,-15), label: (content: $"SD"_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
})
