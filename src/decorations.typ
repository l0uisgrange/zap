#import "/src/dependencies.typ": cetz
#import cetz.draw: content, mark, line

// TODO flow, voltage {straight, european, american}

#let current-arrow(ctx, label) = {

  let (labelpos, arrowdir, arrowpos, currentlabel) = if type(label) == array {
    (label.first().contains(regex("[_]")), label.first().contains(regex("[<]")), label.first().starts-with(regex("[<|>]")), label.last())
  } else {
    // Default position (up, same dir as component, arrow at the end)
    (false, false, false, label)
  }

  let (width, height) = cetz.util.measure(ctx, currentlabel)

  if arrowpos {
    mark(("in", 50%, "component.west"), "out", symbol: if arrowdir {"<"} else {">"}, fill: black, scale: 0.8)
    content((rel: (0, height * if labelpos {-1} else {1} ), to: ("in", 50%, "component.west")), currentlabel)
  } else {
    mark(("component.east", 50%, "out"), "out", symbol: if arrowdir {"<"} else {">"}, fill: black, scale: 0.8)
    content((rel: (0, height * if labelpos {-1} else {1} ), to: ("component.east", 50%, "out")), currentlabel)
  }
}

#let flow-arrow(ctx, label) = {

  let (labelpos, arrowdir, arrowpos, currentlabel) = if type(label) == array {
    (label.first().contains(regex("[_]")), label.first().contains(regex("[<]")), label.first().starts-with(regex("[<|>]")), label.last())
  } else {
    // Default position (up, same dir as component, arrow at the end)
    (false, false, false, label)
  }

  let (width, height) = cetz.util.measure(ctx, currentlabel)

  let position = 10%

  if arrowpos {

    let start = ("in", position, "component.west")
    let end = ("in", 100% - position, "component.west")

    line((rel: (0, height * if labelpos {-1/2} else {1/2}), to: if arrowdir {end} else {start}),
    (rel: (0, height * if labelpos {-1/2} else {1/2}), to: if arrowdir {start} else {end}), 
    mark: (end: ">"), fill: black, scale: 0.8)

    content((rel: (0, height * if labelpos {-2} else {2} ), to: ("in", 50%, "component.west")), currentlabel)
  } else {

    let start = ("component.east", position, "out")
    let end = ("component.east", 100% - position, "out")

    line((rel: (0, height * if labelpos {-1/2} else {1/2}), to: if arrowdir {end} else {start}), 
    (rel: (0, height * if labelpos {-1/2} else {1/2}), to: if arrowdir {start} else {end})
    , mark: (end: ">"), fill: black, scale: 0.8)

    content((rel: (0, height * if labelpos {-2} else {2} ), to: ("component.east", 50%, "out")), currentlabel)
  }
}