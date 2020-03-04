//
//  NullCheck.h
//  BaseUtilityExample
//
//  Created by calvien on 17/3/14.

#import <Foundation/Foundation.h>

@interface NSArray (NullCheck)

- (id)safeObjectAtIndex:(NSInteger)index;

@end
