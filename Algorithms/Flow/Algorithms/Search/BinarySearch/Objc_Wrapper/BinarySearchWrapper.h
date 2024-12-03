//
//  BinarySearchWrapper.h
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/30/24.
//

#ifndef Header_h
#define Header_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BinarySearchWrapper : NSObject

+ (NSInteger)binarySearchWithArray:(NSArray<NSNumber *> *)array target:(NSInteger)target;

@end

NS_ASSUME_NONNULL_END

#endif /* Header_h */
