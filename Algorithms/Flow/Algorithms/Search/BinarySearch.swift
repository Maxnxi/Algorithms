//
//  BinarySearch.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/28/24.
//

import Foundation

extension AlgorithmContainer {
	func binarySearch(array: [Int], target: Int) -> Int? {
		var left = 0
		var right = array.count - 1
		
		while left <= right {
			let mid = left + (right - left) / 2
			
			if array[mid] == target {
				return mid // Target found, return the index
			} else if array[mid] < target {
				left = mid + 1 // Search in the right half
			} else {
				right = mid - 1 // Search in the left half
			}
		}
		
		return nil // Target not found
	}
	/*
	 Example usage:
	 let sortedArray = [1, 3, 5, 7, 9, 11, 13]
	 if let index = binarySearch(array: sortedArray, target: 7) {
	 print("Target found at index \(index)")
	 } else {
	 print("Target not found")
	 }
	 */
	
}
