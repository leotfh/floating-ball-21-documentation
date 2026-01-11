#import "../utils.typ": *

=	Operating the Floating Ball System 
After cloning the git repository and opening the project, the model must be built and deployed. This can be done with the Command Window or the MATLAB App Designer. It is recommended to use the App Designer since this method works better with different screen resolutions.

== Building, Deploying, Starting the Model using the App Designer GUI <App_Designer>
To launch the App Designer open the `FloatingBallGUI.mlapp` file located in the GUI folder.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/mlapp_file.png", width: 95%)])
  ],
  caption: [MATLAB App Designer file],
)<mlapp_file>

To start the App Designer GUI, press the Run button or press `F5`.
//#marker[The program should automatically be built and deployed.(?)]

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/start_mlapp.png", width: 95%)])
  ],
  caption: [MATLAB App Designer Run Button],
)<start_mlapp>

At the top left of the GUI, there is a "File" menu. By clicking on it, a drop-down menu appears. Here the "Flash" option can be selected to build and deploy the model onto the Arduino Uno R4 Minima. There is also an option to directly open the model in Simulink. A pop-up window will appear to inform the user about the progress of the build and deploy process. If the process is successful, a message will be displayed in the pop-up window.

#figure(
  rect(width: 50%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Flash_menu.png", width: 95%)])
  ],
  caption: [Flash Menu in App Designer GUI],
)<Flash_menu>

==	Building, Deploying, Starting the Model using the Command Window
As this is a legacy method, it should only be used as a fallback if the previously described procedure fails.

=== Building and Deploying automatically
The easiest way to build the model and flash it onto the Arduino Uno R4 Minima is to type "`main`" into the MATLAB Command Window. This lets a pop-up window appear, which asks the user what should be done. The available options as shown in @Pop_up are "Build & Deploy", "Start GUI only" and "Cancel". When starting the FloatingBall System for the first time, it is advised to select the "Build and Deploy" option to ensure the right program is flashed on the Arduino. Note that "Start GUI only" start the old GUI which is not recommended to use.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Pop_up.png", width: 95%)])
  ],
  caption: [Pop-Up for mode selection],
)<Pop_up>

=== Building and Deploying manually
To build and deploy the program manually, the Simulink file `FloatingBall.slx` needs to be opened. In the "Hardware" tab the program can be built and deployed.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Build_Deploy.png", width: 95%)])
  ],
  caption: [Simulink Build and Deploy Button],
)<Build_Deploy>


==	App Designer Graphical User Interface (GUI)
As mentioned before, the easiest way to start the program is to use the MATLAB App Designer. To start the App Designer follow the steps found in @App_Designer.

=== GUI overview 
The GUI is divided into three main aspects. The user input section, the data output section and the mode selection. The output section consists of three different graphs. One for the height of the ball, one for the motor speed and one for the operating voltage of the motor. There is also a menu bar at the top left for saving the data, as well as an "Arduino" menu for building and deploying the program and opening the Simulink model.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/App_Designer_GUI.png", width: 95%)])
  ],
  caption: [MATLAB App Designer GUI],
)<App_Designer_GUI>

The input section changes based on the mode selected. Depending on the mode selected, the user input section behaves differently.

== Input section
The input section is located on the lower left side of the GUI. Here the user can connect and disconnect the Arduino and set the desired parameters for the selected mode. 

=== Step Response
The "Step Response" button is used to measure and save the step response. It is possible to measure the step response in "RPM" (Open Loop) and "Height Control" mode.

== Operating Modes
The GUI offers multiple modes of operation to control the FloatingBall system. Following modes can be selected via the tabs at the top:

#list(
  marker: "•",
  indent: 2em,
  tight: false,
  
  [RPM],
  [Poti],
  [PID Height],
  [PID Motor],
  [PID Cascaded])

=== RPM 
The "RPM" mode is mainly used for testing purposes. The output is a step function of the PWM voltage used for the motor speed control. The PWM duty cycle is calculated with a 4th order polynomial which was experimentally determined by setting the duty cycle and measuring the motor speed. It is important to mention that in this mode there is no active control loop.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Motor_Controller.png", width: 95%)])
  ],
  caption: [Simulink RPM Control],
)<Motor_Controller>

