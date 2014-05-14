//
//  LaraViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 5/14/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#define GESTURE_SCORE_THRESHOLD  0.7f

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
    defaults = [NSUserDefaults standardUserDefaults];
    
    currentloop = 0;
    scoreChina = 0;
    
    self.gestureDetectorView = [[WTMGlyphDetectorView alloc] initWithFrame:self.drawAreaView.bounds];
    self.gestureDetectorView.delegate = self;
    
    [self.drawAreaView addSubview:self.gestureDetectorView];
    [self checkLevel];
    [self playGame];
    
    
    backgroundSound = [[Sound alloc] init];
    [backgroundSound playSoundFile:@"game1_music_bg"];
    [backgroundSound play];
    
    
    self.alligatorView.animationImages = @[[UIImage imageNamed:@"game1_close.png"],[UIImage imageNamed:@"game1_open.png"]];
    self.alligatorView.animationDuration = 0.5;
    self.alligatorView.animationRepeatCount = 1;
    
    
    myScore = [Score sharedInstance];

    // Do any additional setup after loading the view.
}

-(void)score{
    
    //self.heightScoreLabel.text = [NSString stringWithFormat:@"%ld",(long)[myScore getLevelHeightScore:self.level]];
    self.scoreLabel.text = @"0";
    
}

- (void)playGame{
    NSLog(@"play game");
    NSLog(@"current Loop = %d",currentloop);
    if (currentloop < loop) {
        NSLog(@"create alphabetView");
        alphabetView = [[AlphabetView alloc] initWithLetter:alplabet[currentloop]];
        self.choiceImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"line%@.png",alplabet[currentloop]]];
        alphabetView.delegate = self;
        [self.view addSubview:alphabetView];
        [alphabetView move];
        
    }
    else{
        NSLog(@"FINISH!!!");
        
        [backgroundSound stop];
        [crocodileSound stop];
        [self.drawAreaView removeFromSuperview];
        [self.choiceImageView removeFromSuperview];
     
        
        
       
        
        NSInteger goldInteger = [defaults integerForKey:@"gold"];
        
        
        UIStoryboard *storyboard     = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        ResultScoreViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ResultScore"];
        vc.scoreResult = scoreChina;
        vc.goleResult = goldInteger;
       // vc.completeResult = completedScore;
        
        [self presentViewController:vc animated:NO completion:nil];
    }
    
    
}

- (void)end{
    
    crocodileSound = [[Sound alloc] init];
    [crocodileSound playSoundFile:@"mouth_croccodile"];
    [crocodileSound play];
    currentloop++;
    [ self.alligatorView startAnimating];
    [self playGame];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}
#pragma mark - Delegate

- (void)wtmGlyphDetectorView:(WTMGlyphDetectorView*)theView glyphDetected:(WTMGlyph *)glyph withScore:(float)score
{
    //Reject detection when quality too low
    //More info: http://britg.com/2011/07/17/complex-gesture-recognition-understanding-the-score/
    if (score < GESTURE_SCORE_THRESHOLD)
        return;
    
    answerLetter = glyph.name;
    
    if (alphabetView) {
        
        if ([answerLetter isEqualToString:[alplabet[currentloop] uppercaseString]]) {
            NSLog(@"ถูกกกกกก");
            scoreChina++;
            self.scoreLabel.text = [NSString stringWithFormat:@"%d",scoreChina];
            [self.drawAreaView reloadInputViews];
            [alphabetView removeFromSuperview];
            correctSound = [[Sound alloc] init];
            [correctSound playSoundFile:@"sound_magic"];
            
            [correctSound play];
        }
        else{
            NSLog(@"ผิดดดดดดด");
        }
        
        //fullMarks++;
    }
    else{
        NSLog(@"NO");
    }
    
    
}
- (void)checkLevel{
      // else if(self.level == 16){
        loop = 10;
        alplabet = [@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"] mutableCopy];
        [self shuffle];
        [self.gestureDetectorView loadTemplatesWithNames:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
   // }
    
}

- (void)shuffle{
    NSUInteger count = alplabet.count;
    for (int i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [alplabet exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
}

- (IBAction)pressedPandaGuide:(id)sender {
    
    
    
    
}

- (IBAction)backButtonTapped:(id)sender{
    [backgroundSound stop];
    [crocodileSound stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
