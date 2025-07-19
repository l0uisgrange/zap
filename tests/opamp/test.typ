#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    opamp("o1", (0,0), label: "OP1")
    opamp("o2", (3,0), label: "OP2", variant: "ieee")
})
