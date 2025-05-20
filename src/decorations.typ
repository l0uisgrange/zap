#import "/src/dependencies.typ": cetz
#import cetz.draw: content, mark, line, bezier-through, catmull, hobby

// TODO voltage {straight, european, american}

#let current-arrow(ctx, label) = {

  let (labelpos, arrowdir, arrowpos, currentlabel) = if type(label) == array {
    (label.first().contains(regex("[_]")), label.first().contains(regex("[<]")), label.first().starts-with(regex("[<|>]")), label.last())
  } else {
    // Default position (up, same dir as component, arrow at the end)
    (false, false, false, label)
  }

  let (width, height) = cetz.util.measure(ctx, currentlabel)

  if arrowpos {
    mark(
      ("in", 50%, "component.west"),
      "out", 
      symbol: if arrowdir {"<"} else {">"}, 
      fill: black, 
      scale: 0.8
      )

    content((rel: (0, height * if labelpos {-1} else {1} ), to: ("in", 50%, "component.west")), currentlabel)
  } else {
    mark(
      ("component.east", 50%, "out"), 
      "out", 
      symbol: if arrowdir {"<"} else {">"}, 
      fill: black, 
      scale: 0.8
      )

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

    line(
      (rel: (0, height * if labelpos {-1/2} else {1/2}), to: if arrowdir {end} else {start}),
      (rel: (0, height * if labelpos {-1/2} else {1/2}), to: if arrowdir {start} else {end}), 
      mark: (end: ">"), 
      fill: black, 
      scale: 0.8
      )

    content((rel: (0, height * if labelpos {-2} else {2} ), to: ("in", 50%, "component.west")), currentlabel)
  } else {

    let start = ("component.east", position, "out")
    let end = ("component.east", 100% - position, "out")

    line(
      (rel: (0, height * if labelpos {-1/2} else {1/2}), to: if arrowdir {end} else {start}), 
      (rel: (0, height * if labelpos {-1/2} else {1/2}), to: if arrowdir {start} else {end}), 
      mark: (end: ">"), 
      fill: black, 
      scale: 0.8
      )

    content((rel: (0, height * if labelpos {-2} else {2} ), to: ("component.east", 50%, "out")), currentlabel)
  }
}

#let european-voltage(ctx, label, p-rotate) = {

  let (labelpos, arrowdir, currentlabel) = if type(label) == array {
    (label.first().contains(regex("[_]")), label.first().contains(regex("[<]")), label.last())
  } else {
    // Default position (up, same dir as component, arrow at the end)
    (false, false, label)
  }

  let (width, height) = cetz.util.measure(ctx, currentlabel)
  let new-position = (width / 2 * calc.abs(calc.sin(p-rotate)) + height / 2 * calc.abs(calc.cos(p-rotate)))

  let position = 40%

  let start = (rel: (0, .14 * if labelpos {-1} else {1}), to: ("component.west", position, "in"))
  let end = (rel: (0, .14 * if labelpos {-1} else {1}), to: ("component.east", position, "out"))
  let center = (rel: (0, .25 * if labelpos {-1} else {1}), to: if labelpos {"component.south"} else {"component.north"})

  if arrowdir {

    hobby(end, center, start, mark: (end: ">", fill: black), scale: 0.8)
    content((rel: (0, 4pt), to: ((rel: (0, new-position), to: center))), currentlabel)
  } else {

    hobby(start, center, end, mark: (end: ">", fill: black), scale: 0.8)
    content((rel: (0, 4pt), to: ((rel: (0, new-position), to: center))), currentlabel)
  }
}