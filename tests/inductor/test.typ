#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    inductor("i1", (0,0), (3,0), label: (content: $I_1$, anchor: "south"), n: "*-*", i: (content: $i_1$, anchor: "west"), u: $u_1$)
    inductor("i2", (5,0), (8,0), variant: "ieee", label: (content: $I_1$, anchor: "south"), n: "*-*", i: (content: $i_1$, anchor: "west"), u: $u_1$)
})
