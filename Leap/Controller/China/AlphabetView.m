//
//  AlphabetView.m
//  Leap
//
//  Created by Chakrit Paniam on 4/30/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "AlphabetView.h"

@implementation AlphabetView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(instancetype)initWithLetter:(NSString*)letter
{
    UIImage* img = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",letter]];
    self = [super initWithImage: img];
    
    if (self != nil) {
        float scale = 50/img.size.width;
        self.frame = CGRectMake(940,280,img.size.width*scale, img.size.height*scale);
        _letter = letter;
    }
    return self;
}

- (void)move{
    CGPoint point = CGPointMake(940, self.frame.origin.y);
    self.layer.position = point;
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    anim.fromValue  = [NSValue valueWithCGPoint:point];
    anim.toValue    = [NSValue valueWithCGPoint:CGPointMake(point.x - 640 , point.y)];
    anim.duration   = 20.0f;
    anim.repeatCount = 1;
    anim.removedOnCompletion = YES;
    anim.delegate = self;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.layer addAnimation:anim forKey:@"position"];

 
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self removeFromSuperview];
    [self.delegate end];
}

@end
