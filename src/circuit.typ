#import "/src/dependencies.typ": cetz
#import "/src/utils.typ": get-style
#import "/src/styles.typ": default

#let circuit(fallback) = {
    cetz.canvas({
        import cetz.draw: *
        register-mark("pretty", style => {
            let height = 0.21 * style.scale
            let width = height * style.width-ratio
            let tip = (height / 2, 0)
            let side1 = (-height / 2, +width / 2)
            let side2 = (-height / 2, -width / 2)

            let k = style.k
            merge-path(stroke: none, fill: style.fill, {
                bezier(side1, tip, (-height * k.at(0), +width * k.at(1)))
                bezier(tip, side2, (-height * k.at(0), -width * k.at(1)))
                bezier-through(side2, (-height * k.at(2), 0), side1)
            })
            anchor("tip",  tip)
            anchor("base", (height * (0.02 - k.at(2)), 0))
        })

        // Init style directory
        cetz.draw.set-ctx(ctx => {
            ctx.insert("zap", default)
            return ctx
        })
        fallback
    })
}

