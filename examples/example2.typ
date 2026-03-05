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

#lib.circuit({
    import lib: *

    mcu("esp33", (0, 0), pins: pins, fill: rgb("#FBBEDF"), stroke: rgb("#FBBEDF"), width: 4, label: "ESP33")
    mcu("esp32", (-6, -3), pins: ((content: "IN", side: "west"), (content: "OUT", side: "east")), fill: rgb("#F2FA95"), stroke: rgb("#F2FA95"), width: 2.5, label: "ESP34")
    mcu("esp34", (9, 2.298), pins: ((content: "IN", side: "west"), (content: "OUT", side: "east")), fill: rgb("#93FDEA"), stroke: rgb("#93FDEA"), width: 3, label: "ESP35")

    zwire("esp33.pin7", "esp32.pin2", axis: "x")
    resistor("r1", "esp33.pin5", (rel: (-5, 0)), label: (content: $R_1$, anchor: "south"), position: 70%, i: $i$)
    zwire("r1.out", "esp32.pin1", axis: "x", ratio: 10)
    swire("esp33.pin12", (-3, -4), axis: "x")
    swire("esp33.pin1", (-3, 4), axis: "x")
    led("led", "esp33.pin19", (rel: (4, 0)), axis: "x", n: "-*")
    resistor("r2", "led.out", (rel: (0, -4.2)), label: (content: $R_2$, anchor: "north"), variable: true, position: 60%)
    capacitor("c1", "esp33.pin14", (rel: (4, 0)), label: (content: $C_1$, anchor: "north"))
    wire("c1.out", "led.out")
    node("A", "c1.out", label: (content: "A", position: "east"))
    ground("", "r2.out")
    vcc("e", (-3, 4))
    frame("f1", (-3, -4))
    wire("esp34.pin1", "A")
    zwire("esp34.pin2", (rel: (8, 0), to: "esp33.pin21"), axis: "x", ratio: -3)
    zener("zener", (rel: (8, 0), to: "esp33.pin21"), "esp33.pin21", position: 1, label: (content: $Z_1$, anchor: "south"))
})
