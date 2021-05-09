//Write an OpenMP program to add all the elements of two arrays A & B each of size 1000 and store their sum in a variable using reduction clause.

#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char *argv[])
{
	int i, n;
	float a[1000], b[1000], sum;

	/* Required initializations */
	n = 1000;
	for (i=0; i < n; i++)
		a[i] = b[i] = i * 1.0;
	sum = 0.0;

	#pragma omp parallel for reduction(+:sum)
	for (i=0; i < n; i++)
		sum = sum + (a[i] * b[i]);

	printf(" Sum = %f\n",sum);	
	return(0);
}
