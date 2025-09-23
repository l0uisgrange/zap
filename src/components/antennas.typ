#import "/src/component.typ": component, interface
#import "/src/dependencies.typ": cetz
#import cetz.draw: anchor, line, merge-path
#import "/src/mini.typ": variable-arrow
#import "/src/components/wires.typ": wire

#let antenna(name, node, closed: false, ..params) = {
    // Drawing function
    let draw(ctx, position, style) = {
        wire((0, 0), (0, style.distance))
        let width = 2 * style.spacing

        merge-path(
            close: true,
            {
                for i in (0, 2) {
                    line((0, style.distance), (rel: (style.spacing * (i - 1), style.length)), ..style)
                }
                if closed {
                    line((0, style.distance + style.length), (rel: (style.spacing, 0)), ..style)
                    line((0, style.distance + style.length), (rel: (-style.spacing, 0)), ..style)
                }
            },
            ..style,
        )
        line((0, style.distance), (rel: (0, style.length)), ..style)
        interface((-width / 2, style.distance + style.spacing * 2), (width / 2, style.distance))
        anchor("default", (0, 0))
    }

    // Component call
    component("antenna", name, node, draw: draw, ..params)
}
