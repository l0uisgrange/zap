#import "/src/dependencies.typ": cetz
#import "/src/utils.typ": opposite-anchor
#import cetz.draw: circle, content, get-ctx, on-layer
#import "/src/utils.typ": get-style

#let node(name, position, fill: true, label: none, ..params) = {
    assert(type(name) == str, message: "node name must be a string")

    on-layer(1, ctx => {
        let node-style = get-style(ctx).node
        circle(position,
               radius: node-style.radius,
               fill: if fill { node-style.fill } else { node-style.nofill },
               name: name,
               stroke: node-style.stroke,
               ..params)
    })
    
    // Label
    on-layer(0, ctx => {
        if label != none {
            if type(label) == dictionary and label.at("content", default: none) == none { panic("label dictionary needs at least content key") }
            let label-style = get-style(ctx).label
            
            let l = if type(label) == dictionary {
                cetz.util.merge-dictionary(label, label-style, overwrite: false)
            } else {
                cetz.util.merge-dictionary(label-style, (content: label,))
            }
            
            content(
                if type(l.anchor) == str { name + "." + l.anchor } else { l.anchor },
                anchor: opposite-anchor(l.anchor),
                l.content,
                padding: l.distance
            )
        }
    })
}
