// SPDX-FileCopyrightText: 2025-2026 Louis Grange and contributors
// SPDX-License-Identifier: LGPL-3.0-or-later

#import "/src/symbol.typ": symbol, interface
#import "/src/dependencies.typ": cetz
#import "/src/symbols/wire.typ": wire
#import cetz.draw: anchor, circle, floating, line, rect, set-style

#let fuse(name, node, asymmetric: false, ..params) = {
    assert(type(asymmetric) == bool, message: "asymmetric must be of type bool")

    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: position.len() < 2)

        rect((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), stroke: style.stroke, fill: style.fill)
        wire((-style.width / 2, 0), (style.width / 2, 0))

        if (asymmetric) {
            rect((-style.width / 2, -style.height / 2), (-style.width / 2 + float(style.asymmetry * style.width), style.height / 2), stroke: none, fill: style.stroke.paint)
        }
    }

    // Constructor call
    symbol("fuse", name, node, draw: draw, ..params)
}

#let afuse(name, node, ..params) = fuse(name, node, ..params, asymmetric: true)
