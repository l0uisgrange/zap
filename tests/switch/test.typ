#import "/tests/utils.typ": test
#import "/src/lib.typ"

// Test symbols
#test({
    import lib: *
    switch("s1", (0, 0), (2, 0))
    switch("s2", (0, -1), (2, -1), closed: true)
})
