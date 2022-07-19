#include <stdint.h>
#include <values.h>

typedef int16_t TARGET_TYPE;
typedef uint16_t TARGET_INDEX;

/*TARGET_TYPE tmp;
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
}*/

// Function to swap position of elements
void swap(TARGET_TYPE *a, TARGET_TYPE *b) {
	TARGET_TYPE t = *a;
	*a = *b;
	*b = t;
}

// Function to partition the array on the basis of pivot element
TARGET_INDEX partition(TARGET_TYPE array[], TARGET_INDEX low, TARGET_INDEX high) {
  
	// Select the pivot element
	TARGET_TYPE pivot = array[high];
	TARGET_INDEX i = (low - 1);

	// Put the elements smaller than pivot on the left 
	// and greater than pivot on the right of pivot
	for (TARGET_INDEX j = low; j < high; j++) {
		if (array[j] <= pivot) {
			i++;
			swap(&array[i], &array[j]);
		}
	}

	swap(&array[i + 1], &array[high]);
	return (i + 1);
}

void quicksortF(TARGET_TYPE array[], TARGET_INDEX low, TARGET_INDEX high) {
	if (low < high) {

		// Select pivot position and put all the elements smaller 
		// than pivot on left and greater than pivot on right
		TARGET_INDEX pi = partition(array, low, high);

		// Sort the elements on the left of pivot
		quicksortF(array, low, pi - 1);

		// Sort the elements on the right of pivot
		quicksortF(array, pi + 1, high);
	}
}

void quicksort(TARGET_INDEX size, TARGET_TYPE a[size]){

	quicksortF(a, 0, size-1);
}

void main()
{
	quicksort(size,a);

}
