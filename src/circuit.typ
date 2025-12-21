#import "/src/dependencies.typ": cetz
#import "/src/styles.typ": default
#import cetz.util: merge-dictionary

#let circuit(fallback, ..params) = {
    cetz.canvas(..params, {
        // Init style directory
        cetz.draw.set-ctx(ctx => {
            ctx.style = merge-dictionary(ctx.style, default)
            return ctx
        })
        fallback
    })
}

