//
//  USAGameViewController.h
//  Leap
//
//  Created by Chakrit Paniam on 4/26/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Level.h"
#import "KKProgressTimer.h"
#import "TileView.h"
#import "TargetView.h"
#import "AnswerView.h"

@interface USAGameViewController : UIViewController<KKProgressTimerDelegate , TileTouchDelegate>




@property (weak, nonatomic) UIView* gameView;
@property (strong, nonatomic) Level* level;



@property (nonatomic, weak) IBOutlet UIView *questionView3;
@property (nonatomic, weak) IBOutlet UIView *questionView4;
@property (nonatomic, weak) IBOutlet UIView *questionView5;
@property (nonatomic, weak) IBOutlet UIView *questionView6;
@property (nonatomic, weak) IBOutlet UIView *questionView7;
@property (nonatomic, weak) IBOutlet UIView *questionView8;
@property (nonatomic, weak) IBOutlet UIView *questionView9;


@property (nonatomic, strong) IBOutletCollection(TargetView) NSArray *question3;
@property (nonatomic, strong) IBOutletCollection(TargetView) NSArray *question4;
@property (nonatomic, strong) IBOutletCollection(TargetView) NSArray *question5;
@property (nonatomic, strong) IBOutletCollection(TargetView) NSArray *question6;
@property (nonatomic, strong) IBOutletCollection(TargetView) NSArray *question7;
@property (nonatomic, strong) IBOutletCollection(TargetView) NSArray *question8;
@property (nonatomic, strong) IBOutletCollection(TargetView) NSArray *question9;


@property (nonatomic, weak) IBOutlet TileView *answer1;
@property (nonatomic, weak) IBOutlet TileView *answer2;
@property (nonatomic, weak) IBOutlet TileView *answer3;
@property (nonatomic, weak) IBOutlet TileView *answer4;
@property (nonatomic, weak) IBOutlet TileView *answer5;
@property (nonatomic, weak) IBOutlet TileView *answer6;
@property (nonatomic, weak) IBOutlet TileView *answer7;
@property (nonatomic, weak) IBOutlet TileView *answer8;
@property (nonatomic, weak) IBOutlet TileView *answer9;
@property (nonatomic, weak) IBOutlet TileView *answer10;

@property (nonatomic, weak) IBOutlet AnswerView *answer;
- (void)playGame;
- (IBAction)backButtonTapped:(id)sender;
@end
