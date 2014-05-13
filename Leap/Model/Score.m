//
//  Score.m
//  Leap
//
//  Created by Chakrit Paniam on 5/10/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "Score.h"
#import "Gold.h"

static Score *sharedInstance;

@implementation Score


+ (Score *) sharedInstance{
    @synchronized(self)
    {
        if (sharedInstance == nil)
        {
            sharedInstance = [[Score alloc] init];
            
        }
    }
    return sharedInstance;
}

- (void)setTotalScore:(int)score{
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:score forKey:@"totalScore"];
}

- (NSInteger)totalScore{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger score = [defaults integerForKey:@"totalScore"];
    
    return score;
}

- (void)setHeightScore:(int)score andLevel:(int)level{
    NSLog(@"LevelHeightScore%d",level);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSInteger heightScore = [defaults integerForKey:[NSString stringWithFormat:@"LevelHeightScore%d",level]];

   // NSInteger s =100;
    if (heightScore < score) {
        [defaults setInteger:score forKey:[NSString stringWithFormat:@"LevelHeightScore%d",level]];
    }
    
    [self setTotalScore:score];
    
    Gold *gold = [[Gold alloc] init];
    [gold setGold:score withLevel:level];
    

    [defaults synchronize];
}

- (NSInteger)getLevelHeightScore:(int)level{
    NSLog(@"LevelHeightScore%d",level);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger heightScore = [defaults integerForKey:[NSString stringWithFormat:@"LevelHeightScore%d",level]];
    
    return heightScore;
   
}

@end
