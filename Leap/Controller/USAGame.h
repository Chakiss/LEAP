//
//  USAGame.h
//  Leap
//
//  Created by Chakrit Paniam on 4/27/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface USAGame : NSObject

- (void)playCurrentSound;
- (void)playSoundWithSoundID:(int)sound;
- (void)playSoundWithLetter:(NSString *)letter;

@end
