//
//  NullCheck.m
//  BaseUtilityExample
//
//  Created by calvien on 17/3/14.


#import <Foundation/Foundation.h>

@implementation NSArray(NullCheck)

- (id)safeObjectAtIndex:(NSInteger)index
{
    id obj = nil;
    if (index < self.count) {
        obj = [self objectAtIndex:index];
    }
    return obj;
}

@end
