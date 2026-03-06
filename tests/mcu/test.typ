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

// Test circular symbol
#test({
    import lib: *
    let p = (
        (content: "1", side: "west"),
        (content: "2", side: "west"),
        (content: "3", side: "west"),
        (content: "4", side: "west"),
        (content: "5", side: "west"),
        (content: "6", side: "west"),
        (content: "7", side: "west"),
        (content: "8", side: "west"),
        (content: "16", side: "east"),
        (content: "15", side: "east"),
        (content: "14", side: "east"),
        (content: "13", side: "east"),
        (content: "12", side: "east"),
        (content: "11", side: "east"),
        (content: "10", side: "east"),
        (content: "9", side: "east"),
    )
    
    mcu("u1", (0, 0), pins: p, label: [*74LS138*],width: 2)
    wstub("u1.pin1", label: $A$)
    wstub("u1.pin2", label: $B$)
    wstub("u1.pin3", label: $C$)
    wstub("u1.pin4", label: $overline(G)_"2A"$, invert: true)
    wstub("u1.pin5", label: $overline(G)_"2B"$, invert: true)
    wstub("u1.pin6", label: $G_1$)
    wstub("u1.pin7", label: $overline(Y)_7$, invert: true)
    wstub("u1.pin8", label: "GND")
    
    estub("u1.pin9",  label: $U_"CC"$)
    estub("u1.pin10", label: $overline(Y)_0$, invert: true)
    estub("u1.pin11", label: $overline(Y)_1$, invert: true)
    estub("u1.pin12", label: $overline(Y)_2$, invert: true)
    estub("u1.pin13", label: $overline(Y)_3$, invert: true)
    estub("u1.pin14", label: $overline(Y)_4$, invert: true)
    estub("u1.pin15", label: $overline(Y)_5$, invert: true)
    estub("u1.pin16", label: $overline(Y)_6$, invert: true)
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
