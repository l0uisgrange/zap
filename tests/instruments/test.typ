#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    voltmeter("m1", (0, 0), (3, 0))
    ammeter("m2", (0, -1.5), (3, -1.5))
    ohmmeter("m3", (0, -3), (3, -3))
    wattmeter("m4", (0, -4.5), (3, -4.5))
})