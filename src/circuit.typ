#import "/src/dependencies.typ": cetz
#import "/src/styles.typ": default

#let circuit(fallback, ..params) = {
    cetz.canvas(..params, {
        // Init style directory
        cetz.draw.set-style(..default)
        fallback
    })
}

