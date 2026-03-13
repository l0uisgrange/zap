#import "/src/lib.typ"
#set page(width: auto, height: auto, margin: 5pt, fill: white)

#lib.circuit({
    import lib: *

    set-style(logic: (invert-style: "circle"))

    lnot("g1", (0, 1.3))
    lnand("g2", (6, 1.3))
    lnor("g3", (0, -1.3))
    lxnor("g4", (6, -1.3))

    wstub("g1.in1", label: "A")
    estub("g1.out", label: "NOT")

    wstub("g2.in1", label: "B")
    wstub("g2.in2", label: "C")
    estub("g2.out", label: "NAND")

    wstub("g3.in1", label: "D")
    wstub("g3.in2", label: "E")
    estub("g3.out", label: "NOR")

    wstub("g4.in1", label: "F")
    wstub("g4.in2", label: "G")
    estub("g4.out", label: "XNOR")
})
