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
#import "TileView.h"
#import "TargetView.h"
#import "USAGame.h"
#import "AnswerView.h"
#import "NSString+ShuffledString.h"
#import "NSMutableArray+ShuffledArray.h"
#import "Sound.h"
#import "Message.h"
#import "GeneralUtility.h"
#import "ButtonAnimation.h"
#import "Score.h"
#import "Stage.h"
#import "ResultScoreViewController.h"
#import "ExplodeView.h"
#import "StarDustView.h"

@interface USAGameViewController (){
    
    //tile lists
    NSArray* tilesArray;
    NSMutableArray* _targets;
    
    //stopwatch variables
    USAGame *usaGame;
    int _secondsLeft;
    NSTimer* _timer;
    KKProgressTimer *timer1;
    int currentLetter;
    
    int currentWord;
    int scoreUSAGame;
    int scoreFull;
    
    BOOL isRabbitGuide;
    
    Sound *soundGuide;
    Sound *soundClick;
    Sound *soundBG;
    
    Score *myScore;
    
    NSUserDefaults *standardUserDefaults;
}

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
        // self.controller = [[GameController alloc] init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
     myScore = [Score sharedInstance];
    
     standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    isRabbitGuide  = true;
    
    tilesArray = [NSArray array];
    tilesArray = @[self.answer1,self.answer2,self.answer3,self.answer4,self.answer5,self.answer6,self.answer7,self.answer8,self.answer9,self.answer10];
    
    
    self.levelC = [Level levelWithNum:self.level];
    
    [self.levelC.level shuffle];
    
    
    [self playGame];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.heightScoreLabel.text = [NSString stringWithFormat:@"%ld",(long)[myScore getLevelHeightScore:self.level]];
    self.scoreLabel.text = @"0";
    
    soundBG = [[Sound alloc] init];
    [soundBG playSoundFile:@"game2_music_bg"];
    
    [soundBG play];

}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [soundBG stop];
    
}

- (void)playGame{
    
    UIView *clockView = [[UIView alloc] initWithFrame:CGRectMake(804, 610, 200, 138)];
    timer1 = [[KKProgressTimer alloc] initWithFrame:clockView.bounds];
    [clockView addSubview:timer1];
    timer1.delegate = self;
    timer1.tag = 1;
    
    [self.view addSubview:clockView];
    
    currentLetter = 0;
    currentWord = 0;
    
    [self randomWordInLevel:self.levelC.level[currentWord]];
    usaGame = [[USAGame alloc] init];
    
    [self startGame];
    
}


-(void)randomWordInLevel:(NSString *)string{
    
    NSAssert(self.levelC.level, @"no level loaded");
    
    //int randomIndex = arc4random()%[self.level.level count];
    NSString* word = string;//self.level.level[ randomIndex ];
    int wordLen = [word length];
    
    //create answer
    NSString *questionWord = word;
    if (wordLen > 2 && wordLen < 6) {
        for (int i = word.length ; i < 5; i++) {
            questionWord = [questionWord stringByAppendingString:[self randomStringWithLength:1]];
        }
    }
    else{
        for (int i = word.length ; i < 10; i++) {
            questionWord = [questionWord stringByAppendingString:[self randomStringWithLength:1]];
        }
    }
    
    
    NSLog(@"%@",[questionWord shuffle]);
    questionWord = [questionWord shuffle];
    for (int i=0 ; i<questionWord.length ; i++) {
        NSString* letter = [questionWord substringWithRange:NSMakeRange(i, 1)];
        
        //3
        if (![letter isEqualToString:@" "]) {
            TileView* tile =  tilesArray[i];
            tile.hidden = NO;
            [tile setLetter:letter];
        }
    }
    
    _targets = [NSMutableArray arrayWithCapacity: wordLen];
    // create targets
    
    NSLog(@"%d",wordLen);
    if (wordLen == 3) {
        self.questionView3.hidden = NO;
    }else if (wordLen == 4) {
        self.questionView4.hidden = NO;
    }else if (wordLen == 5) {
        self.questionView5.hidden = NO;
    }else if (wordLen == 6) {
        self.questionView6.hidden = NO;
    }else if (wordLen == 7) {
        self.questionView7.hidden = NO;
    }else if (wordLen == 8) {
        self.questionView8.hidden = NO;
    }else if (wordLen == 9) {
        self.questionView9.hidden = NO;
    }
    
    for (int i=0;i<wordLen;i++) {
        NSString* letter = [word substringWithRange:NSMakeRange(i, 1)];
        if (![letter isEqualToString:@" "]) {
            TargetView* target = [[TargetView alloc] initWithLetter:letter andSideLength:10];
            [_targets addObject: target];
        }
    }
    
    //   AnswerView *answer = [[AnswerView alloc] init];
    // [self.view addSubview:answer];
    [self.answer setDefaultImage];
}


