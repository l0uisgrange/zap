#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *
    npn("Q1", (0,0), scale:(1,1))
    npn("Q2", (1,0), scale:(-1,1))
})