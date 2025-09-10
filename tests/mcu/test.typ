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

// Test symbol with numbers
#test({
    import lib: *
    mcu("mcu", (0, 0), pins: 15)
})

// Test symbol with dictionary
#test({
    import lib: *
    mcu(
        "mcu",
        (5, 0),
        pins: pins,
        label: "ESP32",
    )
})

// Test styling
#test({
    import lib: *
    mcu(
        "mcu",
        (5, 0),
        pins: pins,
        label: "ESP32",
        width: 10,
        fill: red.lighten(50%),
        stroke: red,
    )
})
