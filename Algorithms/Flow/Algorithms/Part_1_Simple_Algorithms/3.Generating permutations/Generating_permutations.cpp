//
//  Generating_permutations.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/6/24.
//

#include <iostream>
#include <vector>

void generatePermutations(
						  std::vector<int>& nums,
						  int start
						  )
{
	// If we reach the end of the array, we have a complete permutation
	if (start == nums.size()) {
		// Print the current permutation
		std::cout << "{ ";
		for (int num : nums) {
			std::cout << num << " ";
		}
		std::cout << "}" << std::endl;
		return;
	}

	for (int i = start; i < nums.size(); ++i) {
		// Swap the current element with the start element
		std::swap(nums[start], nums[i]);
		
		// Recur with the next element as the starting point
		generatePermutations(nums, start + 1);
		
		// Backtrack by swapping back
		std::swap(nums[start], nums[i]);
	}
}

int main() {
	std::vector<int> nums = {1, 2, 3}; // Input set
	generatePermutations(nums, 0); // Start generating permutations

	return 0;
}
