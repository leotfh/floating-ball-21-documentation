#import "../utils.typ": *

=	Operating the Floating Ball System 
==	Building, Deploying, and Starting the Model
After opening the model the model must be built and deployed. This can be done automatically or manually.

=== Building and Deploying automatically
The easiest way to build the model and flash it onto the Arduino Uno R4 Minima is to type "main" into the MATLAB Command Window. This lets a pop-up window appear, which asks the user what should be done. The available options #marker[as shown in the picuture below] are "Build and Deploy", "Start GUI only" and "Cancel".

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