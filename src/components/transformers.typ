#import "/src/component.typ": component
#import "/src/components/inductors.typ": inductor
#import "/src/components/wires.typ": wire
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, arc, line, rect, circle, content

#let transformer(
  name,
  node,
  label: none,
  ..params
  ) = {
    assert(params.pos().len() == 0, message: "transformer supports only one node")

    let style = (
        width: 1.2,
        height: 2,
        dot-radius: 1pt
    )

    // Drawing function
    let draw(ctx, position, style) = {
      anchor("base", (0, 0))
      anchor("0", "base")
      anchor("1", (0, 0.3))

      anchor("A1", (-style.width, 0))
      anchor("A2", (-style.width, -2))
      anchor("B1", (style.width, 0))
      anchor("B2", (style.width, -2))

      inductor("L1", (-style.width / 2, 0), (-style.width / 2, -2))
      inductor("L2", (style.width / 2, 0), (style.width / 2, -2))

      wire("A1", "L1.in")
      wire("A2", "L1.out")
      wire("B1", "L2.in")
      wire("B2", "L2.out")

      anchor("inner-dot-A1", (-style.width / 4, -style.height / 16))
      anchor("inner-dot-A2", (-style.width / 4, - 15 * style.height / 16))
      anchor("inner-dot-B1", (style.width / 4, -style.height / 16))
      anchor("inner-dot-B2", (style.width / 4, - 15 * style.height / 16))

      anchor("outer-dot-A1", (-3 * style.width / 4, -style.height / 16))
      anchor("outer-dot-A2", (-3 * style.width / 4, - 15 * style.height / 16))
      anchor("outer-dot-B1", (3 * style.width / 4, -style.height / 16))
      anchor("outer-dot-B2", (3 * style.width / 4, - 15 * style.height / 16))
      
      // circle("inner-dot-A1", fill: black, radius: style.dot-radius)
      if label != none {
        content((0, 0), label)
      }
    }

    // Componant call
    component("transformer", name, node, draw: draw, style: style, ..params)
}
