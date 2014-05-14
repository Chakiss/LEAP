//
//  StageSelectViewController.h
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Animation.h"
#import "LocalizeDataStore.h"
#import "AppDelegate.h"
#import "Sound.h"
#import "Score.h"
#import "Gold.h"

@interface StageSelectViewController : UIViewController<SoundDelegate>
{
    int	selectedCurveIndex;
    AppDelegate *app;
    Score *heightScore;
    Gold *gold;
}

@property (nonatomic , strong) IBOutlet UIScrollView *map;
@property (nonatomic , retain) IBOutlet UIView* content;
@property (nonatomic , strong) IBOutletCollection(UIButton) NSArray* button;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIView *ballonView;
@property (strong, nonatomic) IBOutlet UIImageView *ballonImageView;
@property (strong, nonatomic) IBOutlet UIImageView *animalImageView;
@property (nonatomic, strong) LocalizeDataStore *localizeDataStore;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *goldLabel;
@property (strong, nonatomic) IBOutlet UITextView *conversationTxt;

- (IBAction)stageSelect:(id)sender;
- (IBAction)pressedProfile:(id)sender;
- (IBAction)backAction:(id)sender;

@end
