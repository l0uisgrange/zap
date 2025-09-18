#import "/src/dependencies.typ": cetz
#import "/src/utils.typ": get-style
#import "/src/styles.typ": default

#let circuit(fallback) = {
    cetz.canvas({
        // Init style directory
        cetz.draw.set-ctx(ctx => {
            ctx.insert("zap", default)
            return ctx
        })
        fallback 
    })
}

