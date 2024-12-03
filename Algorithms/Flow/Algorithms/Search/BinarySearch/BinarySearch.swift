//
//  BinarySearch.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/28/24.
//

import Foundation

extension AlgorithmContainer {
	public func binarySearch(array: [Int], target: Int) -> Int? {
		
		switch languageType {
		case .swift:
			return binarySearchSwift(array: array, target: target)
			
		case .cpp:
			return binarySearchCpp(array: array, target: target)
			
		case .objCWrapper_cpp:
			return binarySearchObjcWrapCpp(array: array, target: target)
			
		case .objC:
			break
		}
		return 0
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
		// prepare valuable for cpp
		let arrayInt32: [Int32] = array.map(Int32.init)
		let targetInt32 = Int32(target)
		
		var flagUsingVectorsInCpp: Bool = false
		
		var result: Int32
		if !flagUsingVectorsInCpp {
			result = BinarySearch.binarySearchCppWithArray(arrayInt32, targetInt32)
		} else {
			let vectorArray = VectorConverter.convertToVector(arrayInt32, array.count)
			
			/// option for using vector in cpp
			/// A more modern and safer approach
			/// is to use std::vector from the C++ Standard Library,
			/// which handles memory management for you:
			result = BinarySearch.binarySearchCppWithVector(vectorArray, targetInt32)
		}
		
		if result == -1 {
			return nil
		}
		
		return Int(result)
	}
	
	func binarySearchObjcWrapCpp(array: [Int], target: Int) -> Int? {
		let array: [NSNumber] = array.map { NSNumber(value: $0) } // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

		let index = BinarySearchWrapper.binarySearch(with: array, target: target)
		if index != NSNotFound {
			debugPrint("Target found at index: \(index)")
			return index
		} else {
			debugPrint("Target not found!")
			return nil
		}
	}
}
