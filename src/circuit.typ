// SPDX-FileCopyrightText: 2025-2026 Louis Grange and contributors
// SPDX-License-Identifier: LGPL-3.0-or-later

#import "/src/dependencies.typ": cetz
#import "/src/styles.typ": default

#let circuit(fallback, ..params) = {
    cetz.canvas(..params, {
        // Init style directory
        cetz.draw.set-ctx(ctx => {
            ctx.insert("zap", (style: default))
            return ctx
        })
        fallback
    })
}
