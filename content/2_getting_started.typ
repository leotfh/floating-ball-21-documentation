#import "../utils.typ": *

= Getting Started: Installation and Setup
The Floating Ball project is dependend on the MATLAB version 2025b and the following Add-Ons and Support Packages. Older versions won't work, newer versions might work but haven't been tested yet.
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
After installing the correct versions of MATLAB and the mandatory Add-Ons the
#link("https://github.com/Electronic-and-Computer-Engineering/FloatingBall2.1")[FloatingBall Github repository]
 can be cloned and opened in MATLAB.

To open the project, navigate to the cloned repository and double-click the `Floating_Ball.prj` file to open the MATLAB project or open it via the menu strip (Open > Project) in MATLAB directly.