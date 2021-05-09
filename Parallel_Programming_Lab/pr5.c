//Write an  OpenMP program to print all the letters of the alphabet A-Z using threads.
#include <stdio.h>
#include <omp.h>
int main(void)
{
     int i;
     omp_set_num_threads(4);
     #pragma omp parallel private(i)
     {
        int LettersPerThread = 26 / omp_get_num_threads();
        int ThisThreadNum = omp_get_thread_num();
        int StartLetter = 'a'+ThisThreadNum*LettersPerThread;
        int EndLetter = 'a'+ThisThreadNum*LettersPerThread+LettersPerThread;
        for (i=StartLetter; i<EndLetter; i++)
        printf("%c", i);
     }
     printf("\n");
     return 0;
 }
