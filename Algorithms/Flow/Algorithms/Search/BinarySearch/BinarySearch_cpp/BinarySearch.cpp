//
//  BinarySearch.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/29/24.
//

#include "BinarySearch.hpp"

#include <vector>
#include <iostream>
#include <optional>


int BinarySearch::binarySearchCppWithVector(const std::vector<int>& array, int target) {
	int left = 0;
	int right = array.size() - 1;

	while (left <= right) {
		int mid = left + (right - left) / 2;

		if (array[mid] == target) {
			return mid; // Target found, return the index
		} else if (array[mid] < target) {
			left = mid + 1; // Search in the right half
		} else {
			right = mid - 1; // Search in the left half
		}
	}

	return -1; // Target not found
}

int BinarySearch::binarySearchCppWithArray(const int* array, int target) {
	int left = 0;
	int size = sizeof(array) / sizeof(array[0]);
	int right = size - 1;

	while (left <= right) {
		int mid = left + (right - left) / 2;

		// Check if the target is present at mid
		if (array[mid] == target) {
			return mid; // Target found, return the index
		}
		// If target is greater, ignore the left half
		else if (array[mid] < target) {
			left = mid + 1;
		}
		// If target is smaller, ignore the right half
		else {
			right = mid - 1;
		}
	}

	return -1; // Target not found
}

/*
 Exxample:
 
 int main() {
 std::vector<int> array = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
 int target = 7;
 
 std::optional<int> result = binarySearch(array, target);
 
 if (result.has_value()) {
 std::cout << "Target found at index: " << result.value() << std::endl;
 } else {
 std::cout << "Target not found!" << std::endl;
 }
 
 return 0;
 }
 
 */
