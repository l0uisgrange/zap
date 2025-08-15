#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    switch("d1", (0,0), (2,0), i: (content: $i_1$, anchor: "east"), u: $u_1$)
    switch("d2", (0,-3), (2,-3), closed: true, i: (content: $i_1$, anchor: "east"), u: $u_1$)
})
