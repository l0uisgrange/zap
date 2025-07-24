#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    vsource("v1", (0,0), (2,0))
    vsource("v2", (3,0), (5,0), current: "ac")
    acvsource("v3", (6,0), (8,0))
})
