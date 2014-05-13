//
//  ChinaGameViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 4/30/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#define GESTURE_SCORE_THRESHOLD  0.7f

#import "ChinaGameViewController.h"
#import "ResultScoreViewController.h"
#import "WTMGlyphDetectorView.h"
#import "NSMutableArray+ShuffledArray.h"
#import "Sound.h"
#import "Score.h"
#import "Stage.h"


@interface ChinaGameViewController (){
    
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

@implementation ChinaGameViewController

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
//    [self.gestureDetectorView loadTemplatesWithNames:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    
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
   // [ self.alligatorView startAnimating];
    
    [self score];
}

-(void)score{
     NSLog(@"height %ld",(long)[myScore getLevelHeightScore:self.level]);
     self.heightScoreLabel.text = [NSString stringWithFormat:@"%ld",(long)[myScore getLevelHeightScore:self.level]];
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
        self.level++;
        
        Stage *stage = [Stage new];
        [stage setStage:self.level];
        
        [myScore setHeightScore:scoreChina andLevel:self.level-1];
        
        
        NSInteger goldInteger = [defaults integerForKey:@"gold"];
        
        
        UIStoryboard *storyboard     = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        ResultScoreViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ResultScore"];
        vc.scoreResult = scoreChina;
        vc.goleResult = goldInteger;
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
    }
    else{
        NSLog(@"NO");
    }
    
    
    
    
}
- (void)checkLevel{
    if (self.level == 1){
        loop = 4;
        alplabet = [@[@"a",@"a",@"b",@"b"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"A",@"B",nil];
    }
    else if(self.level == 2){
        loop = 4;
        alplabet = [@[@"c",@"c",@"d",@"d"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"C",@"D",nil];
    }
    else if(self.level == 3){
        loop = 4;
        alplabet = [@[@"e",@"e",@"f",@"f"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"E",@"F",nil];
    }
    else if(self.level == 4){
        loop = 4;
        alplabet = [@[@"g",@"g",@"h",@"h"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"G",@"H",nil];
    }
    else if(self.level == 5){
        loop = 4;
        alplabet = [@[@"i",@"i",@"j",@"j"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"I",@"J",nil];
    }
    else if(self.level == 6){
        loop = 4;
        alplabet = [@[@"k",@"k",@"l",@"l"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"K",@"L",nil];
    }
    else if(self.level == 7){
        loop = 4;
        alplabet = [@[@"m",@"m",@"n",@"n"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"M",@"N",nil];
    }
    else if(self.level == 8){
        loop = 4;
        alplabet = [@[@"o",@"o",@"p",@"p"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"O",@"P",nil];
    }
    else if(self.level == 9){
        loop = 4;
        alplabet = [@[@"q",@"q",@"r",@"r"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"Q",@"R",nil];
    }
    else if(self.level == 10){
        loop = 4;
        alplabet = [@[@"s",@"s",@"t",@"t"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"S",@"T",nil];
    }
    else if(self.level == 11){
        loop = 4;
        alplabet = [@[@"u",@"u",@"v",@"v"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"U",@"V",nil];
    }
    else if(self.level == 12){
        loop = 4;
        alplabet = [@[@"w",@"x",@"y",@"z"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"W",@"X",@"Y",@"Z",nil];
    }
    else if(self.level == 13){
        loop = 10;
        alplabet = [@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j"] mutableCopy];
        [self.gestureDetectorView loadTemplatesWithNames:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",nil];
        
    }
    else if(self.level == 14){
        loop = 10;
        alplabet = [@[@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t"] mutableCopy];
        [self shuffle];
        [self.gestureDetectorView loadTemplatesWithNames:@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",nil];
    }
    else if(self.level == 15){
        loop = 10;
        alplabet = [@[@"u",@"v",@"w",@"x",@"y",@"z",@"u",@"w",@"y",@"z"] mutableCopy];
        [self shuffle];
        [self.gestureDetectorView loadTemplatesWithNames:@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    }
    else if(self.level == 16){
        loop = 10;
        alplabet = [@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"] mutableCopy];
        [self shuffle];
        [self.gestureDetectorView loadTemplatesWithNames:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    }
    
}

- (void)shuffle{
    NSUInteger count = alplabet.count;
    for (int i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [alplabet exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
}

- (IBAction)backButtonTapped:(id)sender{
    [backgroundSound stop];
    [crocodileSound stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
