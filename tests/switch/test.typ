#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    switch("d1", (0,0), (2,0), i: (label: $i_1$, position: right), u: $u_1$)
    switch("d2", (0,-3), (2,-3), closed: true, i: (label: $i_1$, position: right), u: $u_1$)
})
