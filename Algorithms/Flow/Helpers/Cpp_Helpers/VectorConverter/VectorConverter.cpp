//
//  VectorConverter.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/2/24.
//

#include "VectorConverter.hpp"

std::vector<int> VectorConverter::convertToVector(const int *array, size_t size) {
	return std::vector<int>(array, array + size);
}
