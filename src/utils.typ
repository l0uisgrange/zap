#let get-label-anchor(angle-deg) = {
    let angle = angle-deg.deg()
    let normalized-angle = calc.rem(if angle < 0 { angle + 360 } else { angle }, 360)

    let tolerance = 15

    if calc.abs(normalized-angle) < tolerance {
        return ("south", "north")
    } else if calc.abs(normalized-angle - 90) < tolerance {
        return ("east", "west")
    } else if calc.abs(normalized-angle - 180) < tolerance {
        return ("north", "south")
    } else if calc.abs(normalized-angle - 270) < tolerance {
        return ("west", "east")
    } else {
        if normalized-angle > 0 and normalized-angle < 90 {
            return ("south-east", "north-west")
        } else if normalized-angle > 90 and normalized-angle < 180 {
            return ("north-east", "south-west")
        } else if normalized-angle > 180 and normalized-angle < 270 {
            return ("north-west", "south-east")
        } else {
            return ("south-west", "north-east")
        }
    }
}

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
