#import "../utils.typ": *

=	Operating the Floating Ball System 
==	Building, Deploying, and Starting the Model
After opening the project the model must be built and deployed. This can be done automatically or manually.

=== Building and Deploying automatically
The easiest way to build the model and flash it onto the Arduino Uno R4 Minima is to type "main" into the MATLAB Command Window. This lets a pop-up window appear, which asks the user what should be done. The available options as shown in @Build_Deploy are "Build and Deploy", "Start GUI only" and "Cancel". When starting the FloatingBall System for the first time it is advised to select the "Build and Deploy" option to ensure the right program is flashed on the Arduino.

=== Building and Deploying manually
To build and deploy the program manually the Simulink file "FloatingBall.slx" needs to be opened. In the "Hardware" tab the program can be built and deployed.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Build_Deploy.png", width: 95%)])
  ],
  caption: [Simulink Build and Deploy Button],
)<Build_Deploy>

==	Launching the Graphical User Interface (GUI)
As mentioned before the easiest way to start the program is to type "main" into the MATLAB Command Window. To only start the GUI select "Start GUI only" from the pop-up. This option is recommended if it is certain that the program is already flashed correctly. When selecting "Build and Deploy" the GUI starts automatically after the flashing process is finished.

==	Using the GUI Controls
#marker[*Doku when GUI is finished*] 

== Understanding the Simulink Model
=== General Overview
As can be seen  in @Simulink_Model the Simulink Model is divided into six areas. These areas aim to differentiate certain functionalities from the rest of the model. The top row is used for setting the motor speed, as well as measuring the distance and motor speed. The bottom row is used for variable definition and serial transmit and receive.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Simulink_Model.png", width: 95%)])
  ],
  caption: [Simulink Model],
)<Simulink_Model>

=== Motor Control
There are two different areas dedicated for the motor control. The area which is labeled "Motor Speed Control" accommodates the subsystem for the different controllers as well as the output parameters for the Arduino pin.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Simulink_Model_Motor_Speed_Control.png", width: 95%)])
  ],
  caption: [Simulink Model Motor Speed Control],
)<Simulink_Model_Motor_Speed_Control>

The area "Read Motor Speed" is responsible for measuring the current motor speed. This is done by calculating the time between two interrupts. Interrupts occur twice per rotation.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Simulink_Model_Motor_Speed_Read.png", width: 95%)])
  ],
  caption: [Simulink Model Motor Speed Read],
)<Simulink_Model_Motor_Speed_Read>



=== Distance Sensor
Between the two motor control areas the "Distance Sensor" area can be found. Here the IO Device Builder block "VL53L1X_Driver" as well as the calculation for the height can be found. For the height calculation it is important to enter the distance between the sensor and the top of the ball when the ball is at the lowest position.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Simulink_Model_Distance_Sensor.png", width: 95%)])
  ],
  caption: [Simulink Model Distance Sensor],
)<Simulink_Distance_Sensor>

The "VL53L1X_Driver" block is auto code generated with the IO Device Builder tool. This blocks links the Simulink Model with the "VL53L1X_Driver.cpp" file which is needed for the TOF distance sensor. This file can be found in "Main\Simulink\Sensor\VL53L1X_Driver". It is important to mention that the "VL53L1X_Driver.cpp" is programmed in such a way that the sampling frequency of the distance sensor is independent from the Simulink model sampling frequency. This was done to ensure a higher frequency for the inner controller (motor controller) of the cascaded controller. If the sampling frequency of the distance sensor needs to be changed the functions "sensor.setMeasurementTimingBudget()" and "sensor.setMeasurementTimingBudget()" need to edited.

#block(
  fill: light-grey,
  inset: 10pt,
  radius: 15pt,
  width: 100%,
  [
    *VL53L1X_Driver.cpp:*
    #set text(font: "Courier New", size: 10pt)

    ```cpp
#include <Arduino.h>
#include <Wire.h>
#include <VL53L1X.h>
#include "VL53L1X_Driver.h"

// global variables
VL53L1X sensor;
uint16_t lastDistance = 0;
bool sensorInitialized = false;

extern "C" {

    void setupFunctionVL53L1X_Driver(uint16_t *blockParam, int paramSize) {
        Wire.begin();
        Wire.setClock(400000); // I2C 400kHz

        sensor.setTimeout(500);
        if (!sensor.init()) {
            sensorInitialized = false;
            return;
        }
        
        sensorInitialized = true;
        
        // set Distance Mode (Short, Medium, Long)
        sensor.setDistanceMode(VL53L1X::Short);
        
        // set Measurement Timing Budget  (min. 20ms for Short, 33ms for Medium/Long)
        sensor.setMeasurementTimingBudget(20000);

        sensor.startContinuous(20); 
    }

    void stepFunctionVL53L1X_Driver(uint16_t *distance, int size, uint16_t *blockParam, int paramSize) {
        if (!sensorInitialized) {
            *distance = 0;
            return;
        }

        // save most recent value
        if (sensor.dataReady()) {
            lastDistance = sensor.read(false); 
        }
        
        // return most recent value
        *distance = lastDistance;
    }
}
    ```
  ]
)

=== Serial Transmission
The logic of the serial transmission is split into two areas. The "Serial Transmit" area is responsible for sending data (elapsed time, distance, motor speed and voltage) back to the host computer for plotting and logging purposes.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img\general\Simulink_Model_Serial_Transmit.png", width: 95%)])
  ],
  caption: [Simulink Model Serial Transmit],
)<Simulink_Serial_Transmit>

The "Serial Receive" splits the input into several smaller parts and writes the values to the corresponding variables. The input includes data like PID values and the mode set by the user.

#figure(
  rect(width: 100%, height: auto, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img\general\Simulink_Model_Serial_Receive.png", width: 95%)])
  ],
  caption: [Simulink Model Serial Transmit],
)<Simulink_Serial_Receive>