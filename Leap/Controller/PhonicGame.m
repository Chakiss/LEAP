//
//  PhonicGame.m
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "PhonicGame.h"
#import <AudioToolbox/AudioToolbox.h>




@interface PhonicGame (){
    
    NSArray *soundArray;
    
    int randomNumber;
    int max;
    int min;
    int loop;
   
    
}

@end


@implementation PhonicGame

- (id)init{
    self = [super init];
    if (self) {
        self.total = 0;
        
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



- (int)randomNumberInRang{
    randomNumber = arc4random() % 25;
    return   randomNumber;
}

- (void)playRandomSound{
    SystemSoundID soundID;
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],soundArray[[self randomNumberInRang]]]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound (soundID);
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



- (int)checkResult:(int)selectedNumber{
    if(selectedNumber == randomNumber){
        self.total += 10;
        return 1;
    }
    else{
        return 0;
    }
}



@end
