#import "/src/dependencies.typ": cetz
#import "/src/styles.typ": default

#let circuit(fallback) = {
    cetz.canvas(background: default.style.background.fill, {
        // Init style directory
        cetz.draw.set-ctx(ctx => {
            ctx.insert("zap", default)
            return ctx
        })
        fallback
    })
}

