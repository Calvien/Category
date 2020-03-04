//
//  NSMutableArray+NullCheck.h
//  BaseUtilityExample
//
//  Created by calvien on 17/3/14.


#import <Foundation/Foundation.h>

@interface NSMutableArray (NullCheck)

- (void)addSafeObject:(id)anObject;
- (void)insertSafeObject:(id)anObject atIndex:(NSUInteger)index;
- (id)objectAtSafeIndex:(NSUInteger)index;
- (void)addObjectsFromSafeArray:(NSArray *)otherArray;
- (void)addOrInsertSafeObject:(id)anObject atIndex:(NSUInteger)index;
@end
