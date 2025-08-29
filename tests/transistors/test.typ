#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *
    npn("Q1", (0,0), label: $Q_1$)
    npn("Q2", (2,0), label: $Q_2$)
    pnp("Q4", (4,0), envelope: true, label: $Q_4$)
})
