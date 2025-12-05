#import "/src/lib.typ"
#set page(width: auto, height: auto, margin: 5pt, fill: white)

#lib.circuit({
    import lib: *

    land("l1", (0, 0))
    lnand("l2", (0, -2))
    lxnor("l3", (3, -1))

    dflipflop("d1", (6, -1.5), stroke: none, fill: rgb("#F2FA95"))

    zwire("l1.out", "l3.in1")
    zwire("l2.out", "l3.in2")
    zwire("l3.out", "d1.pin1")

    estub("d1.pin6", label: "OUT")
    wstub("d1.pin3", label: "Clock")
    wstub("l1.in1", label: "A")
    wstub("l1.in2", label: "B")
    wstub("l2.in1", label: "C")
    wstub("l2.in2", label: "D")
})