- (void)startGame{
    
    int wordLen = _targets.count;
    if (currentLetter < wordLen) {
        TargetView* target = _targets[currentLetter];
        [usaGame playSoundWithLetter:target.letter];
        
        __block CGFloat i1 = 0;
        [timer1 startWithBlock:^CGFloat {
            return i1++ / 400;
        }];
        
    }else{
        NSLog(@"จบ 1 คำ");
        [self.answer answerImageWithWord:self.levelC.level[currentWord]];
        soundClick = [[Sound alloc] init];
        [soundClick playSoundFile:@"sound_magic"];
        
        [soundClick play];
        
        currentWord++;
        [self performSelector:@selector(nextWord) withObject:nil afterDelay:2.0];
        
    }
}
- (void)nextWord{
    if (currentWord < self.levelC.level.count) {
        currentLetter = 0;
        [self resetQuestionView];
        [self randomWordInLevel:self.levelC.level[currentWord]];
        [self startGame];
    }
    
}

#pragma mark KKProgressTimerDelegate Method
- (void)didUpdateProgressTimer:(KKProgressTimer *)progressTimer percentage:(CGFloat)percentage {
    if (percentage >= 1) {
        [progressTimer stop];
    }
}
- (void)didStopProgressTimer:(KKProgressTimer *)progressTimer percentage:(CGFloat)percentage {
    int wordLen = [_targets count];
    if (currentLetter < wordLen){
        if (currentLetter > _targets.count){
            NSLog(@"END!!!");
            [timer1 stop];
           
  
            
        }else{
            currentLetter++;
            [self startGame];
            
        }
    }else{
        NSLog(@"FI:AJFLKAJDL:KASJDKL:");
        
        NSLog(@"level %d",self.level);
        
        [myScore setHeightScore:scoreUSAGame andLevel:self.level];
        
        NSInteger completedScore = [myScore completeScore:scoreUSAGame andFullMarksLevel:scoreFull];
        
        if (completedScore > 50) {
            self.level++;
            
            Stage *stage = [Stage new];
            [stage setStage:self.level];
        }
        
        NSInteger goldInteger = [standardUserDefaults integerForKey:@"gold"];
        
        UIStoryboard *storyboard     = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        ResultScoreViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ResultScore"];
        vc.scoreResult = scoreUSAGame;
        vc.goleResult = goldInteger;
        vc.completeResult = completedScore;
        
        [self presentViewController:vc animated:NO completion:nil];

    }
}

