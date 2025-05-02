= Getting started

== Installation

Circuitor is easy to set up and works out of the box 📦 with Typst Universe. There are two main ways to start using the library, depending on your workflow.

=== Typst Universe package

If you're working in the #link("https://typst.app", [online Typst app]), you can import Circuitor directly with a single line:

```typst
#import "@preview/circuitor:0.1.0"
```

=== Local package

If you prefer to work offline or want to explore the source code, you can also use Circuitor by downloading it locally from the GitHub repository.

1. Clone or download #link("https://github.com/l0uigrange/circuitor", [the repository]) to your computer.

2. In your Typst project, import the `exports.typ` file located in the `src` folder:

```typst
#import "PATH_TO_CIRCUITOR/src/exports.typ"
```

Make sure the path reflects the actual location of the downloaded folder relative to your `.typ` file.

== Mimium requirements

This table shows the minimum required versions of Typst and CeTZ for each release of the Circuitor library.

#table(
  columns: 3,
  stroke: .6pt + luma(60%),
  [Circuitor], [Typst], [CeTZ],
  [`0.1.0`], [`0.13.1`], [`0.3.4`],
)

== Report bugs or suggest features and components

I actively maintain Circuitor and greatly value community feedback 💬.

If you encounter a bug 🐞, spot an incorrect symbol, or have an idea for a new feature or electrical component, feel free to open an issue or a discussion on the #link("https://github.com/l0uisgrange/circuitor/issues", [GitHub repository]).
