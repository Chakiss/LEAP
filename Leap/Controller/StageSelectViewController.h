//
//  StageSelectViewController.h
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Animation.h"

@interface StageSelectViewController : UIViewController
{
     int	selectedCurveIndex;
}

@property (nonatomic , strong) IBOutlet UIScrollView *map;
@property (nonatomic , retain) IBOutlet UIView* content;
@property (nonatomic , strong) IBOutletCollection(UIButton) NSArray* button;

@property (strong, nonatomic) IBOutlet UIView *ballonView;
@property (strong, nonatomic) IBOutlet UIImageView *ballonImageView;

- (IBAction)stageSelect:(id)sender;
@end
