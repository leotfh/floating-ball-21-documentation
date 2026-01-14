#import "../utils.typ": *

= Future Development
==	Connecting Multiple Systems for Visualization of Data
The idea is to connect multiple systems together to be able to visualize graphs like sine curves. This could either be done by letting the Arduinos talk to each other or by letting one Arudino control multiple systems.

== Automatic Calibration
Since the height of different systems is never the exact same it would be advantageous to set the offset distance between sensor and ball automatically when the ball is lying still.

== Automatic PID Tuning
To make the system more user friendly an automatic PID tuning could be incorporated with the MATLAB PID Tuner. This would allow users to automatically tune the PID parameters for their specific system without having to manually calculate them. This feature was not implemented yet due to concerns about students not learning the underlying principles of PID tuning.

== Version check mode
A version check mode could be implemented to ensure that the user is always using the latest version of the Simulink model. This could be done by sending a version number from the Arduino to the GUI and comparing it with the latest version available. If the versions do not match, a pop-up could inform the user about the outdated version and ask the user to rebuild and flash the simulink model.

== Different GUI approaches
The performance of the current GUI implementation is not perfect. Different approaches for the GUI could be explored, such as a web-based GUI or a standalone application. Another approach could be to use the Simulink external mode parameter tuning and visualization. This could possibly improve performance.