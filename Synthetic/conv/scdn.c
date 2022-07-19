#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <values.h>

typedef int8_t TARGET_TYPE;
typedef uint8_t TARGET_INDEX;

TARGET_INDEX i, n, m;
TARGET_TYPE *y;

// conv.c - convolution of x[n] with h[n], resulting in y[n]

TARGET_INDEX min (TARGET_INDEX a, TARGET_INDEX b)
{
  return (a>b?b:a);
}

TARGET_INDEX max (TARGET_INDEX a, TARGET_INDEX b)
{
  return (a>b?a:b);
}

void conv(TARGET_INDEX dimm, TARGET_TYPE a[dimm], TARGET_INDEX diml, TARGET_TYPE b[diml])           /* usage: y = dir(M, a, L, b, w, v, x); */
{
	y = malloc((diml+dimm)*sizeof(TARGET_TYPE));

	for (n = 0; n < diml+dimm; n++){
		y[n] = 0;
		for (m = max(0, n-diml+1); m <= min(n, dimm); m++){
			 y[n] += a[m] * b[n-m];
		}
	}
	free(y);

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
	conv(dimm, a, diml, b);
	reset_values();
}

