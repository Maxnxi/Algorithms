//
//  BinarySearch.hpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/29/24.
//

#ifndef BINARYSEARCH_HPP
#define BINARYSEARCH_HPP

#include <vector>
#include <stdio.h>
#include <swift/bridging>

class BinarySearch {
public:
	static int binarySearchCppWithVector(const std::vector<int>& array, int target);
	
	static int binarySearchCppWithArray(const int* array, int target);
};

#endif // BINARYSEARCH_HPP
