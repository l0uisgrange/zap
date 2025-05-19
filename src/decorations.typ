#import "/src/dependencies.typ": cetz
#import cetz.draw: content, mark

// TODO current, flow, voltage {straight, european, american}

#let current-arrow(ctx, label) = {

  let (labelpos, arrowdir, arrowpos, currentlabel) = if type(label) == array {
    (label.first().contains(regex("[\^]")), label.first().contains(regex("[<]")), label.first().starts-with(regex("[<|>]")), label.last())
  } else {
    // Default position (below, same dir as component, arrow at the end)
    (false, false, false, label)
  }

  let (width, height) = cetz.util.measure(ctx, currentlabel)

  if arrowpos {
    mark(("in", 50%, "component.west"), "out", symbol: if arrowdir {"<"} else {">"}, fill: black, scale: 0.8)
    content((rel: (0, height * if labelpos {1} else {-1} ), to: ("in", 50%, "component.west")), currentlabel)
  } else {
    mark(("component.east", 50%, "out"), "out", symbol: if arrowdir {"<"} else {">"}, fill: black, scale: 0.8)
    content((rel: (0, height * if labelpos {1} else {-1} ), to: ("component.east", 50%, "out")), currentlabel)
  }
}