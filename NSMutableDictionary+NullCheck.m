//
//  NSMutableDictionary+NullCheck.m
//  RMHBase_Example
//
//  Created by calvien on 2016/12/13.


#import "NSMutableDictionary+NullCheck.h"

@implementation NSMutableDictionary(NullCheck)

- (void)setSafeObject:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}
@end
