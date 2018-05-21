program main
    !include MPI module
    use mpi
    implicit none

    !data declarations
    integer :: ierr         !error signal variable. standart value = 0
    integer :: rank         !process ID (pid) / number    
    integer :: nprocs       !number of processes

    !status variable - tells the status of send/receive calls
    !Needed for receive subroutine
    integer, dimension(MPI_STATUS_SIZE) :: status1

    !variable for neighbouring process
    integer :: left=0, centre=0, right=0
    
    !Test data: ping - data to send, pong - data to receive
    integer :: ping, pong
            
    !initialize MPI
    !initialize subroutine
    call MPI_INIT(ierr) !only between init and finalize, mpi functions can be called 

    !setup communicator size
    !variable order: Communicator, number of processes, ierr
    call MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)

    !setup Ranks/IDs for each process
    !variable order : Communicator, rank/pid variable, ierr
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
    
    !type main code
           
    !setting up neighbouring processes 
    left = rank - 1
    centre = rank
    right = rank + 1

    if(rank == 0) then !first process
            
        ping = centre + 1

        !send/ping data
        !syntax: call MPI_SEND(start address, count (=number of variables send), datatype,
        !destination pid/rank, tag, communicator, ierr)

        call MPI_SEND(ping, 1, MPI_INT, right, centre, MPI_COMM_WORLD, ierr)
        print *, 'ping from rank/ID = ', rank, 'ping = ', ping


    else if(rank == nprocs -1) then !last process

        !receive/pong data
        !syntax: call MPI_RECV(start address, count (=number of variables send), datatype,
        !source pid/rank, tag, communicator, status, ierr)

        call MPI_RECV(pong, 1, MPI_INT, left, left, MPI_COMM_WORLD, status1, ierr)
        print *, 'pong from rank/ID = ', rank, 'pong = ', pong
    else


        !receive/pong data
        !syntax: call MPI_RECV(start address, count (=number of variables send), datatype, 
        !source pid/rank, tag, communicator, status, ierr)
        call MPI_RECV(pong, 1, MPI_INT, left, left, MPI_COMM_WORLD, status1, ierr)
        print *, 'pong from rank/ID = ', rank, 'pong = ', pong

        !modify the data
        ping = pong + 1

        !send/ping data
        !syntax: call MPI_SEND(start address, count (=number of variables send), datatype,
        !destination pid/rank, tag, communicator, ierr)

        call MPI_SEND(ping, 1, MPI_INT, right, centre, MPI_COMM_WORLD, ierr)
        print *, 'ping from rank/ID = ', rank, 'ping = ', ping

    end if

    !finalize MPI
    !finalize subroutine
    call MPI_FINALIZE(ierr) 

end program main
