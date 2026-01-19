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