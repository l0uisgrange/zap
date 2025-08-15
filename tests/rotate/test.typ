#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    resistor("r2", (0,0), (3,3), label: (content: $R_1$, anchor: "south"), n: "*-*", i: (content: $i_1$, anchor: "south-west"), u: $u_1$)
    resistor("r2", (4,0), (7,-3), label: (content: $R_1$, anchor: "south"), n: "*-*", i: (content: $i_1$, anchor: "south-west"), u: $u_1$)
})