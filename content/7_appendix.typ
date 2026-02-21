#show outline.entry: it => {
  context {
    let page-num = str(counter(page).at(it.element.location()).first())
    let num-label = if it.element.numbering != none {
      it.element.caption.supplement + " " + it.element.caption.numbering + it.element.caption.separator
    } else { "" }
      v(5pt, weak: true)
      grid(
        columns: (auto, 1fr, auto),
        align: (left + horizon, left + horizon, right + horizon),
        column-gutter: 4pt,
        text()[#h(it.level * 1em)#strong(num-label)#h(4pt)#it.element.caption.body],
        text(fill: black.lighten(25%))[#repeat(gap: 5pt)[.]],
        strong(text()[#page-num]),
        v(5pt)
      )
  }
}

#outline(
  title: [List of Figures],
  target: figure.where(kind: image)
)

#outline(
  title: [List of Tables],
  target: figure.where(kind: table)
)

#outline(
  title: [List of Code Listings],
  target: figure.where(kind: raw)
)