#include <stdint.h>
#include <values.h>

typedef int16_t TARGET_TYPE;
typedef uint16_t TARGET_INDEX;

TARGET_TYPE tmp;
TARGET_TYPE pivot;

void swap(TARGET_TYPE a, TARGET_TYPE b) {
	tmp = a;
	a = b;
	b = tmp;
}

void quicksortF(TARGET_TYPE* arr, TARGET_INDEX left, TARGET_INDEX right) {

	TARGET_INDEX i = left, j = right;
	// Partition
	{
		
		// Pivot is the most left by default (1), nothing to do special
		pivot = arr[left];

		while(i <= j) {
			while(arr[i] < pivot) i++;

			while(arr[j] > pivot) j--;

			if(i <= j) {
				swap(arr[i], arr[j]);
				i++;
				j--;
			}
		}

	}
	// Recursion
	{
		if(left < j) quicksortF(arr, left, j);

		if(i < right) quicksortF(arr, i, right);
	}
}

void quicksort(TARGET_INDEX size, TARGET_TYPE a[size]){

	quicksortF(a, 0, size-1);
}

void main()
{
	quicksort(size,a);

}
