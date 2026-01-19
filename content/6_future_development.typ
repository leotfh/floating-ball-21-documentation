#import "../utils.typ": *

= Future Development

#text(weight: "bold")[PCB Design for the Electronics]

To improve the reliability and ease of assembly of the electronics, a custom PCB could be designed to replace the breadboard setup. This would reduce wiring errors and improve the overall robustness of the system.

#text(weight: "bold")[Automatic Calibration]

Since the height of different systems is never the exact same it would be advantageous to set the offset distance between sensor and ball automatically when the ball is lying still. Measuring the moor RPM where the ball starts to lift off could be another approach. This feature was not implemented yet due to time constraints, but is very important to get a responsive PID controller.

#text(weight: "bold")[Exporting as a Standalone Application]

To make the GUI more accessible, it could be exported as a standalone application. This would allow users to run the GUI without needing to have MATLAB installed. This feature was not implemented yet due to time constraints and licensing issues.

#text(weight: "bold")[Version check mode]

A version check mode could be implemented to ensure that the user is always using the latest version of the Simulink model. This could be done by sending a version number from the Arduino to the GUI and comparing it with the latest version available. If the versions do not match, a pop-up could inform the user about the outdated version and ask the user to rebuild and flash the simulink model.

#text(weight: "bold")[Connecting Multiple Systems for Visualization of Data]

The idea is to connect multiple systems together to be able to visualize graphs like sine curves. This could either be done by letting the Arduinos talk to each other or by letting one Arudino control multiple systems.

#text(weight: "bold")[Automatic PID Tuning]

To make the system more user friendly an automatic PID tuning could be incorporated with the MATLAB PID Tuner. This would allow users to automatically tune the PID parameters for their specific system without having to manually calculate them. This feature was not implemented yet due to concerns about students not learning the underlying principles of PID tuning.

#text(weight: "bold")[Different GUI approaches]

The performance of the current GUI implementation is not perfect. If exporting as a standalone application is not feasible, different approaches for the GUI could be explored, such as a web-based GUI or a Python GUI. Another approach could be to use the Simulink external mode parameter tuning and visualization. This could possibly improve performance.