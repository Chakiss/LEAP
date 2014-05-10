//
//  Stage.h
//  Leap
//
//  Created by Chakrit Paniam on 5/10/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stage : NSObject


+ (Stage *) sharedInstance;
- (int)currentStage;
- (void)setStage:(int)stage;
@end
