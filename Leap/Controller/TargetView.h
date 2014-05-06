//
//  TargetView.h
//  Leap
//
//  Created by Chakrit Paniam on 4/27/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TargetView : UIImageView


@property (strong, nonatomic, readonly) NSString* letter;
@property (assign, nonatomic) BOOL isMatched;

-(instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength;

@end
