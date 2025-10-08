#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import "/src/mini.typ": ac-sign
#import cetz.draw: anchor, circle, content, line, mark, polygon, rect
#import "/src/utils.typ": get-style

#let round-meter(name, node, measurand: str, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        let component-rotation = ctx.at("component-rotation")
        let angle_radians = (style.pointer-angle - component-rotation)
        let pointer_start_x = style.pointer-start-scale * style.radius * calc.cos(angle_radians)
        let pointer_start_y = style.pointer-start-scale * style.radius * calc.sin(angle_radians)
        let pointer_end_x = style.pointer-end-scale * style.radius * calc.cos(angle_radians)
        let pointer_end_y = style.pointer-end-scale * style.radius * calc.sin(angle_radians)
        line(
            (pointer_start_x, pointer_start_y),
            (pointer_end_x, pointer_end_y),
            mark: (
                end: ">",
                fill: style.stroke.paint,
                scale: style.pointer-arrow-scale * params.at("scale", default: style.scale.at("x", default: 1.0)),
            ),
            ..style,
        )
        line(
            (-pointer_start_x, -pointer_start_y),
            (-pointer_end_x, -pointer_end_y),
            ..style,
        )
        interface((-style.radius, -style.radius), (style.radius, style.radius), io: position.len() < 2)
        content((0, 0), measurand)
        circle((0, 0), radius: style.radius, fill: none, ..style)
    }

    // Component call
    component("round-meter", name, node, draw: draw, ..params)
}

#let voltmeter(name, node, ..params) = round-meter(name, node, measurand: "V", ..params)
#let ammeter(name, node, ..params) = round-meter(name, node, measurand: "A", ..params)
#let ohmmeter(name, node, ..params) = round-meter(name, node, measurand: [$Omega$], ..params)
#let wattmeter(name, node, ..params) = round-meter(name, node, measurand: "W", ..params)
