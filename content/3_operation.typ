#import "../utils.typ": *

=	Operating the Floating Ball System 
==	Building, Deploying, and Starting the Model 
Here is an example that shows how to include technical code or diagrams, as required for the documentation.

#block(
  fill: light-grey,
  inset: 10pt,
  radius: 4pt,
  width: 100%,
  [
    *Example Code (C++):*
    #set text(font: "Courier New", size: 10pt)
    ```cpp
    void setup() {
      pinMode(LED_BUILTIN, OUTPUT); // Initialize LED pin
    }
    ```
  ]
)

=== Diagrams and Schematics
Images are centered and the numbering should be bold:

#figure(
  rect(width: 80%, height: 5cm, fill: light-grey, radius: 20pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/diagrams/Cascade.jpg", width: 80%)])
  ],
  caption: [Block diagram of the circuit],
)

#lorem(60)

==	Launching the Graphical User Interface (GUI) 
==	Using the GUI Controls 
== Adjusting Controller Parameters
Here is an example of a table that could be used to document GUI controls or parameters.
#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    [*Parameter*], [*Description*], [*Recommended*], [*Default Value*],
  
    [Kp], [Proportional gain], [1.0], [1.0],
    [Ki], [Integral gain], [1.0], [0.1],
    [Kd], [Derivative gain], [1.0], [0.01],
  ),
  caption: [Controller Parameters],
)