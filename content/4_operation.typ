#import "../utils.typ": *

=	Operating the Floating Ball System 
==	Building, Deploying, and Starting the Model
After opening the project the model must be built and deployed. This can be done automatically or manually.

=== Building and Deploying automatically
The easiest way to build the model and flash it onto the Arduino Uno R4 Minima is to type "main" into the MATLAB Command Window. This lets a pop-up window appear, which asks the user what should be done. The available options as shown in @Pop_up are "Build & Deploy", "Start GUI only" and "Cancel". When starting the FloatingBall System for the first time it is advised to select the "Build and Deploy" option to ensure the right program is flashed on the Arduino.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Pop_up.png", width: 95%)])
  ],
  caption: [GUI Pop-Up],
)<Pop_up>

=== Building and Deploying manually
To build and deploy the program manually the Simulink file "FloatingBall.slx" needs to be opened. In the "Hardware" tab the program can be built and deployed.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Build_Deploy.png", width: 95%)])
  ],
  caption: [Simulink Build and Deploy Button],
)<Build_Deploy>

==	Launching the Graphical User Interface (GUI)
As mentioned before the easiest way to start the program is to type "main" into the MATLAB Command Window. To only start the GUI select "Start GUI only" from the pop-up shown in @Pop_up. This option is recommended if it is certain that the program is already flashed correctly. When selecting "Build & Deploy" the GUI starts automatically after the flashing process is finished.

==	Using the GUI Controls
#marker[*Doku when GUI is finished*]
=== GUI General Overview
The GUI itself consists of three main aspects. The user input section, the data output section and the mode selection. The output section three different graphs can be found. One for the height of the ball, one for the motor speed and one for the operating voltage of the motor.

The input section is heavily dependent on the mode selected. Depending on the mode the user input consists different tuning parameters or input values.

As mentioned before the GUI offers multiple modes of operation to control the FloatingBall system. Following modes can be selected:

#marker[The names of  the modes have to be changed to be more intuitive in the GUI I think (Kristian)]

#list(
  marker: "•",
  indent: 2em,
  tight: false,
  
  [Manual Control],
  [Motor Controller],
  [PID Height Controller],
  [PID Motorspeed Controller],
  [Cascaded Controller])


=== Manual Control
This mode is mainly for demonstration purposes. In this mode the height of the ball is in direct correlation with the position of the sliding potentiometer. The goal of the manual control mode is to show that the control of the ball height is far more difficult than one might think.

As can be seen in @Motor_Poti the output is the input cast onto a double. The input is a voltage which is defined by a voltage divider between a resistor and the sliding potentiometer.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Motor_Poti.png", width: 95%)])
  ],
  caption: [Simulink Manual Control],
)<Motor_Poti>


=== Motor control

The "Motor Controller" mode is mainly used for testing purposes. The output is a step function of the PWM voltage used for the motor speed control. The PWM duty cycle is calculated with a 4th order polynomial which was experimentally determined by setting the duty cycle and measuring the motor speed.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Motor_Controller.png", width: 95%)])
  ],
  caption: [Simulink Motor Controller],
)<Motor_Controller>

=== Motor PID control
With the "Motor PID Controller" mode the motor can be controlled via a PID controller. The input is the desired motor speed and the output is the pwm duty cycle from 0-255. The implementation in Simulink can be seen in @Motor_PID_Controller.

To capture an impulse response consistently an additional feature was added. With the "Step Response" button a step response can be recorded. When pressing this button a step is applied to the motor after half a second. After ten seconds a new pop-up appears. With this pop-up the captured data can either be saved as .txt or .mat.

The PI values for the motor PI controller of the "FloatingBall-07" system found in @Motor_PID_Values were calculated with the step response feature.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Motor_PID_Controller.png", width: 95%)])
  ],
  caption: [Simulink Motor PID Controller],
)<Motor_PID_Controller>

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Motor_PID_Controller_Step.png", width: 95%)])
  ],
  caption: [Simulink Motor Step Response],
)<Motor_PID_Controller_Step>

#figure(
  table(
    columns: (1fr, 1fr),
    align: center,

    // Header
    [*$k_("p,motor")$*], [*$T_("i,motor")$*],

    // Data
    [1.13], [0.03],
  ),
  caption: [Motor PID values],
)<Motor_PID_Values>

=== Height PID control
All the following PID values are for the system "FloatingBall-07".

The following table shows the calculated PID values for the height controller. This values were determined using the Ziegler-Nichols method.

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
  caption: [Determined height PID values],
)

=== Motor PID control

The following table shows the calculated PID values for the motor controller.

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
)

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,

    // Header
    [*$k_("p,motor")$*], [*$T_("i,motor")$*], [*$T_("d,motor")$*], [*$n_("motor")$*],

    // Data
    [1.01], [0.8], [0], [0],
  ),
  caption: [Determined motor PID values],
)

=== Cascaded PID control

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,

    // Header
    [*$k_("p,motor")$*], [*$T_("i,motor")$*], [*$T_("d,motor")$*], [*$n_("motor")$*], [*$k_("p,height")$*], [*$T_("i,height")$*], [*$T_("d,height")$*], [*$n_("height")$*],

    // Data
    [1.13], [0.03], [0], [0], [0.87], [0.65], [0.16], [2],
  ),
  caption: [Cascaded PID values],
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
  caption: [Determined Cascaded PID values],
)