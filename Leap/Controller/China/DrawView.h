//
//  DrawView.h
//  Leap
//
//  Created by Chakrit Paniam on 4/30/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIImageView

@property (strong, nonatomic, readonly) NSString* letter;

-(instancetype)initWithLetter:(NSString*)letter;
@end
