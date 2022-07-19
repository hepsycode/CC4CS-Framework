#include <stdint.h>
#include <values.h>

typedef int8_t TARGET_TYPE;
typedef uint8_t TARGET_INDEX;

/*
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
}*/

/*
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
	TARGET_INDEX j;
	for (j = low; j < high; j++) {
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
}*/


// An iterative implementation of quick sort 
  
// A utility function to swap two elements 
void swap(TARGET_TYPE* a, TARGET_TYPE* b) 
{ 
    TARGET_TYPE t = *a; 
    *a = *b; 
    *b = t; 
} 
  
// This function is same in both iterative and recursive
int partition(TARGET_TYPE arr[], TARGET_INDEX l, TARGET_INDEX h) 
{ 
    TARGET_TYPE x = arr[h]; 
    TARGET_INDEX i = (l - 1); 
    TARGET_INDEX j;
  
    for (j = l; j <= h - 1; j++) { 
        if (arr[j] <= x) { 
            i++; 
            swap(&arr[i], &arr[j]); 
        } 
    } 
    swap(&arr[i + 1], &arr[h]); 
    return (i + 1); 
} 
  
// A[] --> Array to be sorted,  
//   l  --> Starting index,  
//   h  --> Ending index 
void quicksortF(TARGET_TYPE arr[]) 
{ 
    TARGET_INDEX l = 0;
    TARGET_INDEX h = size - 1;
    // Create an auxiliary stack 
    TARGET_TYPE stack[size]; 
  
    // initialize top of stack 
    long top = -1; 
  
    // push initial values of l and h to stack 
    stack[++top] = l; 
    stack[++top] = h; 
  
    // Keep popping from stack while is not empty 
    while (top >= 0) { 
        // Pop h and l 
        h = stack[top--]; 
        l = stack[top--]; 
  
        // Set pivot element at its correct position 
        // in sorted array 
        TARGET_INDEX p = partition(arr, l, h); 
  
        // If there are elements on left side of pivot, 
        // then push left side to stack 
        if (p - 1 > l) { 
            stack[++top] = l; 
            stack[++top] = p - 1; 
        } 
  
        // If there are elements on right side of pivot, 
        // then push right side to stack 
        if (p + 1 < h) { 
            stack[++top] = p + 1; 
            stack[++top] = h; 
        } 
    } 
}

/*
#define MAX_LEVELS  32

void quicksortF(TARGET_TYPE arr[]) 
{ 
    TARGET_TYPE beg[MAX_LEVELS], end[MAX_LEVELS], L, R;
    TARGET_INDEX i = 0;

    beg[0] = 0;
    end[0] = size;
    while (i >= 0) {
        L = beg[i];
        R = end[i];
        if (L + 1 < R--) {
            TARGET_TYPE piv = arr[L];
            if (i == MAX_LEVELS - 1)
                return -1;
            while (L < R) {
                while (arr[R] >= piv && L < R)
                    R--;
                if (L < R)
                    arr[L++] = arr[R];
                while (arr[L] <= piv && L < R)
                    L++;
                if (L < R)
                    arr[R--] = arr[L];
            }
            arr[L] = piv;
            if (L - beg[i] > end[i] - R) { 
                beg[i + 1] = L + 1;
                end[i + 1] = end[i];
                end[i++] = L;
            } else {
                beg[i + 1] = beg[i];
                end[i + 1] = L;
                beg[i++] = L + 1;
            }
        } else {
            i--;
        }
    } 
}*/
  
void quicksort(TARGET_INDEX size, TARGET_TYPE a[size]){

	quicksortF(a);
}

void main()
{
	quicksort(size,a);

}
