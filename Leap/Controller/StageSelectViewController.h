//
//  StageSelectViewController.h
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StageSelectViewController : UIViewController


@property (nonatomic , strong) IBOutlet UIScrollView *map;
@property (nonatomic , retain) IBOutlet UIView* content;
@property (nonatomic , strong) IBOutletCollection(UIButton) NSArray* button;

- (IBAction)stageSelect:(id)sender;
@end
