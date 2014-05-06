//
//  USAGameViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 4/26/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "USAGameViewController.h"
#import "GameController.h"
#import "config.h"
@interface USAGameViewController ()

@property (strong, nonatomic) GameController* controller;
@end

@implementation USAGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self != nil) {
        //create the game controller
        self.controller = [[GameController alloc] init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView* gameLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview: gameLayer];

    self.controller.gameView = gameLayer;
    self.controller.level = [Level levelWithNum:33];
    [self.controller randomWordInLevel];
    [self.controller playGame];
    
    // Do any additional setup after loading the view.
}



- (IBAction)backButtonTapped:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}



@end
