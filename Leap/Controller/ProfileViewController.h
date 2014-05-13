//
//  ProfileViewController.h
//  Leap
//
//  Created by Suparuch Sriploy on 4/29/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ANPopoverSlider.h"

@interface ProfileViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *woodImageView;

@property (strong, nonatomic) IBOutlet UIView *woodView;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UIView *frontView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroudImageView;
@property (strong, nonatomic) IBOutlet ANPopoverSlider *musicSlider;

- (IBAction)pressedMore:(id)sender;
- (IBAction)pressedSetting:(id)sender;
- (IBAction)pressedShop:(id)sender;
- (IBAction)pressedRanking:(id)sender;
- (IBAction)musicValueChanged:(id)sender;


@end
