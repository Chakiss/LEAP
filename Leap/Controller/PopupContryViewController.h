//
//  PopupContryViewController.h
//  Leap
//
//  Created by Suparuch Sriploy on 5/15/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupContryViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *contryImageView;

@property (strong, nonatomic) IBOutlet UIImageView *starImageView1;
@property (strong, nonatomic) IBOutlet UIImageView *starImageView2;
@property (strong, nonatomic) IBOutlet UIImageView *starImageView3;
@property (strong, nonatomic) IBOutlet UITextView *descTextView;

- (IBAction)closeTapped:(id)sender;
@end
