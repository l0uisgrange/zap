#import "/src/lib.typ" as lib

#let test(body) = {
    set page(margin: 4pt, width: auto, height: auto)

    pagebreak(weak: true)

    lib.circuit({
        import lib: *
        body
    })
}
