//
//  Score.h
//  Leap
//
//  Created by Chakrit Paniam on 5/10/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject


+ (Score *) sharedInstance;

- (NSInteger)totalScore;
- (void)setTotalScore:(int)score;
- (void)setHeightScore:(int)score andLevel:(int)level;
- (NSInteger)getLevelHeightScore:(int)level;

@end
