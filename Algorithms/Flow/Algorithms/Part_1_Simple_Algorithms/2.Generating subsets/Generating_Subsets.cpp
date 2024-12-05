//
//  Generating_Subsets.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/5/24.
//


#include <iostream>
#include <vector>

void generateSubsets(
					 int index,
					 std::vector<int>& subset,
					 const std::vector<int>& nums
					 )
{
	// Print the current subset
	std::cout << "{ ";
	for (int num : subset)
	{
		std::cout << num << " ";
	}
	std::cout << "}" << std::endl;

	// Generate subsets starting from the current index
	for (int i = index; i < nums.size(); ++i)
	{
		// Include nums[i] in the current subset
		subset.push_back(nums[i]);
		// Recur for the next elements
		generateSubsets(i + 1, subset, nums);
		// Backtrack to explore other possibilities
		subset.pop_back();
	}
}

int main() {
	std::vector<int> subset; // To hold the current subset
	std::vector<int> nums = {1, 2, 3}; // Input set

	generateSubsets(0, subset, nums); // Start generating subsets

	return 0;
}
