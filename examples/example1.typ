#import "/src/lib.typ"
#set page(width: auto, height: auto, margin: 5pt, fill: white)

#lib.canvas({
    import lib: *

    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    afuse("f1", (0,2), "r1.out", position: 40%, label: $F_1$)
    vsource("v1", (0,-2), (0,2), u: $u_1$, i: (content: $i_1$, anchor: "south"), label: "5V", debug: true)
    wire("r4.out", (0,-2))
    pnp("n1", (8,2), envelope: true)
    wire("r1.out", "n1.b")
    capacitor("c1", "n1.e", (rel: (2,0)), label: $C_1$)
    swire("n1.c", "r4.out")
    swire("c1.out", (8,-2))

    node("A", (4,2))
    node("B", (4,-2))
    opamp("o1", (13,3), label: "OP1")
})
