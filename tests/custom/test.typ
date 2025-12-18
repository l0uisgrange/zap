#import "/tests/utils.typ": test
#import "/src/lib.typ": component, interface, cetz, set-style

#let custom(name, ..params) = {
  let const = (w:2, h:1)

  let draw(ctx, position, style) = {
    interface(
      (-const.w / 2, -const.h / 2), 
      (const.w / 2, const.h / 2), 
      io: position.len() < 2
    )

    // cetz.draw.set-style(..style)
    cetz.draw.rect("bounds.north-east", "bounds.south-west", ..style)
  }
  component("my-custom-component", name, draw: draw, ..params)
}


// Test symbols
#test({
    custom("custom", (0, 0), (5, 0))
})

#test({
    set-style(my-custom-component: (stroke: red))
    custom("custom", (0, 0), (5, 0))
})

#test({
    custom("custom", (0, 0), (5, 0), stroke: blue)
})
