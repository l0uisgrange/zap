#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    mcu("mcu", (0,0), pins: 15)
    mcu("mcu", (5, 0), pins: (
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
    ), label: "ESP32")
})