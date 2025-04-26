#import "../component.typ": component
#import "../dependencies.typ": cetz

#let resistor(uid, position1, position2, ..params) = {
    let width = 100
    let height = 10
    let draw(start, end, variant, scale, rotate, color) = {
        if (variant == "european") {
            cetz.draw.line(start, end)
        } else {
            cetz.draw.line(start, end)
        }
    }
    component(uid, position1, position2, draw, ..params)
}