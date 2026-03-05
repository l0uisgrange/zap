#import "/src/lib.typ"
#set page(width: auto, height: auto, margin: 5pt, fill: white)

#lib.circuit({
    import lib: *
    pmos_simple("p1", (0, 2))
    nmos_simple("n1", (0, 0))
    nstub("p1.d", label: [$V_(D D)$])
    sstub("n1.s", label:[GND])
    wire("p1.g", "n1.g")
    wire("p1.s", "n1.d")
    wstub((rel: (0, 1), to: "n1.g"), label: [A])
    estub((rel: (0, 1.8), to: "n1.s"), label: [F])

})