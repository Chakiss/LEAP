//
//  TitleView.m
//  Leap
//
//  Created by Chakrit Paniam on 4/27/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "TileView.h"
#import "config.h"

@implementation TileView
{
     int _xOffset, _yOffset;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength{

    UIImage* img = [UIImage imageNamed:[NSString stringWithFormat:@"ui_font_%@_@2x.png",letter]];
    

    self = [super initWithImage:img];
    
    if (self != nil) {
        
    
        float scale = sideLength/img.size.width;
        self.frame = CGRectMake(0,0,img.size.width*scale, img.size.height*scale);
        
        self.isMatched = NO;
        
        
        _letter = letter;
        
      
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(actionSingleTap)];
        singleTap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singleTap];
    }
    
    return self;
}

- (void)setLetter:(NSString *)letter{
     UIImage* img = [UIImage imageNamed:[NSString stringWithFormat:@"ui_font_%@_@2x.png",letter]];
    [self setImage:img];
    self.isMatched = NO;
    _letter = letter;
    
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(actionSingleTap)];
    singleTap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:singleTap];

}

-(void)actionSingleTap{
    NSLog(@"TAP!!");
    
    CABasicAnimation *zoomAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [zoomAnimation setDuration:0.15];
    [zoomAnimation setRepeatCount:1];
    [zoomAnimation setFromValue:[NSNumber numberWithFloat:1.0]];
    [zoomAnimation setToValue:[NSNumber numberWithFloat:1.1]];
    [zoomAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.layer addAnimation:zoomAnimation forKey:@"zoom"];
    
    [self.delegate letterOfView:self.letter];

}



@end
