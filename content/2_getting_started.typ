#import "../utils.typ": *

= Getting Started: Installation and Setup
==	Dependencies
The following list includes the required Add-Ons and Support Packages for MATLAB 2025b that need to be installed to be able to build and deploy the Simulink model:
 
#list(
  marker: "•",
  indent: 2em,
  tight: false,
  
  [Simulink],
  [MATLAB Coder],
  [Simulink Coder],
  [Embedded Coder],
  [MATLAB Support Package for Arduino Hardware],
  [Simulink Support Package for Arduino Hardware],
  [MATLAB Support for MinGW-w64 C/C++/Fortran Compiler],
  [Parallel Computing Toolbox])

==	Setting Up the MATLAB Project 
After installing the mandatory Add-Ons the
#link("https://github.com/Electronic-and-Computer-Engineering/FloatingBall2.1")[FloatingBall Github repository]
 can be cloned and opened in MATLAB.

To open the project navigate to the cloned repository and open the `Floating_Ball.prj` file.