=== Poti (Manual Control)
This mode is mainly for demonstration purposes. In this mode the height of the ball is in direct correlation with the position of the sliding potentiometer. The goal of the manual control mode is to show that the control of the ball height is far more difficult than one might think.

As can be seen in @Motor_Poti the output is the input cast onto a double. The input is a voltage which is defined by a voltage divider between a resistor and the sliding potentiometer.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Motor_Poti.png", width: 95%)])
  ],
  caption: [Simulink Manual Control],
)<Motor_Poti>

=== PID Height
The "PID Height" mode is used to control the height of the ball via a PID controller of the "FloatingBall-07" system. The inputs are the desired and current height. The output is a pwm duty cycle for the motor voltage from 0-255. The implementation can be found in @Height_PID_Controller.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Height_PID_Controller.png", width: 95%)])
  ],
  caption: [Simulink Height PID Controller],
)<Height_PID_Controller>

The following table shows the calculated PID values for the height controller of the "FloatingBall-07" system. This values were determined using the Ziegler-Nichols method.

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,

    // Header
    [*$k_("p,height")$*], [*$T_("i,height")$*], [*$T_("d,height")$*], [*$n_("height")$*],

    // Data
    [0.1], [0.08], [0.02], [2],
  ),
  caption: [calculated height PID values],
)

After some fine tuning the following values were used in the final implementation.

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,

    // Header
    [*$k_("p,height")$*], [*$T_("i,height")$*], [*$T_("d,height")$*], [*$n_("height")$*],

    // Data
    [0.1], [0.08], [0.02], [2],
  ),
  caption: [Experimentally determined height PID values],
)

=== PID Motor
With the "PID Motor" mode the motor can be controlled via a PID controller. The inputs are the desired and current motor speed. The output is the pwm duty cycle from 0-255. The implementation in Simulink can be seen in @Motor_PID_Controller.

The PI values for the PI motor controller of the "FloatingBall-07" system found in @Motor_PID_Values were calculated with the "StepResponse" mode.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Motor_PID_Controller.png", width: 95%)])
  ],
  caption: [Simulink Motor PID Controller],
)<Motor_PID_Controller>

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,

    // Header
    [*$k_("p,motor")$*], [*$T_("i,motor")$*], [*$T_("d,motor")$*], [*$n_("motor")$*],

    // Data
    [1.13], [0.03], [0], [0],
  ),
  caption: [Calculated motor PID values],
)<Motor_PID_Values>

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,

    // Header
    [*$k_("p,motor")$*], [*$T_("i,motor")$*], [*$T_("d,motor")$*], [*$n_("motor")$*],

    // Data
    [1.01], [0.8], [0], [0],
  ),
  caption: [Experimentally determined motor PID values],
)

=== PID Cascaded
With the "PID Cascaded" mode the height of the ball can be controlled with two cascaded PID controllers. This can be seen in @Cascaded_Controller. The "Height PID" and "Motor PID" subsystems are the same as the controllers in @Height_PID_Controller and @Motor_PID_Controller.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Cascaded_Controller.png", width: 95%)])
  ],
  caption: [Simulink Cascaded Controller],
)<Cascaded_Controller>

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,

    // Header
    [*$k_("p,motor")$*], [*$T_("i,motor")$*], [*$T_("d,motor")$*], [*$n_("motor")$*], [*$k_("p,height")$*], [*$T_("i,height")$*], [*$T_("d,height")$*], [*$n_("height")$*],

    // Data
    [1.13], [0.03], [0], [0], [0.87], [0.65], [0.16], [2],
  ),
  caption: [Calculated Cascaded PID values],
)

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,

    // Header
    [*$k_("p,motor")$*], [*$T_("i,motor")$*], [*$T_("d,motor")$*], [*$n_("motor")$*], [*$k_("p,height")$*], [*$T_("i,height")$*], [*$T_("d,height")$*], [*$n_("height")$*],

    // Data
    [1.01], [0.08], [0], [0], [0.64], [0.4], [0.04], [5],
  ),
  caption: [Experimentally determined Cascaded PID values],
)