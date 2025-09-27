// Gives the anchor for the label depending on the component orientation in degrees
#let get-label-anchor(angle-deg) = {
    let angle = angle-deg.deg()
    let normalized-angle = calc.rem(if angle < 0 { angle + 360 } else { angle }, 360)

    let tolerance = 15

    if calc.abs(normalized-angle) < tolerance {
        return "south"
    } else if calc.abs(normalized-angle - 90) < tolerance {
        return "east"
    } else if calc.abs(normalized-angle - 180) < tolerance {
        return "north"
    } else if calc.abs(normalized-angle - 270) < tolerance {
        return "west"
    } else {
        if normalized-angle > 0 and normalized-angle < 90 {
            return "south-east"
        } else if normalized-angle > 90 and normalized-angle < 180 {
            return "north-east"
        } else if normalized-angle > 180 and normalized-angle < 270 {
            return "north-west"
        } else {
            return "south-west"
        }
    }
}

// Gives the opposite anchor
#let opposite-anchor(anchor) = {
    if anchor == "north" {
        "south"
    } else if anchor == "south" {
        "north"
    } else if anchor == "east" {
        "west"
    } else if anchor == "west" {
        "east"
    } else if anchor == "north-east" {
        "south-west"
    } else if anchor == "north-west" {
        "south-east"
    } else if anchor == "south-east" {
        "north-west"
    } else if anchor == "south-west" {
        "north-east"
    } else if anchor == "center" {
        "center"
    } else {
        panic("anchor not recognized: " + anchor)
    }
}

#import "/src/dependencies.typ": cetz

#let to-points(ctx, number) = {
    return (number / cetz.util.resolve-number(ctx, 1pt)) * 1pt
}

#let resolve(dict) = {
    // Special dictionaries
    let hold = ("stroke", "scale")

    let resolve-recursive(dict, defs) = {
        let dict-defs = (:)
        for (k, v) in dict {
            if type(v) != dictionary {
                if v == auto and k in defs.keys() {
                    dict.at(k) = defs.at(k)
                }
                dict-defs.insert(k, dict.at(k))
            } else if k in hold {
                for key in v.keys() {
                    if v.at(key) == auto and key in defs.at(k).keys() {
                        dict.at(k).at(key) = defs.at(k).at(key)
                    }
                }
                dict-defs.insert(k, dict.at(k))
            }
        }
        for (k, v) in dict {
            if type(v) == dictionary and k not in hold {
                dict.at(k) = resolve-recursive(dict.at(k), defs + dict-defs)
            }
        }
        return dict
    }

    return resolve-recursive(dict, (:))
}

#let set-style(..style) = {
    cetz.draw.set-ctx(ctx => {
        let new-style = style.named()
        for root in new-style.keys() {
            let style-dict = ((root): (new-style.at(root)))
            if ctx.zap.style.at(root, default: none) == none {
                ctx.style = cetz.styles.merge(ctx.style, style-dict)
            } else {
                ctx.zap.style = cetz.styles.merge(ctx.zap.style, style-dict)
            }
        }
        return ctx
    })
}

#let get-style(ctx) = {
    let zap-style = ctx.zap.style

    //TODO Definition of auto

    zap-style = resolve(zap-style)
    return zap-style
}
