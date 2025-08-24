#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    isource("i1", (0,0), (0,2))
    isource("i2", (2,0), (2,2), variant: "ieee")
    isource("i3", (3,0), (3,2), scale: 0.5, variant: "ieee")
    isource("i4", (4,0), (4,2), scale: 0.5, arrow-scale: 0.5, variant: "ieee")
    set-style(zap: (
      isource: (
        scale: 0.5,
        variant: "ieee",
        arrow-scale: 0.5
      )
    ))
    isource("i5", (5,0), (5,2))
})
