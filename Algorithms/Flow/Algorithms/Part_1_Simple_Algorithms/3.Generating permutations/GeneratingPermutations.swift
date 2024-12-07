//
//  GeneratingPermutations.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/6/24.
//

import Foundation

func generatePermutations(
	array: inout [Int],
	index: Int
) -> [[Int]] {
	// Array to hold all the permutations
	var results = [[Int]]()

	if index == array.count {
		// Add the current permutation to the results
		results.append(array)
		return results
	}
	
	for i in index..<array.count {
		// Swap the current index with the loop index
		array.swapAt(i, index)
		
		// Recur to generate permutations for the next index
		results += generatePermutations(
			array: &array,
			index: index + 1
		)
		
		// Backtrack by swapping back
		array.swapAt(i, index)
	}
	
	return results
}
