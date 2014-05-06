//
//  GameController.h
//  Leap
//
//  Created by Chakrit Paniam on 4/27/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "KKProgressTimer.h"

@interface GameController : NSObject<KKProgressTimerDelegate>{
    
}


@property (weak, nonatomic) UIView* gameView;
@property (strong, nonatomic) Level* level;

-(void)randomWordInLevel;
- (void)playGame;
@end
