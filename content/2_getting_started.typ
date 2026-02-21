#import "../utils.typ": *

= Getting Started: Installation and Setup
==	Dependencies
The Floating Ball project is dependend on MATLAB R2025b as well as the following Add-Ons and Support Packages. Older versions won't work, as the Arduino Uno R4 Minima is a specific hardware requirement. Newer versions might work but haven't been tested.

The following Add-Ons and Support Packages for MATLAB R2025b need to be installed to be able to build and deploy the Simulink model and run the GUI:

#table(
  columns: (auto, auto, auto),
  align: (x, y) => (left, left, left).at(x),
  
  [*Dependency*], [*Purpose*], [*Version*],
  [Simulink], [Used for modeling and simulating the control system], [R2025b/25.2],
  [MATLAB Coder], [Used for generating C code from MATLAB functions], [R2025b/25.2],
  [Simulink Coder], [Used for generating C code from Simulink models], [R2025b/25.2],
  [Embedded Coder], [Used for optimizing generated code for embedded systems], [R2025b/25.2],
  [MATLAB Support Package for Arduino Hardware], [Provides support for programming Arduino boards with MATLAB], [R2025b/25.2],
  [Simulink Support Package for Arduino Hardware], [Provides support for programming Arduino boards with Simulink], [R2025b/25.2],
  [MATLAB Support for MinGW-w64 C/C++/Fortran Compiler], [Required for compiling generated code on Windows], [R2025b/25.2],
  [Parallel Computing Toolbox], [Used to speed up simulations and code generation], [R2025b/25.2],
)

==	Setting Up the MATLAB Project 
After installing the correct versions of MATLAB and the mandatory Add-Ons, the
#link("https://github.com/Electronic-and-Computer-Engineering/FloatingBall2.1")[FloatingBall 2.1 Project repository] can be cloned and opened in MATLAB.

To open the project, navigate to the cloned repository and double-click the `Floating_Ball.prj` file to open the MATLAB project or open it via the menu strip (Open > Project) in MATLAB directly.