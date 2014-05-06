//
//  USAGame.m
//  Leap
//
//  Created by Chakrit Paniam on 4/27/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "USAGame.h"
#import <AudioToolbox/AudioToolbox.h>

@interface USAGame (){
    
    NSArray *soundArray;
    int randomNumber;
}

@end
@implementation USAGame


- (id)init{
    self = [super init];
    if (self) {

        
        soundArray = [NSArray arrayWithObjects:@"A.mp3",
                      @"B.mp3",
                      @"C.mp3",
                      @"D.mp3",
                      @"E.mp3",
                      @"F.mp3",
                      @"G.mp3",
                      @"H.mp3",
                      @"I.mp3",
                      @"J.mp3",
                      @"K.mp3",
                      @"L.mp3",
                      @"M.mp3",
                      @"N.mp3",
                      @"O.mp3",
                      @"P.mp3",
                      @"Q.mp3",
                      @"R.mp3",
                      @"S.mp3",
                      @"T.mp3",
                      @"U.mp3",
                      @"V.mp3",
                      @"W.mp3",
                      @"X.mp3",
                      @"Y.mp3",
                      @"Z.mp3",nil];
        
        
    }
    return self;
}


- (void)playCurrentSound{
    SystemSoundID soundID;
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],soundArray[randomNumber]]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound (soundID);
}

- (void)playSoundWithSoundID:(int)sound{
    randomNumber = sound;
    SystemSoundID soundID;
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],soundArray[randomNumber]]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound (soundID);
}
- (void)playSoundWithLetter:(NSString *)letter{
    SystemSoundID soundID;
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@.mp3", [[NSBundle mainBundle] resourcePath],[letter uppercaseString]]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound (soundID);
    
}


@end
