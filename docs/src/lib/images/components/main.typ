#import "./utils.typ": image
#import "/src/lib.typ"

// Image 1
#image({
    import lib: *
    acmotor("r1", (-3, 0), (3, 0))
})

// Image 2
#image({
    import lib: *
    acvsource("r1", (-3, 0), (3, 0))
})

// Image 3
#image({
    import lib: *
    adc("r1", (-3, 0), (3, 0))
})

// Image 4
#image({
    import lib: *
    capacitor("r1", (-3, 0), (3, 0))
})

// Image 5
#image({
    import lib: *
    dac("r1", (-3, 0), (3, 0))
})

// Image 6
#image({
    import lib: *
    dcmotor("r1", (-3, 0), (3, 0))
})

// Image 7
#image({
    import lib: *
    diode("r1", (-3, 0), (3, 0))
})

// Image 8
#image({
    import lib: *
    wire((-3, 0), (3, 0))
    earth("r1", (0, 0))
})

// Image 9
#image({
    import lib: *
    wire((-3, 0), (3, 0))
    frame("r1", (0, 0))
})

// Image 10
#image({
    import lib: *
    wire((-3, 0), (3, 0))
    ground("r1", (0, 0))
})

// Image 11
#image({
    import lib: *
    fuse("r1", (-3, 0), (3, 0))
})

// Image 12
#image({
    import lib: *
    heater("r1", (-3, 0), (3, 0))
})

// Image 13
#image({
    import lib: *
    dvsource("r1", (-3, 0), (3, 0))
})

// Image 14
#image({
    import lib: *
    disource("r1", (-3, 0), (3, 0))
})

// Image 15
#image({
    import lib: *
    inductor("r1", (-3, 0), (3, 0))
})

// Image 16
#image({
    import lib: *
    isource("r1", (-3, 0), (3, 0))
})

// Image 17
#image({
    import lib: *
    led("r1", (-3, 0), (3, 0))
})

// Image 18
#image({
    import lib: *
    potentiometer("r1", (-3, 0), (3, 0))
})

// Image 19
#image({
    import lib: *
    resistor("r1", (-3, 0), (3, 0))
})

// Image 20
#image({
    import lib: *
    rheostat("r1", (-3, 0), (3, 0))
})

// Image 21
#image({
    import lib: *
    schottky("r1", (-3, 0), (3, 0))
})

// Image 22
#image({
    import lib: *
    tunnel("r1", (-3, 0), (3, 0))
})

// Image 23
#image({
    import lib: *
    vsource("r1", (-3, 0), (3, 0))
})

// Image 24
#image({
    import lib: *
    zener("r1", (-3, 0), (3, 0))
})

// Image 25
#image({
    import lib: *
    wire((-3, 0), (3, 0))
    vcc("r1", (0, 0))
})

// Image 26
#image({
    import lib: *
    wire((-3, 0), (3, 0))
    vee("r1", (0, 0))
})

// Image 27
#image({
    import lib: *
    afuse("r1", (-3, 0), (3, 0))
})

// Image 28
#image({
    import lib: *
    transformer("r1", (-3, 0), (3, 0))
})