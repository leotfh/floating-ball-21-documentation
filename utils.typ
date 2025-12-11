#let dept-color = rgb("#00afcb") // FH ECE Color 

#let dark-grey = rgb(60, 60, 60)
#let light-grey = rgb(245, 245, 245)

#let marker(body) = highlight(fill: yellow.lighten(50%), body)

#let project-title = "Floating Ball 2.1 Documentation"

#let project-layout(doc) = {

  set page(
    paper: "a4",
    margin: (left: 2.5cm, right: 2.5cm, top: 3.5cm, bottom: 3cm),
    header: context {
      set text(size: 10pt)
      grid(
        columns: (1fr, auto),
        align(left, text(fill: dept-color, weight: "bold")[ Electronics and Computer Engineering]),
        align(right, text(fill: dept-color)[Group C]), 
      )
      v(-6pt)
      line(length: 100%, stroke: 1pt + dept-color) 
    },
    footer: context {
      set text(size: 9pt, fill: rgb(60, 60, 60))
      line(length: 100%, stroke: 0.5pt + gray)
      
      let headers = query(heading.where(level: 1).before(here()))
      
      let current-chapter = if headers.len() > 0 {
        headers.last().body
      } else {
        [] 
      }

      grid(
        columns: (1fr, 1fr, 1fr),
        align(left, [Floating Ball 2.1]), 
        align(center, text(style: "italic")[#current-chapter]),
        align(right, counter(page).display())
      )
    },
    numbering: "1"
  )
  
  set text(font: "Arial", size: 11pt, lang: "en")
  set heading(numbering: "1.1")
  
  set par(
    justify: true, 
    leading: 0.7em,
    spacing: 1.2em 
  )

  show figure.caption: it => [
    #strong[#it.supplement #context it.counter.display(it.numbering)]: #it.body
  ]


  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }

  show heading.where(level: 1): it => {
    set text(fill: dept-color, weight: "bold", size: 16pt)
    v(0.5em)
    it
    v(0.3em)
  }

  show heading.where(level: 2): it => {
    set text(fill: black, weight: "bold", size: 13pt)
    v(0.3em)
    it
    v(0.2em)
  }

  show heading.where(level: 3): it => {
    set text(fill: dark-grey, weight: "bold", size: 11pt)
    it
    v(0.1em)
  }

  show link: it => {
    set text(fill: blue)
    underline(it) 
  }
  
  set table(
    columns: (auto, auto, auto),
    align: left,
    inset: 10pt,
    stroke: none,
    fill: (x, y) => 
      if y == 0 { dept-color.lighten(80%) } 
      else if calc.even(y) { light-grey } 
      else { white }
  )

  doc
}