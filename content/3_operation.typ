#import "../utils.typ": *

=	Operating the Floating Ball System 
==	Building, Deploying, and Starting the Model
After opening the project the model must be built and deployed. This can be done automatically or manually.

=== Building and Deploying automatically
The easiest way to build the model and flash it onto the Arduino Uno R4 Minima is to type "main" into the MATLAB Command Window. This lets a pop-up window appear, which asks the user what should be done. The available options as shown in @Build_Deploy are "Build and Deploy", "Start GUI only" and "Cancel". When starting the FloatingBall System for the first time it is advised to select the "Build and Deploy" option to ensure the right program is flashed on the Arduino.

=== Building and Deploying manually
To build and deploy the program manually the Simulink file "FloatingBall.slx" needs to be opened. In the "Hardware" tab the program can be built and deployed.

#figure(
  rect(width: 100%, height: 9.5cm, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Build_Deploy.png", width: 95%)])
  ],
  caption: [Simulink Build and Deploy Button],
)<Build_Deploy>

==	Launching the Graphical User Interface (GUI)
As mentioned before the easiest way to start the program is to type "main" into the MATLAB Command Window. To only start the GUI select "Start GUI only" from the pop-up. This option is recommended if it is certain that the program is already flashed correctly. When selecting "Build and Deploy" the GUI starts automatically after the flashing process is finished.

==	Using the GUI Controls
#marker[*Doku when GUI is finished*] 

== Understanding the Simulink Model
=== General Overview
As can be seen  in @Simulink_Model the Simulink Model is devided into six areas. These areas aim to differentiate certain functionalities from the rest of the model. The top row is used for setting the motor speed, as well as measuring the distance and motor speed. The bottom row is used for variable definition and serial transmit and receive.

#figure(
  rect(width: 100%, height: 7.5cm, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Simulink_Model.png", width: 95%)])
  ],
  caption: [Simulink Model],
)<Simulink_Model>

=== Motor Control

//#block(
//  fill: light-grey,
//  inset: 10pt,
//  radius: 4pt,
//  width: 100%,
//  [
//    *Example Code (C++):*
//    #set text(font: "Courier New", size: 10pt)
//    ```cpp
//    void setup() {
//      pinMode(LED_BUILTIN, OUTPUT); // Initialize LED pin
//    }
//    ```
//  ]
//)

//== Adjusting Controller Parameters
//Here is an example of a table that could be used to document GUI controls or parameters.
//#figure(
//  table(
//    columns: (1fr, 1fr, 1fr, 1fr),
//    [*Parameter*], [*Description*], [*Recommended*], [*Default Value*],
//  
//    [Kp], [Proportional gain], [1.0], [1.0],
//    [Ki], [Integral gain], [1.0], [0.1],
//    [Kd], [Derivative gain], [1.0], [0.01],
//  ),
//  caption: [Controller Parameters],
//)