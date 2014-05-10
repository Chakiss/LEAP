//
//  Stage.m
//  Leap
//
//  Created by Chakrit Paniam on 5/10/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "Stage.h"


static Stage *sharedInstance;


@implementation Stage

- (id)init{
    if (self = [super init]) {

    }
    return self;
}

+ (Stage *) sharedInstance{
    
    @synchronized(self)
    {
        if (sharedInstance == nil)
        {
            sharedInstance = [[Stage alloc] init];
            
        }
    }
    return sharedInstance;

}

- (int)currentStage{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:@"stage"] integerValue];
}

- (void)setStage:(int)stage{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithInt:stage] forKey:@"stage"];
    [defaults synchronize];
    
}
@end
