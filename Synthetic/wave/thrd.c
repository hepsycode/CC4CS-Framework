#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <values.h>
#include <math.h>

typedef int8_t TARGET_TYPE;
typedef uint8_t TARGET_INDEX;

TARGET_INDEX i, j, n;
TARGET_TYPE s1,s2;

void wave(TARGET_INDEX dim, TARGET_TYPE a[dim][dim])
{
	n = dim;
	for(i=0 ; i < n ; i++) a[i][0] = 1.0;
	for(i=0 ; i < n ; i++) a[0][i] = 1.0;

	for(i=1 ; i < n ; i++)
	for(j=1 ; j < n ; j++)
		a[i][j] = a[(i-1)][j] + a[i][(j-1)] + a[(i-1)][(j-1)];

	for(i=0, s1=0.0 ; i < n ; i++) {
		for(j=0, s2=0.0 ; j < n ; j++){
			s2 += a[i][j];
		}
		s1 += s2;
	}

}

void main()
{
	wave(dim, a);
}

