//
//  DrawView.m
//  Leap
//
//  Created by Chakrit Paniam on 4/30/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

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
    UIImage* img = [UIImage imageNamed:[NSString stringWithFormat:@"line%@.png",letter]];
    self = [super initWithImage: img];
    
    if (self != nil) {
        //initialization
        
        float scale = 100/img.size.width;
        self.frame = CGRectMake(0,0,img.size.width*scale, img.size.height*scale);
        
        _letter = letter;
    }
    return self;
}

@end
