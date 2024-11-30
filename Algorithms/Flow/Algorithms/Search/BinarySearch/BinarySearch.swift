//
//  BinarySearch.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/28/24.
//

import Foundation

extension AlgorithmContainer {
	public func binarySearch(array: [Int], target: Int) -> Int? {
		let useCppFlag = true
		
		switch languageType {
		case .swift:
			binarySearchSwift(array: array, target: target)
			
		case .cpp:
			binarySearchCpp(array: array, target: target)
			
		}
	}
}

private
extension AlgorithmContainer {
	func binarySearchSwift(array: [Int], target: Int) -> Int? {
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
	
	func binarySearchCpp(array: [Int], target: Int) -> Int? {
		let array: [NSNumber] = array.map { NSNumber(value: $0) } // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//		let target: Int = 7

		let index = BinarySearchWrapper.binarySearchWithArray(array, target: target)
		if index != NSNotFound {
			debugPrint("Target found at index: \(index)")
			return index
		} else {
			debugPrint("Target not found!")
			return nil
		}
	}
}
