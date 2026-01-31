// SPDX-FileCopyrightText: 2025-2026 Louis Grange and contributors
// SPDX-License-Identifier: LGPL-3.0-or-later

#import "/src/symbol.typ": symbol, interface
#import "/src/dependencies.typ": cetz
#import "/src/symbols/wire.typ": wire
#import cetz.draw: anchor, circle, hide, line, mark, rect

/// Switch symbol to use on a canvas
///
/// - name (str | none): Symbol identifier
/// - node (coordinate): Center of the symbol
/// - closed (bool): Switch state
/// -> content
#let switch(name, node, closed: false, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -0.2), (style.width / 2, 0.2), io: position.len() < 2)

        wire((-style.width / 2, 0), (radius: style.width / 2, angle: if closed { 0deg } else { style.angle }))
    }

    // Constructor call
    symbol("switch", name, node, draw: draw, ..params)
}
