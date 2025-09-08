#import "../dependencies.typ": cetz
#import "../styles.typ": default-style
#import cetz.draw: line

#let wire(multi: 1, shape: "direct", ..params) = {
    assert(type(multi) == int or type(multi) == dictionary, message: "multi must be an int")
    assert(shape in ("direct", "zigzag", "dodge"), message: "shape must be direct, zigzag or dodge")

    // Handles multi-bits wiring by displaying a slash with a number
    if multi > 1 {
        group(name: name, ctx => {
            let style = cetz.styles.resolve(ctx.style, root: "zap", base: default-style)

            line((), ..style.at("wires"), name: "wireline")
            line(, ..params)
        })
    }
    /*if multi > 10 {
        line(, stroke: 0.6pt)
    }*/
}


#let zwire(..params) = wire(shape: "zigzag", ..params)
#let swire(..params) = wire(shape: ("zigzag", 100%), ..params)