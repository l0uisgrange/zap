#import "/tests/utils.typ": test
#import "/src/lib.typ": *

#let custom-component(name, node, ..params) = {
    import cetz.draw: *

    let const = (
        width: 10pt,
        height: 8pt,
    )

    // Drawing function
    let draw(ctx, position, style) = {
        interface(
            (-const.width / 2, -const.height / 2),
            ( const.width / 2,  const.height / 2),
            io: position.len() < 2
        )
        set-style(stroke: style.stroke)
        line("bounds.north-east", "bounds.south-west")
        line("bounds.north-west", "bounds.south-east")
    }

    // Component call
    component("custom-component", name, node, draw: draw, ..params)
}


// Test symbols
#test({
    custom-component("custom", (0, 0), (2, 0))
})

// Test styling
#test({
    set-style(
        custom-component: (
            stroke: red,
        )
    )
    custom-component("custom", (0, 0), (2, 0))
})

#test({
    custom-component("custom", (0, 0), (2, 0), stroke: 0.5pt + blue)
})

// Test decorations
#test({
    custom-component("custom", (0, 0), (2, 0), label: (content: [custom], anchor: "south"), u: $u_1$, i: $i_1$, f: $f_1$)
})
