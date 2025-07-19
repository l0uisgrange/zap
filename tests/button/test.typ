#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    nobutton("d1", (0,0), (2,0), pressed: false, i: (label: $i_1$, position: right), u: $u_1$)
    nobutton("d1", (2,0), (4,0), pressed: true, i: (label: $i_1$, position: right), u: $u_1$)
    ncbutton("d1", (4,0), (6,0), pressed: false, i: (label: $i_1$, position: right), u: $u_1$)
    ncbutton("d1", (6,0), (8,0), pressed: true, i: (label: $i_1$, position: right), u: $u_1$)
})
