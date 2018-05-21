#!/bin/bash

#shell script tp run the code

#remove old executables

#compile and build the executable
mpif90 -o rank_size rank_size.f90

#run the executable with 4 proccesses
mpirun -np 4 rank_size 
