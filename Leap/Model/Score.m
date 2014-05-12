//
//  Score.m
//  Leap
//
//  Created by Chakrit Paniam on 5/10/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "Score.h"

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
- (int)highScore{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:@"highScore"] integerValue];
}

- (int)score{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:@"score"] integerValue];
}

- (void)setScore:(int)score andLevel:(int)levelHightScore{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults objectForKey:[NSString stringWithFormat:@"highScore_%d",levelHightScore]];
    //[defaults setObject:[NSNumber numberWithInt:score] forKey:@"score"];
    /*
    if ([defaults objectForKey:@"score"] > [defaults objectForKey:@"highScore"]) {
        [defaults setObject:[NSNumber numberWithInt:score] forKey:@"highScore"];
    }
     */
    
    
    
    [defaults synchronize];
}
@end
