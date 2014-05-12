//
//  NSString+ShuffledString.m
//  Leap
//
//  Created by Chakrit Paniam on 5/13/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "NSString+ShuffledString.h"

@implementation NSString (ShuffledString)

- (id)shuffle
{
    
    
    NSMutableArray *letterArray = [NSMutableArray array];

    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                                options:(NSStringEnumerationByComposedCharacterSequences)
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                 [letterArray addObject:substring];
                             }];

    NSUInteger count = [self length];
    NSString *shuffleString = @"";
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger nElements = count - i;
        NSInteger n = arc4random_uniform(nElements) + i;
        [letterArray exchangeObjectAtIndex:i withObjectAtIndex:n];
        shuffleString = [shuffleString stringByAppendingString:letterArray[i]];
    }
    

    return shuffleString;
}
@end
