//
//  StoryLineViewController.h
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LocalizeDataStore.h"
#import "Sound.h"

@interface StoryLineViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *storyLineImageView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UITextView *StoryLineTextView;
@property (weak, nonatomic) IBOutlet UIButton *nextStage;


- (IBAction)nextButtonTapped:(id)sender;
- (IBAction)backButtonTapped:(id)sender;

@property (nonatomic, strong) LocalizeDataStore *localizeDataStore;


@end
