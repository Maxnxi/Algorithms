#  Bubble sort

Bubble sort is a simple algorithm with a time complexity of O(n²). It consists of n rounds, during which the elements of the array are traversed. If two adjacent elements are not in the correct order, they are swapped. The algorithm can be implemented as follows:

for (int i = 0; i < n; i++) {
    for (int j = 0; j < n-1; j++) {
        if (array[j] > array[j+1]) {
            swap(array[j], array[j+1]);
        }
    }
}
