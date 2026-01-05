#import "/tests/utils.typ": test
#import "/src/lib.typ": cetz, component, interface, set-style

#let custom(name, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        import cetz.draw: *
        interface(
            (-style.width / 2, -style.height / 2),
            ( style.width / 2,  style.height / 2),
            io: position.len() < 2
        )
        set-style(stroke: style.stroke)
        line("bounds.north-east", "bounds.south-west")
        line("bounds.north-west", "bounds.south-east")
    }

    // Component call
    component("custom",
        name, draw: draw,
        include-to-style: (
            stroke: auto,
            width: 10pt,
            height: 8pt,
        ),
        ..params,
    )
}

// Test symbols
#test({
    custom("custom", (0, 0), (5, 0))
})

#test({
    set-style(custom: (stroke: red))
    custom("custom", (0, 0), (5, 0))
})

#test({
    custom("custom", (0, 0), (5, 0), stroke: blue)
})

#test({
    set-style(custom: (stroke: green))
    custom("custom", (0, 0), (5, 0), stroke: (dash: "dotted"))
})

#test({
    set-style(custom: (label: (align: "north")))
    custom("custom", (0, 0), (5, 0), label: [Label], u: $u$, i: $i$)
})

#test({
    set-style(custom: (stroke: green + 3pt))
    custom("custom", (0, 0), (2, 0))
    custom("custom", (2, 0), (4, 0), stroke: (paint: auto))    
    custom("custom", (4, 0), (6, 0), stroke: auto)
})