- (void)touchLetter:(NSString *)letter{
    int wordLen = _targets.count;
    if (currentLetter < wordLen){
        if ([letter isEqualToString:((TargetView *)_targets[currentLetter]).letter]) {
            /////// ถูกกกกกกกกกก
            
        
            
            /*
            ExplodeView* explode = [[ExplodeView alloc] initWithFrame:CGRectMake(tileView.center.x,tileView.center.y,10,10)];
            [superview addSubview: explode];
            [superview sendSubviewToBack:explode];
            
            StarDustView* stars = [[StarDustView alloc] initWithFrame:CGRectMake(startX, startY, 10, 10)];
            [self.gameView addSubview:stars];
            [self.gameView sendSubviewToBack:stars];
            
            [UIView animateWithDuration:3
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 stars.center = CGPointMake(endX, startY);
                             } completion:^(BOOL finished) {
                                 
                                 //game finished
                                 [stars removeFromSuperview];
                                 
                                 //when animation is finished, show menu
                                 [self clearBoard];
                                 self.onAnagramSolved();
                             }];
             */
            
            soundClick = [[Sound alloc] init];
            [soundClick playSoundFile:@"Button_sound"];
            
            [soundClick play];
            
            [self.question3[currentLetter] center];
            
            int wordLen = _targets.count;
            if (wordLen == 3) {
                [self.question3[currentLetter] setImageWithLetter:letter];
            }else if (wordLen == 4) {
                [self.question4[currentLetter] setImageWithLetter:letter];
            }else if (wordLen == 5) {
                [self.question5[currentLetter] setImageWithLetter:letter];
            }else if (wordLen == 6) {
                [self.question6[currentLetter] setImageWithLetter:letter];
            }else if (wordLen == 7) {
                [self.question7[currentLetter] setImageWithLetter:letter];
            }else if (wordLen == 8) {
                [self.question8[currentLetter] setImageWithLetter:letter];
            }else if (wordLen == 9) {
                [self.question9[currentLetter] setImageWithLetter:letter];
            }
            currentLetter ++;
            scoreUSAGame += 10;
            self.scoreLabel.text = [NSString stringWithFormat:@"%li",(long)scoreUSAGame];
            [self startGame];
            
        }
        else{
            
            soundClick = [[Sound alloc] init];
            [soundClick playSoundFile:@"button_clickwong"];
            
            [soundClick play];
        }
    }
    
    scoreFull += 10;
    
}

- (void)resetQuestionView{
    
    self.questionView3.hidden = YES;
    self.questionView4.hidden = YES;
    self.questionView5.hidden = YES;
    self.questionView6.hidden = YES;
    self.questionView7.hidden = YES;
    self.questionView8.hidden = YES;
    self.questionView9.hidden = YES;
    
    for (TargetView* object in self.question3) {
        [object setDefaultImage];
    }
    for (TargetView* object in self.question4) {
        [object setDefaultImage];
    }
    for (TargetView* object in self.question5) {
        [object setDefaultImage];
    }
    for (TargetView* object in self.question6) {
        [object setDefaultImage];
    }
    for (TargetView* object in self.question7) {
        [object setDefaultImage];
    }
    for (TargetView* object in self.question8) {
        [object setDefaultImage];
    }
    for (TargetView* object in self.question9) {
        [object setDefaultImage];
    }
    
    
}



NSString *letters = @"abcdefghijklmnopqrstuvwxyz";

-(NSString *) randomStringWithLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}



- (IBAction)backButtonTapped:(id)sender{
    
    soundClick = [[Sound alloc] init];
    [soundClick playSoundFile:@"Button_sound"];
    
    [soundClick play];
    
    [self.backButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)rabbitGuideTapped:(id)sender {
    
    if(isRabbitGuide){
        
        self.footerView.hidden = NO;
        
        NSString *languageString = [standardUserDefaults stringForKey:@"language"];
        

        soundGuide = [[Sound alloc] init];
        [soundGuide playSoundFile:@"lion sound_01"];
        
        [soundGuide play];
        
        
        
        NSString *lionString = [Message getMessage:10];
        
        self.footerTextView.text = lionString;
        
        if ([languageString isEqualToString:@"CH"])
            self.footerTextView.font = [GeneralUtility fontChina];
        else
            self.footerTextView.font = [GeneralUtility fontThaiAndEng];
        
        
        
        isRabbitGuide = false;
        
    }
    else{
        
        isRabbitGuide = true;
        
         self.footerView.hidden = YES;

        [soundGuide stop];
        
    }
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
