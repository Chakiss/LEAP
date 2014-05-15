//
//  PhonicGameViewController.h
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKProgressTimer.h"

@interface PhonicGameViewController : UIViewController<KKProgressTimerDelegate>


@property (weak, nonatomic) IBOutlet KKProgressTimer *timer1;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *alphabetBotton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (assign, nonatomic) int level;
@property (strong, nonatomic) IBOutlet UILabel *heightScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIView *footerview;
@property (strong, nonatomic) IBOutlet UITextView *footerTextView;



- (IBAction)backButtonTapped:(id)sender;
- (IBAction)playaction:(id)sender;
- (IBAction)platCurrentSound:(id)sender;
- (IBAction)profileTapped:(id)sender;
- (IBAction)lionTapped:(id)sender;

@end
