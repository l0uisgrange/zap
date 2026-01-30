// SPDX-FileCopyrightText: 2025-2026 Louis Grange and contributors
// SPDX-License-Identifier: LGPL-3.0-or-later

#import "/src/lib.typ" as zap

/// Generates a test circuit with small margin
///
/// - body (none, array, element): Content of the circuit to draw
/// -> content
#let test(body) = {
    set page(margin: 4pt, width: auto, height: auto)

    pagebreak(weak: true)

    zap.circuit({
        import zap: *
        body
    })
}
