#!/bin/bash

#shell script tp run the code

#remove old executables

#compile and build the executable
mpif90 -o ping_pong ping_pong.f90

#run the executable with 4 proccesses
mpirun -np 4 ping_pong 
