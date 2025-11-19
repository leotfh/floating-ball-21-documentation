// --- 1. Corporate Design: Abteilung Electronic & Computer Engineering ---

// HAUPTFARBE: Hier ändern!
// Option A: FH Engineering Grün (Standard für Technik-Departments)
#let dept-color = rgb("#00afcb") 

// Option B: Falls ihr lieber ein "Tech-Blau" wollt (Kommentar entfernen):
// #let dept-color = rgb(0, 80, 155) 

#let dark-grey = rgb(60, 60, 60)
#let light-grey = rgb(245, 245, 245)

// --- 2. Seitenlayout & Header ---
#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 3.5cm, bottom: 3cm),
  
  // HEADER: Department Branding
  header: context {
    set text(size: 10pt)
    grid(
      columns: (1fr, auto),
      // Links: Department Name in der Abteilungsfarbe
      align(left, text(fill: dept-color, weight: "bold")[Department Electronic & Computer Engineering]),
      // Rechts: Gruppenname
      align(right, [Group Floating Ball 2.1]), 
    )
    v(-6pt)
    // Linie in der Abteilungsfarbe für Kohärenz 
    line(length: 100%, stroke: 1pt + dept-color) 
  },

  // FOOTER
  footer: context {
    set text(size: 9pt, fill: dark-grey)
    line(length: 100%, stroke: 0.5pt + gray)
    grid(
      columns: (1fr, 1fr, 1fr),
      align(left, [Continuous Assessment 2025/26]),
      align(center, []),
      align(right, counter(page).display())
    )
  }
)
#set page(numbering: "i")
#set heading(numbering: "1.1")

// --- 3. Typografie (Look and Feel) ---
#set text(
  font: "Arial", // Oder "Roboto", "Liberation Sans"
  size: 11pt,
  lang: "de"
)

// Layout für bessere Lesbarkeit (White space [cite: 5])
#set par(
  justify: true, 
  leading: 0.7em,
  spacing: 1.2em 
)
// Mache "Abbildung X" in Beschriftungen fett
#show figure.caption: it => [
  #strong[#it.supplement #context it.counter.display(it.numbering)]: #it.body
]
// --- 4. Überschriften-Hierarchie (Coherence & Hierarchy ) ---
// Level 1: Groß, Abteilungsfarbe
#show heading.where(level: 1): it => {
  set text(fill: dept-color, weight: "bold", size: 16pt)
  v(0.5em)
  it
  v(0.3em)
}

#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true) // Etwas Abstand vor neuen Kapiteln
  strong(it)          // Macht den Eintrag fett
}

// Level 2: Schwarz, etwas kleiner
#show heading.where(level: 2): it => {
  set text(fill: black, weight: "bold", size: 13pt)
  v(0.3em)
  it
  v(0.2em)
}

// Level 3: Grau, Unterscheidung zur Ebene 2
#show heading.where(level: 3): it => {
  set text(fill: dark-grey, weight: "bold", size: 11pt)
  it
  v(0.1em)
}

// ---------------------------------------------------------
// INHALT (Sample Design [cite: 9])
// ---------------------------------------------------------

// TITELSEITE
#align(center + horizon)[
  // Logo Platzhalter (oder Text)
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
#outline(indent: auto, title: "Table of Contents")
#pagebreak()

// 1. Nummerierungs-Stil auf Arabisch (1, 2, 3) setzen
#set page(numbering: "1")

// 2. Den Zähler hart auf 1 zurücksetzen
#counter(page).update(1)

// DOKUMENT BODY

= Introduction
This document serves as documentation and a guide for the Floating Ball System, developed by the Department of Electronic & Computer Engineering at FH JOANNEUM.  

== Goal
This project aims to show the principles of control engineering using a floating ball system. Students are supposed to learn how to use and parameterize PID controllers in MATLAB/Simulink and operate the system via a graphical user interface (GUI).

= Getting Started: Installation and Setup
==	Installing Required Add-Ons 
The required Add-Ons for MATLAB and Simulink can be found in the following list:
#list(
  marker: "•",
  indent: 2em,
  tight: false,
  [Simulink Support Package for Arduino Hardware],
  [MATLAB 2025b],
    [MATLAB Coder],
    [Simulink Coder],
    [Embedded Coder],
    [Arduino Support Packge for MATLAB],
    [Arduino Support Packge for Simulink])


==	Setting Up the MATLAB Project 
==	Configuring Simulink
=	Operating the Floating Ball System 
==	Building, Deploying, and Starting the Model 
Here is an example that shows how to include technical code or diagrams, as required for the documentation.

// Beispiel für eine Code-Box (wichtig für ECE)
#block(
  fill: light-grey,
  inset: 10pt,
  radius: 4pt,
  width: 100%,
  [
    *Beispiel Code (C++):*
    #set text(font: "Courier New", size: 10pt)
    ```cpp
    void setup() {
      pinMode(LED_BUILTIN, OUTPUT); // Initialize LED pin
    }
    ```
  ]
)

=== Schaltpläne und Bilder
Images are centered and the numbering should be bold:

#figure(
  rect(width: 80%, height: 3cm, fill: rgb(230, 240, 230), radius: 5pt)[
    #align(center + horizon, text(fill: dept-color)[*Insert circuit diagram here*])
  ],
  caption: [Block diagram of the circuit],
)

#lorem(60)

==	Launching the Graphical User Interface (GUI) 
==	Using the GUI Controls 
== Adjusting Controller Parameters
=	Troubleshooting and Future Development 
==	Known Issues 
===	 GUI Bugs 
===	 GUI Structural Limitations 
===	 Setup Problems
==	Potential Improvements and enhancements
===	Connecting Multiple Systems for Visualization of Data