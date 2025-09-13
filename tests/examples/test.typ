#import "/tests/utils.typ": test
#import "/src/lib.typ"

#let pins = (
    (content: "VCC", side: "west"),
    (content: "UVCC", side: "west"),
    (content: "AVCC", side: "west"),
    (side: "west"),
    (content: "PD0", side: "west"),
    (content: "PD1", side: "west"),
    (content: "PD2", side: "west"),
    (content: "PD3", side: "west"),
    (content: "PD4", side: "west"),
    (content: "PD5", side: "west"),
    (side: "west"),
    (content: "GND", side: "west"),
    (content: "UGND", side: "west"),
    (content: "PB0", side: "east"),
    (content: "PB1", side: "east"),
    (content: "PB2", side: "east"),
    (content: "PB3", side: "east"),
    (content: "PB4", side: "east"),
    (content: "PB5", side: "east"),
    (side: "east"),
    (content: "PC0", side: "east"),
    (content: "PC1", side: "east"),
    (content: "PC2", side: "east"),
    (content: "PC3", side: "east"),
)

// Test example 1
#test({
    import lib: *

    resistor("r1", (2, 0), (4, 2))
    resistor("r2", (6, 0), (4, 2))
    resistor("r3", (6, 0), (4, -2))
    resistor("r4", (2, 0), (4, -2))
    afuse("f1", (0, 2), "r1.out", position: 40%, label: $F_1$)
    vsource("v1", (0, -2), (0, 2), u: $u_1$, i: (content: $i_1$, anchor: "south"), label: (content: "5V", anchor: "south"))
    wire("r4.out", (0, -2))
    pnp("n1", (8, 2), envelope: true)
    wire("r1.out", "n1.b")
    capacitor("c1", "n1.e", (rel: (2, 0)), label: $C_1$)
    swire("n1.c", "r4.out", axis: "y")
    swire("c1.out", (8, -2), axis: "y")
    node("A", (4, 2))
    node("B", (4, -2))
    opamp("o1", (13, 2.05), label: "OP1")
    wire("o1.minus", "c1.out")
    zwire("o1.out", (rel: (1, 0)))
    rheostat("r2", (rel: (1, 0), to: "o1.out"), (rel: (0, -4.05)), label: $R_"eq"$)
    swire("r2.out", (rel: (-6, 0)))
    earth("g1", (11, 1))
    swire("o1.plus", "g1", axis: "x")
})

// Test example 2
#test({
    import lib: *

    mcu("esp33", (0, 0), pins: pins, fill: rgb("#FBBEDF"), stroke: rgb("#FBBEDF"), width: 4, label: "ESP33")
    mcu("esp32", (-6, -3), pins: ((content: "IN", side: "west"), (content: "OUT", side: "east")), fill: rgb("#F2FA95"), stroke: rgb("#F2FA95"), width: 2.5, label: "ESP34")
    mcu("esp34", (9, 2.298), pins: ((content: "IN", side: "west"), (content: "OUT", side: "east")), fill: rgb("#93FDEA"), stroke: rgb("#93FDEA"), width: 3, label: "ESP35")
    zwire("esp33.pin7", "esp32.pin2")
    resistor("r1", "esp33.pin5", (rel: (-5, 0)), label: (content: $R_1$, anchor: "south"), position: 70%, i: $i$)
    zwire("r1.out", "esp32.pin1", ratio: 10)
    swire("esp33.pin12", (-3, -4))
    swire("esp33.pin1", (-3, 4))
    led("led", "esp33.pin19", (rel: (4, 0)), n: "-*")
    resistor("r2", "led.out", (rel: (0, -4.2)), label: (content: $R_2$, anchor: "north"), variable: true, position: 60%)
    capacitor("c1", "esp33.pin14", (rel: (4, 0)), label: (content: $C_1$, anchor: "north"))
    wire("c1.out", "led.out")
    node("A", "c1.out", label: (content: "A", position: "east"))
    ground("", "r2.out")
    vcc("e", (-3, 4))
    frame("f1", (-3, -4))
    wire("esp34.pin1", "A")
    zwire("esp34.pin2", (rel: (8, 0), to: "esp33.pin21"), ratio: -3)
    zener("zener", (rel: (8, 0), to: "esp33.pin21"), "esp33.pin21", position: 1, label: (content: $Z_1$, anchor: "south"))
})