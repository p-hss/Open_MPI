#!/bin/bash

#shell script tp run the code

#remove old executables

#compile and build the executable
mpif90 -o sin_integrate sin_integrate.f90 

#run the executable with 4 proccesses
mpirun -np 4 sin_integrate
