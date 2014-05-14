//
//  PhonicGameViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "PhonicGameViewController.h"
#import "PhonicGame.h"
#import "NSMutableArray+ShuffledArray.h"
#import "KKProgressTimer.h"
#import "ButtonAnimation.h"
#import "Sound.h"
#import "ProfileViewController.h"

@interface PhonicGameViewController (){
    NSArray *soundArray;
    PhonicGame * phonicGame;
    NSMutableArray *indexArray;
    int check;
    int currentLoop;
    int countLoop;
    int max;
    int min;
    NSMutableArray *alphabetPlay;
    Sound *soundClick;
    
}

@end

@implementation PhonicGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.level == 0) {
        
        self.level = 19;
        
    }
    
    
    indexArray = [NSMutableArray arrayWithObjects:
                  [NSValue valueWithCGRect:CGRectMake(210, 212, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(296, 212, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(380, 212, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(465, 212, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(553, 212, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(641, 212, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(727, 212, 88, 87)],
                  
                  [NSValue valueWithCGRect:CGRectMake(210, 298, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(296, 298, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(380, 298, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(465, 298, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(553, 298, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(641, 298, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(727, 298, 88, 87)],
                  
                  
                  [NSValue valueWithCGRect:CGRectMake(210, 384, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(296, 384, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(380, 384, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(465, 384, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(553, 384, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(641, 384, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(727, 384, 88, 87)],
                  
                  
                  [NSValue valueWithCGRect:CGRectMake(296, 469, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(380, 469, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(465, 469, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(553, 469, 88, 87)],
                  [NSValue valueWithCGRect:CGRectMake(641, 469, 88, 87)],
                  
                  
                  nil];
    
    self.scoreLabel.text = 0;
    self.timer1.delegate = self;
    self.timer1.tag = 1;
    check = 0;
    currentLoop = 0;
    [self playWithStage];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
   // self.hi.text = [NSString stringWithFormat:@"%ld",(long)[myScore getLevelHeightScore:self.level]];
    self.scoreLabel.text = @"0";
    
}

- (void)playWithStage{
    
    phonicGame = [[PhonicGame alloc] init];
    phonicGame.stage = self.level;
    [self stageCheck];
    [self moveIn];
    
    
}

- (void)playGame{
    NSLog(@"%d of %d",currentLoop,countLoop);
    if (currentLoop > countLoop) {
        NSLog(@"END!!!");
        [self.timer1 stop];
    }
    else{
        __block CGFloat i1 = 0;
        [self.timer1 startWithBlock:^CGFloat {
            return i1++ / 400;
        }];
        [phonicGame playSoundWithSoundID:[alphabetPlay[currentLoop] integerValue]];
    }
}



#pragma mark KKProgressTimerDelegate Method
- (void)didUpdateProgressTimer:(KKProgressTimer *)progressTimer percentage:(CGFloat)percentage {
    if (percentage >= 1) {
        [progressTimer stop];
    }
}
- (void)didStopProgressTimer:(KKProgressTimer *)progressTimer percentage:(CGFloat)percentage {
    if (currentLoop > countLoop)
        
    {

    }else{
        currentLoop++;
        [self shuffleButton];
        [self moveOut];
    }
}

-(void)shuffleButton{
    //Randomize the array
    
    NSUInteger count = [indexArray count];
    for (NSUInteger i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [indexArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    
}

- (IBAction) playaction:(id)sender {
    currentLoop++;
    if ([phonicGame checkResult:[sender tag]] == 1) {  //ถูก
        self.scoreLabel.text = [NSString stringWithFormat:@"%d",phonicGame.total];
        [self playGame];
    }
    else{ // ผิด
        
        [self shuffleButton];
        [self moveOut];
    }
}


- (void)moveOut{
    int i = 0;
    for (UIButton *b in self.alphabetBotton) {
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            b.frame = CGRectMake(b.frame.origin.x, b.frame.origin.y + 1000, b.frame.size.width, b.frame.size.height);
            
        } completion:^(BOOL finished) {
            
            [self moveIn];
            
        }];
        ++i;
    }
}

- (void)moveIn{
    for (UIButton *b in self.alphabetBotton) {
        b.frame = CGRectMake(b.frame.origin.x, -1000, b.frame.size.width, b.frame.size.height);
    }
    int i = 0;
    
    for (UIButton *b in self.alphabetBotton) {
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            b.frame = [((NSValue *)indexArray[i]) CGRectValue];
        } completion:^ (BOOL finished)
         {
             if (finished) {
                 check++;
                 if (check == 26) {
                     [self checkAnimation];
                 }
            }
         }];
        ++i;

    }
   
   
    
}

- (void)checkAnimation{
    if (check == 26) {
        check = 0;
        [self playGame];
    }
}


- (IBAction)platCurrentSound:(id)sender{
    [phonicGame playCurrentSound];
}

- (IBAction)profileTapped:(id)sender {
    
    ProfileViewController *profileView = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileView"];
    [self presentViewController:profileView animated:YES completion:nil];
    
}
- (IBAction)backButtonTapped:(id)sender{
    
    soundClick = [[Sound alloc] init];
    [soundClick playSoundFile:@"Button_sound"];
    
    [soundClick play];
    
    [self.backButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)stageCheck{
    if (self.level == 17) {
        min = 0;
        max = 2;
    }
    else if (self.level == 18){
        min = 3;
        max = 5;
    }
    else if (self.level == 19){
        min = 6;
        max = 8;
    }
    else if (self.level == 20){
        min = 9;
        max = 12;
    }
    else if (self.level == 21){
        min = 13;
        max = 15;
    }
    else if (self.level == 22){
        min = 16;
        max = 18;
    }
    else if (self.level == 23){
        min = 19;
        max = 21;
    }
    else if (self.level == 24){
        min = 22;
        max = 25;
    }
    else if (self.level == 25){
        min = 0;
        max = 4;
    }
    else if (self.level == 26){
        min = 5;
        max = 9;
    }
    else if (self.level == 27){
        min = 10;
        max = 14;
    }
    else if (self.level == 28){
        min = 0;
        max = 14;
    }
    else if (self.level == 29){
        min = 0;
        max = 5;
    }
    else if (self.level == 30){
        min = 6;
        max = 15;
    }
    else if (self.level == 31){
        min = 16;
        max = 25;
    }
    else{
        min = 0;
        max = 25;
    }
    
    
    countLoop = (max - min);
    
    if (self.level == 28 || self.level == 32) {
        countLoop = 9;
    }
    
    alphabetPlay = [NSMutableArray array];
    for (int i = min; i <= max;  i++) {
        [alphabetPlay addObject:[NSNumber numberWithInt:i]];
    }
    
    NSUInteger count = [alphabetPlay count];
    for (NSUInteger i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [alphabetPlay exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
}


@end
