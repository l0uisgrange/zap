#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, arc, circle, content, rect
#import "../mini.typ": ac-sign, dc-sign
#import "../utils.typ": quick-wires

#let motor(name, node, current: "dc", ..params) = {
    assert(current in ("dc", "ac"), message: "current must be ac or dc")

    // DCmotor style
    let style = (
        radius: 14pt,
        rotor-width: 35pt,
        rotor-height: 35pt / 4,
    )

    // Drawing functions
    let draw(ctx, position, style) = {
        anchor("0", (-style.radius, -style.radius))
        anchor("1", (style.radius, style.radius))

        if (style.variant == "pretty") {
            rect((-style.rotor-width / 2, -style.rotor-height / 2), (style.rotor-width / 2, style.rotor-height / 2), fill: black)
            circle((0, 0), radius: style.radius, fill: white)
        } else {
            circle((0, 0), radius: style.rotor-width / 2, fill: white, ..style)
            content((0, 0), anchor: "south", "M", padding: .03)
            let symbol = if current == "dc" { dc-sign } else { ac-sign }
            content((0, 0), [#cetz.canvas({ symbol() })], anchor: "north", padding: .13)
        }
    }

    // Componant call
    component("dcmotor", name, node, draw: draw, style: style, ..params)
}

#let dcmotor(name, node, ..params) = motor(name, node, current: "dc", ..params)
#let acmotor(name, node, ..params) = motor(name, node, current: "ac", ..params)
