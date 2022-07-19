#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <values.h>

typedef int8_t TARGET_TYPE;
typedef uint8_t TARGET_INDEX;

TARGET_INDEX i;
int16_t *v, *w;

int max (TARGET_TYPE a, TARGET_TYPE b)
{
  return (a>b?a:b);
}

// dir.c - IIR filtering in direct form

TARGET_TYPE dir(TARGET_INDEX dimm, TARGET_TYPE a[dimm], TARGET_INDEX diml, TARGET_TYPE b[diml], TARGET_TYPE x)           /* usage: y = dir(M, a, L, b, w, v, x); */
{
       w = malloc(max(diml,dimm)*sizeof(int16_t));
       v = malloc(max(diml,dimm)*sizeof(int16_t));

       v[0] = x;                          /* current input sample */
       w[0] = 0;                          /* current output to be computed */

       for (i=0; i<=diml; i++)               /* numerator part */
              w[0] += b[i] * v[i];

       for (i=1; i<=dimm; i++)               /* denominator part */
              w[0] -= a[i] * w[i];

       for (i=diml; i>=1; i--)               /* reverse-order updating of \(v\) */
              v[i] = v[i-1];

       for (i=dimm; i>=1; i--)               /* reverse-order updating of \(w\) */
              w[i] = w[i-1];

       return w[0];                       /* current output sample */
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
	dir(dimm, a, diml, b, x);
	reset_values();
}

