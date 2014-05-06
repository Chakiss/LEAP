//
//  AnswerView.m
//  Leap
//
//  Created by Chakrit Paniam on 4/27/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "AnswerView.h"

@implementation AnswerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(instancetype)init{

    UIImage* img = [UIImage imageNamed:@"question_mark.png"];
    self = [super initWithImage: img];
    
    if (self != nil) {
        //initialization
       
        
        self.frame = CGRectMake(0,0,200, 200);
        
    }
    return self;
}

- (void)answerImageWithWord:(NSString *)word{
    UIImage* img = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",word]];
    self.image = img;
}


@end
