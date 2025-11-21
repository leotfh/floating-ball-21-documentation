#import "../utils.typ": *

= Introduction
This document serves as documentation and a guide for the Floating Ball System, developed by the Department of Electronic & Computer Engineering at FH JOANNEUM. 

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
    [Arduino Uno R4], [Minima (no WIFI / BLE)], [2], [18,50 €],
    [Motor], [PWM], [2], [32,20 €],
    [Other], [Wires, etc.], [2], [3,90 €],
    
    // Footer
    table.hline(stroke: 1pt + dept-color),
    [*Total*], [], [], [*109,20 €*]
  ),
  caption: [BOM for the Prototype],
)