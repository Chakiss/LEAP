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
- (int)highScore;
- (int)score;
- (void)setScore:(int)score andLevel:(int)levelHightScore;
@end
