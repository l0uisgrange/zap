#import "/src/lib.typ"
#set page(width: auto, height: auto, margin: 5pt, fill: white)

#lib.circuit({
    import lib: *

    vsource("v1", (0, -2), (0, 2), u: $u_1$, i: (content: $i_1$, anchor: "south"), label: (content: "5V", anchor: "south"))
    resistor("r1", (0, 2), (2, 2), label: (content: "R1", anchor: "south"))
    voltmeter("am1", (2,2), (4,2), i: (content: $i_1$, anchor: "south"))
    voltmeter("vm1", (4, -2), (4, 2), label: (content: "v2", anchor: "north"))
    resistor("r2", (6, 2), (6, -2), label: (content: "R2", anchor: "south"))
    wire("am1.out", "r2.in")
    wire("r2.out", "v1.in")
})