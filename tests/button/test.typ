#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    nobutton("d1", (0,0), (2,0), pressed: false, i: (content: $i_1$, anchor: "north-east"), u: $u_1$)
    nobutton("d1", (2,0), (4,0), pressed: true, i: (content: $i_1$), u: $u_1$)
    ncbutton("d1", (4,0), (6,0), pressed: false, i: (content: $i_1$), u: $u_1$)
    ncbutton("d1", (6,0), (8,0), pressed: true, i: (content: $i_1$), u: $u_1$)
})
