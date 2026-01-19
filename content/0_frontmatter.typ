#import "../utils.typ": *
#import "@preview/nth:1.0.1": *

#set page(numbering: "i")

#let my-date(date) = nth(date.day()) + date.display(" of [month repr:long] [year]")

#align(center + horizon)[
  #image(
    "img/general/IEE_RGB.png",
    width: 10cm,
    height: 2cm,
    alt: "FH Logo Placeholder"
  )
  
  #v(5cm)
  
  #text(size: 32pt, weight: "bold")[Project Documentation] \
  #v(0.5cm)
  #text(size: 24pt)[Floating Ball 2.1]
  
  #v(5cm)
  
  
  #grid(
    columns: (auto, auto),
    gutter: 1em,
    align: top + left,
    strong("Authors:"), [Max Dandler \ Lucas Fink \ Anto Dzicic \ Kristian Seiner \ Leo Traußnigg],
    strong("Deadline:"), [#my-date(datetime.today())],
    strong("Version: "), [1.1]
  )
]

#pagebreak()
#outline()
#pagebreak()