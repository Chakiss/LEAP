//
//  GeneralUtility.m
//  TSC
//
//  Created by Suparuch on 9/6/13.
//  Copyright (c) 2013 Suparuch Sriploy. All rights reserved.
//

#import "GeneralUtility.h"

@implementation GeneralUtility

+ (UIFont *)fontThaiAndEng
{
    return [self fontArialUnicodeMSWithSize:24.0f];
}

+ (UIFont *)fontChina
{
    return [self fontArialUnicodeMSWithSize:24.0f];
}

+ (UIFont *)fontArialUnicodeMSWithSize:(CGFloat)fontSize
{
    
    return [UIFont fontWithName:@"arial unicode ms" size:fontSize];
}

+ (UIFont *)fontSimSunWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"SimSun" size:fontSize];
}
@end
