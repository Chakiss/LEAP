//
//  ResultScoreViewController.h
//  Leap
//
//  Created by Suparuch Sriploy on 5/10/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultScoreViewController : UIViewController

@property (assign, nonatomic) NSInteger scoreResult;
@property (assign, nonatomic) NSInteger goleResult;
@property (assign, nonatomic) NSInteger completeResult;

@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *goldLabel;
@property (strong, nonatomic) IBOutlet UILabel *completeLabel;

-(IBAction)backButton:(id)sender;

@end
