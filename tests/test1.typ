#set page(margin: 4pt, width: auto, height: auto)
#import "../src/lib.typ"

#lib.canvas({
    import lib: *
    draw.set-style(zap: (scale: 1))

    // Diodes
    led("led1", (0,0), (3,0), c: "*-*", label: "D1")
    diode("diode1", (0,2), (3,2), c: "*-*", label: "D2")
    photodiode("photodiode1", (0,4), (3,4), c: "*-*", label: "D3")

    // Resistors
    resistor("resistor1", (5,0), (8,0), c: "*-*", label: "R1")
    resistor("resistor2", (5,2), (8,2), c: "*-*", label: "R2", variable: true)
    resistor("resistor3", (5,4), (8,4), c: "*-*", label: "R3", adjustable: true)
    rheostat("rheostat1", (5,6), (8,6), c: "*-*", label: "R4")
    potentiometer("potentiometer1", (5,8), (8,8), c: "*-*", label: "R5")

    // Capacitors
    capacitor("capacitor1", (10,0), (13,0), c: "*-*", label: "C1")
    capacitor("capacitor2", (10,2), (13,2), c: "*-*", label: "C2", variable: true)

    // Inductors
    inductor("inductor1", (10,4), (13,4), c: "*-*", label: "L1")
    inductor("inductor2", (10,6), (13,6), c: "*-*", label: "L2", variant: "iec")

    // Sources
    isource("isource1", (15,0), (18,0), c: "*-*", label: "I1")
    isource("isource2", (15,2), (18,2), c: "*-*", label: "I2", current: "ac")
    vsource("vsource1", (15,4), (18,4), c: "*-*", label: "V1")
    vsource("vsource2", (15,6), (18,6), c: "*-*", label: "V2", current: "ac")

    // Grounds
    ground("ground1", (0,10))
    frame("frame1", (3,10))
    earth("earth1", (6,10))
    vcc("vcc1", (9,10))

    // Opamp
    opamp("opamp1", (15,10), label: "U1")
    opamp("opamp2", (15,12), invert: true, label: "U2")

    // Node
    node("n1", (0,12), fill: true)
    node("n2", (3,12), fill: false)

    // Wire
    wire((0,14), (3,14), multi: 1)
    wire((3,14), (6,14), multi: 2)

    // Fuses
    fuse("fuse1", (0,16), (3,16), c: "*-*", label: "F1")
    fuse("fuse2", (3,16), (6,16), c: "*-*", label: "F2", asymmetric: true)
    afuse("afuse1", (6,16), (9,16), c: "*-*", label: "F3")

    // Motors
    dcmotor("dcmotor1", (0,18), (3,18), c: "*-*", label: "M1")
    dcmotor("dcmotor2", (3,18), (6,18), c: "*-*", label: "M2", magnet: true)
    acmotor("acmotor1", (6,18), (9,18), c: "*-*", label: "M3")

    // BJTs
    bjt("bjt1", (0,20), label: "Q1", polarisation: "npn")
    bjt("bjt2", (3,20), label: "Q2", polarisation: "pnp")
    bjt("bjt3", (6,20), label: "Q3", polarisation: "npn", envelope: true)
    bjt("bjt4", (9,20), label: "Q4", polarisation: "pnp", envelope: true)
    npn("npn1", (12,20), label: "Q5")
    pnp("pnp1", (15,20), label: "Q6")

    // MOSFETs
    mosfet("mosfet1", (0,22), label: "M6", channel: "n")
    mosfet("mosfet2", (3,22), label: "M7", channel: "p")
    mosfet("mosfet3", (6,22), label: "M8", channel: "n", mode: "depletion")
    mosfet("mosfet4", (9,22), label: "M9", channel: "p", mode: "depletion")
    mosfet("mosfet5", (12,22), label: "M10", channel: "n", envelope: true)
    mosfet("mosfet6", (15,22), label: "M11", channel: "p", envelope: true)
    mosfet("mosfet7", (18,22), label: "M12", channel: "n", bulk: "external")
    mosfet("mosfet8", (21,22), label: "M13", channel: "p", bulk: "external")
    mosfet("mosfet9", (24,22), label: "M14", channel: "n", bulk: none)
    mosfet("mosfet10", (27,22), label: "M15", channel: "p", bulk: none)
    nmos("nmos1", (0,24), label: "M16")
    pmos("pmos1", (3,24), label: "M17")
    nmosd("nmosd1", (6,24), label: "M18")
    pmosd("pmosd1", (9,24), label: "M19")
})
