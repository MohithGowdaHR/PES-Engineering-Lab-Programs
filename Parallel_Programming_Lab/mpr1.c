//Write a MPI program to send the message from a process whose rank=3 to all other remaining processes.

#include<stdio.h>
#include <mpi.h>
#include <stdlib.h>
#include<string.h>
#define BUFFER_SIZE 32

int main(int argc, char * argv[])
{
        int MyRank, NumProcess, Destination, iproc, tag=0, Root=3, temp=1;
        char Message[BUFFER_SIZE];
        MPI_Status status;
        MPI_Init(&argc, &argv);
        MPI_Comm_rank(MPI_COMM_WORLD, &MyRank);
        MPI_Comm_size(MPI_COMM_WORLD, &NumProcess);
        if(MyRank==3)
        {
                strcpy(Message, "Hello World");
                for(temp=0;temp<NumProcess;temp++)
                MPI_Send(Message, BUFFER_SIZE, MPI_CHAR, temp, tag, MPI_COMM_WORLD);
        }
        else
        {
                MPI_Recv(Message, BUFFER_SIZE, MPI_CHAR, Root, tag, MPI_COMM_WORLD, &status);
                printf("\n%s in process with rank %d from process with rank %d\n", Message, MyRank, Root);
        }
        MPI_Finalize();
}
