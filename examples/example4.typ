#import "/src/lib.typ"
#set page(width: auto, height: auto, margin: 5pt, fill: white)

#lib.circuit({
    import lib: *

    anot("not",(0,0))
    mux2("mux1", (4,1), width: (1))
    aand("and", (7,3))
    aor("or", (7,1.5))

    full_adder("add", (9,-0.3), rotate:(90deg))
    zero_extend("ze",(13,-1))

    mux4("mux2", (16,0), min-height:(4))

    wstub("not.in1",label: "B")
    zwire("not.out", "mux1.in1", bits:"N")
    zwire("not.in1", "mux1.in0", ratio: -0.4, bits:"N")

    let bus_x = 5.5
    wire("mux1.out", (bus_x, 1))
    wire((("add.b", "-|", (bus_x, 0))), ("and.in1", "-|", (bus_x, 0)), bits:"N")
    wire("and.in1", ("and.in1", "-|", (bus_x, 0)))
    wire("or.in1", ("or.in1", "-|", (bus_x, 0)))
    wire("add.b", ("add.b", "-|", (bus_x, 0)))

    bus_x = 6
    wire((("add.a", "-|", (bus_x, 0))), ("and.in2", "-|", (bus_x, 0)), bits:"N")
    wire("and.in2", ("and.in2", "-|", (bus_x, 0)))
    wire("or.in2", ("or.in2", "-|", (bus_x, 0)))
    wire("add.a", ("add.a", "-|", (bus_x, 0)))
    wstub(("add.a", "-|", (bus_x, 0)), label: "A")

    zwire("and.out", "mux2.in00")
    zwire("or.out", "mux2.in01", ratio: 3)
    wire("add.s", "mux2.in10")
    zwire("add.s", "ze.in", bits: "[N-1]")
    zwire("ze.out", "mux2.in11")

    estub("mux2.out", label: "Y")

    stub(name: "stub1", "mux1.sel0", length: (3), label:[$F_(2)$])
    swire("stub1.north", "add.cin")

    stub("mux2.sel0", label:[$F_(0)$])
    stub("mux2.sel1", label:[$F_(1)$])

})