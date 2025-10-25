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

// Image 29
#image({
    import lib: *
    mcu("r1", (0, 0), pins: 5, width: 2, height: 2)
    draw.floating({
        wire("r1.pin1", (rel: (-5, 0)))
        wire("r1.pin2", (rel: (-5, 0)))
        wire("r1.pin3", (rel: (-5, 0)))
        wire("r1.pin4", (rel: (5, 0)))
        wire("r1.pin5", (rel: (5, 0)))
    })
})

// Image 30
#image({
    import lib: *
    opamp("r1", (0, 0))
    draw.floating({
        wire("r1.plus", (rel: (-5, 0)))
        wire("r1.minus", (rel: (-5, 0)))
        wire("r1.out", (rel: (5, 0)))
    })
})

// Image 31
#image({
    import lib: *
    npn("r1", (0, 0))
    draw.floating({
        wire("r1.c", (rel: (0, 5)))
        wire("r1.b", (rel: (-5, 0)))
        wire("r1.e", (rel: (0, -5)))
    })
})

// Image 32
#image({
    import lib: *
    pmos("r1", (0, 0))
    draw.floating({
        wire("r1.s", (rel: (0, 5)))
        wire("r1.d", (rel: (0, -5)))
        wire("r1.c", (rel: (-5, 0)))
    })
})

// Image 33
#image({
    import lib: *
    pnp("r1", (0, 0))
    draw.floating({
        wire("r1.e", (rel: (0, 5)))
        wire("r1.b", (rel: (-5, 0)))
        wire("r1.c", (rel: (0, -5)))
    })
})

// Image 34
#image({
    import lib: *
    nmos("r1", (0, 0))
    draw.floating({
        wire("r1.d", (rel: (0, 5)))
        wire("r1.s", (rel: (0, -5)))
        wire("r1.c", (rel: (-5, 0)))
    })
})

// Image 35
#image({
    import lib: *
    wire((-3, 0), (3, 0))
    antenna("a1", (0, 0))
})

// Image 36
#image({
    import lib: *
    voltmeter("m1", (-3, 0), (3, 0))
})

// Image 37
#image({
    import lib: *
    ammeter("m2", (-3, 0), (3, 0))
})

// Image 38
#image({
    import lib: *
    ohmmeter("m3", (-3, 0), (3, 0))
})

// Image 39
#image({
    import lib: *
    wattmeter("m4", (-3, 0), (3, 0))
})

// Image 40
#image({
    import lib: *
    nobutton("m4", (-3, 0), (3, 0))
})

// Image 41
#image({
    import lib: *
    noibutton("m4", (-3, 0), (3, 0))
})

// Image 42
#image({
    import lib: *
    ncbutton("m4", (-3, 0), (3, 0))
})

// Image 43
#image({
    import lib: *
    pcapacitor("r1", (-3, 0), (3, 0))
})

// Image 44
#image({
    import lib: *
    circulator("c1", (0, 0))
    draw.floating({
        wire("c1.port1", (rel: (-5, 0)))
        wire("c1.port2", (rel: (5, 0)))
        wire("c1.port3", (rel: (0, 5)))
    })
})

// Image 45
#image({
    import lib: *
    land("c1", (0, 0))
    draw.floating({
        wire("c1.out", (rel: (5, 0)))
        wire("c1.in1", (rel: (-5, 0)))
        wire("c1.in2", (rel: (-5, 0)))
    })
})

// Image 46
#image({
    import lib: *
    lor("c1", (0, 0))
    draw.floating({
        wire("c1.out", (rel: (5, 0)))
        wire("c1.in1", (rel: (-5, 0)))
        wire("c1.in2", (rel: (-5, 0)))
    })
})

// Image 47
#image({
    import lib: *
    lxor("c1", (0, 0))
    draw.floating({
        wire("c1.out", (rel: (5, 0)))
        wire("c1.in1", (rel: (-5, 0)))
        wire("c1.in2", (rel: (-5, 0)))
    })
})
