# Easy2DThermalSimulation
This is the first project I have done. It allows to thermally simulate a ligne in 1D, a rectangle in 2D and a cuboid in 3D by choosing the properties of the materials and others. It's full of mistakes, don't do much but I spent time there, learned a lot of programming basics while doing it and it's my first baby so I'm proud of it.
![alt text](https://github.com/MrBounty/EasyThermalSimulation/blob/main/Image/Capture.PNG)


# Introduction
The main program is called "Modelisation_Thermique_menu" and is separated into 3 parts that you choose when you start it. The first, called values, allows you to enter all the information useful for the calculations. The second is called simulation and makes it possible to launch the calculations. Finally, the last one is called graphics and allows you to draw the chosen graphic. There is also the possibility of resetting all the values using the 4th part, not necessary but useful to change dimension.
To start a new simulation you just have to start the program.


# Values
When we run the program for the first time, it asks us for the geometry of space.
You must enter 1, 2 or 3 for 1D, 2D or 3D.
Then depending on the size it will open this menu. Menu 1:
![alt text](https://github.com/MrBounty/EasyThermalSimulation/blob/main/Image/Menu1_1D.PNG)

Here this menu is for 1D, for 2D and 3D it also asks for the length, the number of points and the lambda for y and z. Basically they are at 0 and if we leave them at 0 they will have the same value as in x.

Then it opens another menu for the limit conditions, menu 2. You must enter the type of condition and the associated values for each limit. Type 1, imposed temperature; type 2, imposed h; type 3, imposed flow.
![alt text](https://github.com/MrBounty/EasyThermalSimulation/blob/main/Image/Menu2_1D.PNG)
In the example we see an imposed temperature of 20 ° C for limit 1 and a flow and 500W / m² for limit 2.
Limits are found here for 1D:
| Side number  | Where |
| ------------- | ------------- |
| 1  | left  |
| 2  | right  |
 
The limits are here for 2D:
| Side number  | Where |
| ------------- | ------------- |
| 1  | up  |
| 2  | right  |
| 3  | down  |
| 4  | left  |
 
For 3D the limits are the 6 surfaces, if we imagine a cube:
| Side number  | Where |
| ------------- | ------------- |
| 1  | up  |
| 2  | right  |
| 3  | down  |
| 4  | left  |
| 5  | front  |
| 6  | behind  |

In addition, there is another line called "More options". If we put 0, this part is finished but if we enter 1 then we have access to another menu. The menu 3.
![alt text](https://github.com/MrBounty/EasyThermalSimulation/blob/main/Image/Menu3_1D.PNG)
In this menu you can choose different things, either a flow on a limit or an internal power for a certain period of time, or different air temperatures for each limit.
If we put 1 for a flow at limit 1 then we have this menu to enter the power and the period.
![alt text](https://github.com/MrBounty/EasyThermalSimulation/blob/main/Image/Menu4_1D.PNG)
Finally the program outputs 3 matrices, V for the values of menu 1, H for the limits and O for the options.
When we relaunch the values part, we are asked what we want to change, menu 1, 2 or 3. Please note, if the options are not activated in menu 2 then we cannot open the
menu 3.
Once all the values entered we can move on to calculations


# Simulation
There is almost nothing to do in this part, just wait. It is separated from the first so as not to have to re-enter everything if you want to change a parameter.
In 1D and 2D you can choose if you want to stop the program after a certain time, if the temperatures are stable or both. The value to enter when choosing temperature stability corresponds to the average difference between the temperatures of the time step and the one before.
If the time step is too small and the system is not stable then the calculations will not be launched and we find the maximum value of the time step in the variables. It is called "dltatmax".
Once the calculations have been carried out, the program leaves a “Tresultats” matrix which corresponds to the temperature vector calculated for each time step.

# Chart
Depending on your size, the program lets you choose between several chart.

## 1D
| Number to enter  | Chart type |
| ------------- | ------------- |
| 1  | Temperatures as a function of time for the 2 sides and the center (if the number of points is even, the program takes the closest point)  |
| 2  | Temperature field for a given time  |
| 3  | Temperatures as a function of time for a point and a chosen period  |
| 4  | Temperature fields as a function of x which change over time for a chosen period (Does not work on Matlab r2014!)  |
| 5  | Average temperature as a function of time  |

## 2D
| Number to enter  | Chart type |
| ------------- | ------------- |
| 1  | Temperatures as a function of time for the 4 corners and the center (if the number of points is even, the program takes the closest point)  |
| 2  | Temperatures as a function of time for the 4 points in the middle of the limit lines and the center (if the number of points is even, the program takes the closest point)  |
| 3  | Temperatures as a function of x for a line and a chosen time  |
| 4  | Temperatures as a function of y for a line and a chosen time  |
| 5  | Temperatures as a function of x and y for a chosen time  |
| 6  | Temperatures as a function of time for a point and a chosen period  |
| 7  | Average temperature as a function of time  |

## 3D
| Number to enter  | Chart type |
| ------------- | ------------- |
| 1  | Temperatures as a function of time for the 8 corners and the center (if the number of points is even, the program takes the closest point)  |
| 2  | Temperatures as a function of time for the 6 points in the middle of the boundary surfaces and the center (if the number of points is even, the program takes the closest point)  |
| 3  | Temperatures as a function of x and z for a surface and a chosen time  |
| 4  | Temperatures as a function of y and z for a surface and a chosen time  |
| 5  | Temperatures as a function of x and y for a surface and a chosen time  |
| 6  | Average temperature as a function of time  |
