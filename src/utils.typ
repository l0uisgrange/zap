#let get-label-anchor(angle-deg) = {
    let angle = angle-deg.deg()
    let normalized-angle = calc.rem(if angle < 0 { angle + 360 } else { angle }, 360)

    let tolerance = 20

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
            return "north-west"
        } else if normalized-angle > 90 and normalized-angle < 180 {
            return "north-east"
        } else if normalized-angle > 180 and normalized-angle < 270 {
            return "north-west"
        } else {
            return "south-west"
        }
    }
}
