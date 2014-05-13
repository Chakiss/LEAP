//
//  ButtonAnimation.m
//  Leap
//
//  Created by Suparuch Sriploy on 5/14/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import "ButtonAnimation.h"

@implementation ButtonAnimation

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+(CABasicAnimation *)animationButton{
    
    CABasicAnimation *zoomAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [zoomAnimation setDuration:0.1];
    [zoomAnimation setRepeatCount:1];
    [zoomAnimation setFromValue:[NSNumber numberWithFloat:1.0]];
    [zoomAnimation setToValue:[NSNumber numberWithFloat:1.1]];
    [zoomAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    return zoomAnimation;
}

@end
