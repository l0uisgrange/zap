#import "./utils.typ": image
#import "/src/lib.typ"

#image({
    import lib: *
    acmotor("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    acvsource("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    adc("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    capacitor("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    dac("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    dcmotor("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    diode("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    wire((-3, 0), (3, 0))
    earth("r1", (0, 0))
})

#image({
    import lib: *
    wire((-3, 0), (3, 0))
    frame("r1", (0, 0))
})

#image({
    import lib: *
    wire((-3, 0), (3, 0))
    ground("r1", (0, 0))
})

#image({
    import lib: *
    fuse("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    heater("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    dvsource("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    disource("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    inductor("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    isource("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    led("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    potentiometer("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    resistor("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    rheostat("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    schottky("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    tunnel("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    vsource("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    zener("r1", (-3, 0), (3, 0))
})

#image({
    import lib: *
    wire((-3, 0), (3, 0))
    vcc("r1", (0, 0))
})

#image({
    import lib: *
    wire((-3, 0), (3, 0))
    vee("r1", (0, 0))
})