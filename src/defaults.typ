#let initial-defaults = (
  stroke: 1pt,
  color: black,
  line-cap: "square"
)

#let defaults = state("circuitor-defaults", initial-defaults)

#let circuitor(..settings) = {
    defaults.update(current => {
        current + settings.named()
    })
}

#let get-defaults() = defaults.get()