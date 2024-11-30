//
//  BinarySearchWrapper.mm
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/30/24.
//

#import <Foundation/Foundation.h>

#import "BinarySearchWrapper.h"
#import "BinarySearch.hpp"

@implementation BinarySearchWrapper

+ (NSInteger)binarySearchWithArray:(NSArray<NSNumber *> *)array target:(NSInteger)target {
	std::vector<int> cppArray;
	for (NSNumber *number in array) {
		cppArray.push_back(number.intValue);
	}
	
	int result = BinarySearch::binarySearch(cppArray, target);
	return result >= 0 ? result : NSNotFound; // Return NSNotFound if target not found
}

@end
