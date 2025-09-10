#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    dac("da", (0, 0), (2, 0))
    adc("ad", (0, -1), (2, -1))
})
