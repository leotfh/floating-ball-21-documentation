#import "../utils.typ": *

=	Troubleshooting
== Program not Deploying

If the program seems to not flash correctly after pressing the "Build & Deploy" button in the pop-up, the most likely culprit are the configuration parameters. Ensure that the "Build action" is set to "Build, load and run". This option seems to reset itself to "Build" when merging Simulink Models using Git.

#figure(
  rect(width: 100%, height: 13cm, fill: light-grey, radius: 15pt)[
    #align(center + horizon, text(fill: dept-color)[#image("img/general/Configuration_Parameters.png", width: 95%)])
  ],
  caption: [Simulink Configuration Parameters],
)

== GUI slow or unresponsive
This is a known issue and can be caused by various factors. One factor is, that App Designer runs in the same thread as MATLAB and therefore shares the same resources. If the GUI seems to be slow or unresponsive, try closing other applications that might be using a lot of system resources. Additionally, ensure that MATLAB has sufficient memory allocated and that no other heavy computations are running in the background.

== Step response too long in RPM Mode
When setting the height setpoint in RPM mode before clicking the step response button, the step response might be longer than expected. This is most likely caused by an incorrect conversion factor from height to RPM. Ensure that the conversion factor is set correctly according to the system's dimensions. If the problem persists, reconnect the arduino.

== Model not responding to changes in PID parameters
In older versions of the GUI, values smaller than 0.01 werer incorrectly converted in the serial string which led to a crash in the model itself. Resetiing the arduino and reconnecting it to the GUI should solve this issue.

== No response from height (ToF) sensor
If the height sensor does not seem to be responding, ensure that it is properly connected to the Arduino and that the cables are fine. If nothing else works, try replacing the sensor as it might be defective. 