//
//  ChinaGameViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 4/30/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#define GESTURE_SCORE_THRESHOLD         0.7f

#import "ChinaGameViewController.h"
#import "WTMGlyphDetectorView.h"
#import "NSMutableArray+ShuffledArray.h"
#import "Sound.h"

@interface ChinaGameViewController (){
    
    AlphabetView *alphabetView;
    int loop;
    NSMutableArray *alplabet;
    int currentloop;
    NSString *answerLetter;
    
    Sound *backgroundSound;
    Sound *correctSound;
    Sound *crocodileSound;
    
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
    self.level = 16;
    currentloop = 0;
    
    self.gestureDetectorView = [[WTMGlyphDetectorView alloc] initWithFrame:self.drawAreaView.bounds];
    self.gestureDetectorView.delegate = self;
    [self.gestureDetectorView loadTemplatesWithNames:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    [self.drawAreaView addSubview:self.gestureDetectorView];
    [self checkLevel];
    [self playGame];
    
    
    backgroundSound = [[Sound alloc] init];
    [backgroundSound playSoundFile:@"game1_music_bg"];
    [backgroundSound play];
    
    
    self.alligatorView.animationImages = @[[UIImage imageNamed:@"game1_close.png"],[UIImage imageNamed:@"game1_open.png"]];
    self.alligatorView.animationDuration = 0.5;
    self.alligatorView.animationRepeatCount = 1;
   // [ self.alligatorView startAnimating];
    
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
        [self.drawAreaView removeFromSuperview];
        [self.choiceImageView removeFromSuperview];
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
    }
    else if(self.level == 2){
        loop = 4;
        alplabet = [@[@"c",@"c",@"d",@"d"] mutableCopy];
    }
    else if(self.level == 3){
        loop = 4;
        alplabet = [@[@"e",@"e",@"f",@"f"] mutableCopy];
    }
    else if(self.level == 4){
        loop = 4;
        alplabet = [@[@"g",@"g",@"h",@"h"] mutableCopy];
    }
    else if(self.level == 5){
        loop = 4;
        alplabet = [@[@"i",@"i",@"j",@"j"] mutableCopy];
    }
    else if(self.level == 6){
        loop = 4;
        alplabet = [@[@"k",@"k",@"l",@"l"] mutableCopy];
    }
    else if(self.level == 7){
        loop = 4;
        alplabet = [@[@"m",@"m",@"n",@"n"] mutableCopy];
    }
    else if(self.level == 8){
        loop = 4;
        alplabet = [@[@"o",@"o",@"p",@"p"] mutableCopy];
    }
    else if(self.level == 9){
        loop = 4;
        alplabet = [@[@"q",@"q",@"r",@"r"] mutableCopy];
    }
    else if(self.level == 10){
        loop = 4;
        alplabet = [@[@"s",@"s",@"t",@"t"] mutableCopy];
    }
    else if(self.level == 11){
        loop = 4;
        alplabet = [@[@"u",@"u",@"v",@"v"] mutableCopy];
    }
    else if(self.level == 12){
        loop = 4;
        alplabet = [@[@"w",@"x",@"y",@"z"] mutableCopy];
    }
    else if(self.level == 13){
        loop = 10;
        alplabet = [@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j"] mutableCopy];
        
    }
    else if(self.level == 14){
        loop = 10;
        alplabet = [@[@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t"] mutableCopy];
        [self shuffle];
    }
    else if(self.level == 15){
        loop = 10;
        alplabet = [@[@"u",@"v",@"w",@"x",@"y",@"z",@"u",@"w",@"y",@"z"] mutableCopy];
        [self shuffle];
    }
    else if(self.level == 16){
        loop = 10;
        alplabet = [@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"] mutableCopy];
        [self shuffle];
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
