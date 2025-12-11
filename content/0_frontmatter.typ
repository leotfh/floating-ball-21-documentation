#import "../utils.typ": *

#set page(numbering: "i")

#align(center + horizon)[
  #image(
    "img/general/IEE_RGB.png",
    width: 10cm,
    height: 2cm,
    alt: "FH Logo Placeholder"
  )

  
  #v(1cm)
  
  //#text(size: 12pt, fill: dark-grey)[FH JOANNEUM] \
  //#text(size: 14pt, weight: "bold", fill: dept-color)[Electronic and Computer Engineering]
  
  #v(2cm)
  
  #text(size: 24pt, weight: "bold")[Project Documentation] \
  #v(0.5cm)
  #text(size: 16pt)[Floating Ball 2.1]
  
  #v(3cm)
  
  #grid(
    columns: (auto, auto),
    gutter: 1em,
    align: left,
    strong("Authors:"), [Max Dandler \ Lucas Fink \ Anto Dzicic \ Kristian Seiner \ Leo Traußnigg],
    strong("Deadline:"), [19. November 2025],
    strong("Version: "), [1.0]
  )
]

#pagebreak()
#outline(depth: 1)
#pagebreak()