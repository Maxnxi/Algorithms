//
//  ByteOperations.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/20/24.
//

#include <iostream>
#include <string>

std::string printBinaryRepresentation(int32_t value) {
	std::string result = "";
	for (int k = 31; k >= 0; --k) {
		// Check if the k-th bit is set
		char nextDigit = (value & (1 << k)) ? '1' : '0';
		result += nextDigit;
	}
	return result;
}

int main() {
	int32_t number = 5;
	std::string binaryString = printBinaryRepresentation(number);
	std::cout << binaryString << std::endl;
	// Outputs: 00000000000000000000000000000101
	return 0;
}
