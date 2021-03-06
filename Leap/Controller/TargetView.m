//
//  TargetView.m
//  Leap
//
//  Created by Chakrit Paniam on 4/27/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "TargetView.h"

@implementation TargetView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



-(instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength
{
    UIImage* img = [UIImage imageNamed:@"UI_Font_00.png"];
    self = [super initWithImage: img];
    
    if (self != nil) {
        //initialization
        self.isMatched = NO;
        
        float scale = sideLength/img.size.width;
        self.frame = CGRectMake(0,0,img.size.width*scale, img.size.height*scale);
        
        _letter = letter;
    }
    return self;
}

- (void)setImageWithLetter:(NSString *)letter{
    UIImage* img = [UIImage imageNamed:[NSString stringWithFormat:@"ui_font_%@_@2x.png",letter]];
    [self setImage:img];
}

- (void)setDefaultImage{
    UIImage* img = [UIImage imageNamed:@"UI_Font_00.png"];
    [self setImage:img];
}


@end
