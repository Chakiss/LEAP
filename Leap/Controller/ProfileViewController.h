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

@property (strong, nonatomic) IBOutlet UIImageView *backgroudImageView;
@property (strong, nonatomic) IBOutlet ANPopoverSlider *musicSlider;
@property (strong, nonatomic) IBOutlet UISlider *soundFXSlider;


@property (strong, nonatomic) IBOutlet UILabel *goldLabel;

@property (strong, nonatomic) IBOutlet UIButton *shopButton;
@property (strong, nonatomic) IBOutlet UIButton *rankingButton;
@property (strong, nonatomic) IBOutlet UIButton *moreButton;
@property (strong, nonatomic) IBOutlet UIButton *settingButton;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;
@property (strong, nonatomic) IBOutlet UIImageView *coinImageView;

@property (strong, nonatomic) IBOutlet UIView *frontView;
@property (strong, nonatomic) IBOutlet UIView *settingView;
@property (strong, nonatomic) IBOutlet UIButton *languageButton;
@property (strong, nonatomic) IBOutlet UIImageView *languageImageView;

- (IBAction)pressedMore:(id)sender;
- (IBAction)pressedSetting:(id)sender;
- (IBAction)pressedShop:(id)sender;
- (IBAction)pressedRanking:(id)sender;
- (IBAction)musicValueChanged:(id)sender;
- (IBAction)languageTapped:(UIButton *)sender;



@end
