//
//  NSMutableArray+NullCheck.m
//  BaseUtilityExample
//
//  Created by calvien on 17/3/14.


#import "NSMutableArray+NullCheck.h"

@implementation NSMutableArray (NullCheck)
- (void)addSafeObject:(id)anObject {
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)insertSafeObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject) {
        [self insertObject:anObject atIndex:index];
    }
}

- (id)objectAtSafeIndex:(NSUInteger)index
{
    if (self.count > index) {
        
        return [self objectAtIndex:index];
    }
    else{
        
        return nil;
    }
}

- (void)addObjectsFromSafeArray:(NSArray *)otherArray
{
    if (otherArray && otherArray.count > 0) {
        
        [self addObjectsFromArray:otherArray];
    }
}

- (void)addOrInsertSafeObject:(id)anObject atIndex:(NSUInteger)index{
     if (anObject){
          if (self.count > index) {
               [self insertSafeObject:anObject atIndex:index];
          }else{
               [self addSafeObject:anObject];
          }
     }
}
@end
