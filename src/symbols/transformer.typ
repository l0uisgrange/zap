// SPDX-FileCopyrightText: 2025-2026 Louis Grange and contributors
// SPDX-License-Identifier: LGPL-3.0-or-later

#import "/src/symbol.typ": symbol, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, circle, hide, line, mark, merge-path, rect, set-style

/// Transformer symbol to use on a canvas
///
/// - name (str):
/// - node (coordinate):
/// ->
#let transformer(name, node, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.distance / 2 - style.radius, -style.radius), (style.distance / 2 + style.radius, style.radius), io: position.len() < 2)

        set-style(circle: (radius: style.radius))
        merge-path(
            join: false,
            stroke: none,
            fill: style.fill,
            {
                circle((-style.distance / 2, 0))
                circle((style.distance / 2, 0))
            },
        )

        set-style(stroke: style.stroke)
        circle((-style.distance / 2, 0))
        circle((style.distance / 2, 0))
    }

    // Component call
    component("transformer", name, node, draw: draw, ..params)
}
