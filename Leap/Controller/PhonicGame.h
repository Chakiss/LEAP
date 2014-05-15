//
//  PhonicGame.h
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhonicGame : NSObject


@property (nonatomic,assign) int sumTotal;
@property (nonatomic,assign) int total;
@property (nonatomic,assign) int stage;

- (void)playRandomSound;
- (void)playCurrentSound;
- (void)playSoundWithSoundID:(int)sound;


- (int)checkResult:(int)selectedNumber;


@end
