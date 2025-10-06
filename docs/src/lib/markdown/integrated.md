---
title: Integrated circuits
subtitle: With Zap, you can also draw IC schematics in just a second, and have a lot of freedom regarding the customization.
---

## Microcontroller Unit

The `mcu` is the most complex component, hence this dedicated page. 

![](/docs/mcu.svg)

```typst
#let pins = (
    (content: "VCC", side: "west"),
    (content: "UVCC", side: "west"),
    (content: "AVCC", side: "west"),
    (side: "west"),
    (content: "PD0", side: "west"),
    (content: "PD1", side: "west"),
    // ...
)

#zap.circuit({
    import zap: *
    
    mcu("mcu",
        (3, 0),
        pins: pins, // you can also provide a number instead of a list
        label: "ESP32",
        width: 4,
        fill: purple.lighten(80%),
        stroke: none
    )
})
```

You have to provide either a number of pins or a complete list of dictionaries. Each pin can have these keys:

- `content` is the label of the pin displayed on the controller. If not provided, the pin is considered as a gap instead of an actual pin.
- `side` represents the position of the pin on the microcontroller