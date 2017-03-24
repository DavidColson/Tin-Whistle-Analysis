# The Modes of Vibration of a Tin Whistle

This repository hosts the code and some files for my final year undergraduate physics project. The purpose of the project is to investigate the resonant frequencies of an irish tin whistle. Furthermore, analysis is being done on the systems of equations describing the tin whistle and the results are being compared to analysis of real tin whistle recordings to verify the model.

Currently the code finds and plots all the resonant frequencies within the given range into the function "FindModes". It supports changing the "openness" of each hole and the plots of pressure will update accodingly.

It works by treating the equations as an initial value problem and solves it along the length of the whistle using a second order runga kutta solver. If the pressure inside the whistle matches that of the expected pressure, it is a solution.

The code has been designed such that modification to suit other analysis is relatively easy. Such analysis as how does the resonant frequency change when various dimensions of the whistle are changed. This work has not been completed yet.

There are also a host of other minor use files for plotting various sources of data.
