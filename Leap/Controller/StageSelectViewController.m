//
//  StageSelectViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "StageSelectViewController.h"
#import "PhonicGameViewController.h"
@interface StageSelectViewController ()

@end

@implementation StageSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (IBAction)stageSelect:(id)sender{
    UIStoryboard *storyboard     = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    PhonicGameViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"GameThai"];
    vc.stage = 18;
    [self presentViewController:vc animated:NO completion:nil];
}


-(BOOL) prefersStatusBarHidden
{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
