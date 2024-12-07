//
//  GeneratingSubsets.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/5/24.
//

import Foundation

func generateSubsets(index: Int, subset: inout [Int], nums: [Int]) {
	// Print the current subset
	print("{ \(subset.map(String.init).joined(separator: " ")) }")
	
	// Generate subsets starting from the current index
	for i in index..<nums.count {
		// Include nums[i] in the current subset
		subset.append(nums[i])
		// Recur for the next elements
		generateSubsets(index: i + 1, subset: &subset, nums: nums)
		// Backtrack to explore other possibilities
		subset.removeLast()
	}
}

/*
Example:
 func main() {
	var subset: [Int] = [] // To hold the current subset
	let nums = [1, 2, 3] // Input set

	generateSubsets(index: 0, subset: &subset, nums: nums) // Start generating subsets
}

main()

*/
