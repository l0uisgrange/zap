#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    vcc("vcc", (-1,0), label: "VCC")
    vee("vee", (1,0), label: "VEE")
    wire("vcc", "vee")
})