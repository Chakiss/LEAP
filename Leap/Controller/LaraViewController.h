//
//  LaraViewController.h
//  Leap
//
//  Created by Chakrit Paniam on 5/14/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTMGlyphDetectorView.h"
#import "AlphabetView.h"
#import "KKProgressTimer.h"

@interface LaraViewController : UIViewController <AlphabetViewDelegate,KKProgressTimerDelegate>




@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightScoreLabel;

@property (nonatomic, strong) WTMGlyphDetectorView *gestureDetectorView;
@property (nonatomic, strong) IBOutlet UIView *drawAreaView;
@property (nonatomic, strong) IBOutlet UIImageView *choiceImageView;

@property (nonatomic, strong) IBOutlet UIImageView *alligatorView;
@property (nonatomic, strong) IBOutlet UIImageView *eyeView;
//@property (nonatomic, strong) IBOutlet AlphabetView *alphabetView;

@property (weak, nonatomic) IBOutlet KKProgressTimer *timer1;

@end
