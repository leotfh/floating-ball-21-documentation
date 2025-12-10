#import "../utils.typ": *

= Introduction
This document serves as documentation and a guide for the Floating Ball System, developed by the Institute of Electronic & Computer Engineering at FH JOANNEUM. 

== Goal
This project aims to show the principles of control engineering using a floating ball system. Students are supposed to learn how to use and parameterize PID controllers in MATLAB/Simulink and operate the system via a graphical user interface (GUI).

== Bill of Materials (BOM)

#figure(
  table(
    columns: (auto, 2fr, 1fr, auto),
    align: (x, y) => (left, left, center, right).at(x),
    
    // Header
    [*Component*], [*Description*], [*Quantity*], [*Price*],
    
    // Data
    [Microcontroller], [#link("https://docs.arduino.cc/resources/datasheets/ABX00080-datasheet.pdf")[Arudino Uno R4 Minima]], [1], [20,72 €],
    [PWM Motor], [SAN ACE B97], [1], [32,20 €],
    [Distance Sensor], [VL53L1X TOF Sensor], [1], [16,50€],
    [Tube], [height variable], [1], [#marker[insert price here]],
    [Potentiometer], [Bourns Potentiometer], [1], [5,50€], 
    [Other], [Wires, etc.], [1], [3,90 €],
    
    // Footer
    table.hline(stroke: 1pt + dept-color),
    [*Total*], [], [], [#marker[*insert total here*]]
  ),
  caption: [BOM for the Prototype],
)