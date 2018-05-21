# Open_MPI
Some simple test programs in fortran.

1. Rank Size: a simple hello world program, which determins rank and size of the
   processes.

2. Ping Pong: The program sends data from one processor to another, altering the
   content every time. Point-to-point communications are used only.

3. Sum Vec: Computes the sum of a vector filled with numbers, by sending set of
   rows to different processors and collecting the separate sums at the end.

4. Sin Integrate: Integrates the sin function by dividing the domain between the
   different processors. Each processors then integrate its part and the partial
   results are collected at the end.

