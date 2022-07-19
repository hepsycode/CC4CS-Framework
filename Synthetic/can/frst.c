#include <stdint.h>
#include <values.h>

typedef int8_t TARGET_TYPE;
typedef uint8_t TARGET_INDEX;

int8_t i;
TARGET_TYPE y;

/* can3.c - IIR filtering in canonical form, emulating a DSP chip */

TARGET_TYPE can(TARGET_INDEX dim, TARGET_TYPE a[dim], TARGET_TYPE b[dim], TARGET_TYPE w[dim], TARGET_TYPE x)                /* usage: y = can3(M, a, b, w, x); */
{

       w[0] = x;                                 /* read input sample */

       for (i=1; i<dim; i++)                      /* forward order */
              w[0] -= a[i] * w[i];               /* MAC instruction */

       y = b[dim-1] * w[dim-1];

       for (i=dim-2; i>=0; i--) {                  /* backward order */
              w[i+1] = w[i];                     /* data shift instruction */
              y += b[i] * w[i];                  /* MAC instruction */
       }

       return y;                                 /* output sample */
}


void main()
{
	can(dim, a, b, w, x);
}

