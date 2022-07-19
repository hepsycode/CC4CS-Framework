#include <stdint.h>
#include <values.h>

typedef int8_t TARGET_TYPE;
typedef uint8_t TARGET_INDEX;

TARGET_TYPE **p;

/* wrap.c - circular wrap of pointer p, relative to array w */

void wrap(TARGET_INDEX dim, TARGET_TYPE w[dim], TARGET_TYPE a)
{
	p = &a; 
       if (*p > w + dim)
              *p -= dim + 1;          /* when \(*p=w+M+1\), it wraps around to \(*p=w\) */

       if (*p < w)
              *p += dim + 1;          /* when \(*p=w-1\), it wraps around to \(*p=w+M\) */
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
	wrap(dim, w, a);                         /* update delay line */
	reset_values();
}


