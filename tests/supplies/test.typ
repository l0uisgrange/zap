#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    vcc("vcc1", (0,1), label: "VCC")
    vee("vee1", (0,-1), label: "VEE")
})