program rank_size
    use mpi
    integer ierr, num_procs, my_id

    call MPI_INIT ( ierr )

    !find out MY process ID, and how many processes were started.

    call MPI_COMM_RANK (MPI_COMM_WORLD, my_id, ierr)

    call MPI_COMM_SIZE (MPI_COMM_WORLD, num_procs, ierr)

    print *, "Hello world! I'm process ", my_id, " out of ", num_procs, " processes."

    call MPI_FINALIZE( ierr )

    stop
end program rank_size
