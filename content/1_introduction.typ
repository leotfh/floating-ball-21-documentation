#import "../utils.typ": *

//Link-Definitions
#let Arduino_Datasheet = "https://docs.arduino.cc/resources/datasheets/ABX00080-datasheet.pdf"
#let PWM_Motor_Datasheet = "https://publish.sanyodenki.com/library/books/San_Ace_E/book/#target/page_no=274"
#let VL53L1X_Datasheet = "https://www.st.com/resource/en/datasheet/vl53l1x.pdf"
#let Potentiometer_Datasheet = "https://4donline.ihs.com/images/VipMasterIC/IC/BOUR/BOUR-S-A0011028503/BOUR-S-A0011028503-1.pdf?hkey=6D3A4C79FDBF58556ACFDE234799DDF0"

= Introduction
This document serves as documentation and a guide for the Floating Ball System, developed by the Institute Electronic Engineering at FH JOANNEUM. 

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
    [Microcontroller], [#link(Arduino_Datasheet)[Arudino Uno R4 Minima]], [1], [20,72 €],
    [PWM Motor], [#link(PWM_Motor_Datasheet)[SAN ACE B97]], [1], [32,20 €],
    [Distance Sensor], [#link(VL53L1X_Datasheet)[VL53L1X TOF Sensor]], [1], [16,50€],
    [Tube], [height variable], [1], [#marker[insert price here]],
    [Potentiometer], [#link(Potentiometer_Datasheet)[Bourns Potentiometer]], [1], [5,50€], 
    [Other], [Wires, etc.], [1], [3,90 €],
    
    // Footer
    table.hline(stroke: 1pt + dept-color),
    [*Total*], [], [], [#marker[*insert total here*]]
  ),
  caption: [BOM for the Prototype],
)