//
//  LaraViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 5/14/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "LaraViewController.h"
#import "ResultScoreViewController.h"
#import "WTMGlyphDetectorView.h"
#import "NSMutableArray+ShuffledArray.h"
#import "Sound.h"
#import "Score.h"
#import "Stage.h"

@interface LaraViewController (){
    
    AlphabetView *alphabetView;
    int loop;
    NSMutableArray *alplabet;
    int currentloop;
    NSString *answerLetter;
    
    Sound *backgroundSound;
    Sound *correctSound;
    Sound *crocodileSound;
    
    Score *myScore;
    
    int scoreChina;
    
    NSUserDefaults *defaults;
}


@end

@implementation LaraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
