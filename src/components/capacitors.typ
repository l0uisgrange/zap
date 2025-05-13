#import "../component.typ": component
#import "../dependencies.typ": cetz
#import cetz.draw: anchor, line
#import "../mini.typ": adjustable-arrow

#let capacitor(name, node, adjustable: false, ..params) = {
    assert(type(adjustable) == bool, message: "adjustable must be of type bool")

    // Capacitor style
    let style = (
        width: .7,
        distance: 0.25,
    )

    // Drawing function
    let draw(ctx, position, style) = {
        anchor("0", (-style.distance / 2, -style.width/2))
        anchor("1", (style.distance / 2, style.width/2))

        line((-style.distance / 2, -style.width / 2), (-style.distance / 2, style.width / 2), ..style)
        line((style.distance / 2, -style.width / 2), (style.distance / 2, style.width / 2), ..style)
        if (adjustable) {
            adjustable-arrow()
        }
    }

    // Componant call
    component("capacitor", name, node, draw: draw, style: style, ..params)
}
