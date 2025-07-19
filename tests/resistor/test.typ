#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    resistor("r2", (0,0), (3,0), label: (content: $R_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
    resistor("r2", (5,0), (8,0), variant: "ieee", label: (content: $R_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
})
