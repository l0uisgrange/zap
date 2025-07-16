#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *
    draw.set-style(zap: (scale: 1))

    afuse("f1", (0,0), (3,0), label: (content: $F_1$, anchor: "south"), n: "*-*", i: (label: $i_1$, position: left), u: $u_1$)
})
