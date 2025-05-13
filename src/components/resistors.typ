#import "/src/component.typ": component
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, line, rect
#import "/src/mini.typ": adjustable-arrow

#let resistor(name, node, adjustable: false, movable: false, ..params) = {
    assert(type(adjustable) == bool, message: "adjustable must be of type bool")
    assert(type(movable) == bool, message: "movable must be of type bool")

    // Resistor style
    let style = (
        width: 40pt,
        height: 40pt / 3,
        zigs: 3,
    )

    // Drawing function
    let draw(ctx, position, style) = {
        anchor("0", (-style.width / 2, -style.height / 2))
        anchor("1", (style.width / 2, style.height / 2))

        if style.variant == "iec" {
            rect(
                (-style.width / 2, -style.height / 2),
                (
                    style.width / 2,
                    style.height / 2,
                ),
                ..style,
            )
        } else {
            let step = style.width / (style.zigs * 2)
            let sign = -1
            let x = style.width / 2
            line(
                (-x, 0),
                (rel: (step / 2, style.height / 2)),
                ..for _ in range(style.zigs * 2 - 1) {
                    ((rel: (step, style.height * sign)),)
                    sign *= -1
                },
                (x, 0),
                ..style,
                fill: none,
            )
        }
        if adjustable {
            adjustable-arrow()
        } else if movable {
            let arrow-length = 40pt
            let arrow-distance = 20pt
            let arrow-origin = (1.3 * style.width / 2, arrow-distance)
            line(arrow-origin, (0, arrow-distance), (0, style.height / 2), mark: (end: ">", fill: black), ..style, fill: none)
        }
    }

    // Componant call
    component("resistor", name, node, draw: draw, style: style, ..params)
}

#let potentiometer(name, node, ..params) = resistor(name, node, adjustable: true, ..params)
