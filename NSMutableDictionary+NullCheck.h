//
//  NSMutableDictionary+NullCheck.h
//  RMHBase_Example
//
//  Created by calvien on 2016/12/13.


#import <Foundation/Foundation.h>

@interface NSMutableDictionary (NullCheck)

- (void)setSafeObject:(id)anObject forKey:(id)aKey;

@end
