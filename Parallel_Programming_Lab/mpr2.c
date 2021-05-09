//Write a MPI program where each processor sends an integer number and its rank to the master processor, where the master gathers all the information and prints the data accordingly

#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
void main(intAÿargc,AÿcharAÿ*argv[])
{
	int rank,size;
	double param[6],mine;
	int sndcnt,rcvcnt,i;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	
	sndcnt=1;
	mine=23.0+rank;
	if(rank==3) rcvcnt=1;
	
	MPI_Gather(&mine,sndcnt,MPI_DOUBLE,param,rcvcnt,MPI_DOUBLE,3,MPI_COMM_WORLD);

	if(rank==3)
	for(i=0;i<size;++i)
	//printf("PE:%d param[%d] is %f \n",rank,i,param[i]]);
	printf(" %d %d \n",rank,i);
	
	MPI_Finalize();
}

