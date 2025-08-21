#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *
    npn("Q1", (0,0), scale:(1,1), label: (content: [$Q_(#text([1]))$]))
    npn("Q2", (1,0), scale:(-1,1), label: (content: [$Q_(#text([2]))$]))
    pnp("Q3", (0,-2), label: (content: [$Q_(#text([3]))$]))
    pnp("Q4", (1,-2), scale:(-1,1), label: (content: [$Q_(#text([4]))$]))
})
