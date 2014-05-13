//
//  ViewController.h
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sound.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *settingLanguageView;
@property (strong, nonatomic) IBOutlet UIButton *languageButton;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)nextButton:(id)sender;
- (IBAction)pressedPopupViewChooseLangugae:(id)sender;
- (IBAction)pressedChooseLanguage:(id)sender;

@end
