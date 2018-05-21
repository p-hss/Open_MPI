#!/bin/bash

#shell script tp run the code

#remove old executables

#compile and build the executable
mpif90 -o sum_vec sum_vec.f90 

#run the executable with 4 proccesses
mpirun -np 4 sum_vec
