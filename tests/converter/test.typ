#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    dac("da", (0,0), (3,0))
    adc("ad", (4,0), (7,0))
    vee("v1", "ad.gnd")
    vcc("v1", "ad.vcc")
    vee("v1", "da.gnd")
    vcc("v1", "da.vcc")
})
