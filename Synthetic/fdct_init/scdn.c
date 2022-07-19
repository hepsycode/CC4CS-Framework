#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <values.h>
#include <8051.h>
#include <math.h>

#ifndef PI
# ifdef M_PI
#  define PI M_PI
# else
#  define PI 3.14159265358979323846
# endif
#endif

typedef int8_t TARGET_TYPE;
typedef uint8_t TARGET_INDEX;

TARGET_INDEX i, j;
TARGET_TYPE s;

void fdct_init(TARGET_INDEX M, TARGET_TYPE a[M][M])
{
	for (i=0; i<M; i++)
	{
		s = (i==0) ? sqrt(0.125) : 0.5;

		for (j=0; j<M; j++){
			a[i][j] = s * cosf((PI/8.0)*i*(j+0.5));
		}
	}
}

void reset_values()
{
	P0 = 0;
	P1 = 0;
	P2 = 0;
	P3 = 0;
}

void main()
{
	fdct_init(M, a);
	reset_values();
}