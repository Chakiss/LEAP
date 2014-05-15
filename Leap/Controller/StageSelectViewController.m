//
//  StageSelectViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "StageSelectViewController.h"
#import "PhonicGameViewController.h"
#import "ChinaGameViewController.h"
#import "ProfileViewController.h"

#import "Stage.h"
#import "Sound.h"
#import "StoryLineViewController.h"
#import "ButtonAnimation.h"
#import "GeneralUtility.h"
#import "Message.h"
#import "PopupContryViewController.h"

static BOOL isConversation = true;

static int curveValues[] = {
    UIViewAnimationOptionCurveEaseInOut,
    UIViewAnimationOptionCurveEaseIn,
    UIViewAnimationOptionCurveEaseOut,
    UIViewAnimationOptionCurveLinear };

@interface StageSelectViewController (){
    CGPoint center;
    
    CGSize			world;
	NSMutableArray*		tiles;
	NSMutableSet*		extraTiles;
	CGRect			tileBox;
    
    
	UIView*			content;
    NSArray *converSound;
    NSArray *conversationTextArray;
    int currentSound;
    
    Stage *stage;
    
    Sound *soundBG;
    Sound *conversationSound;

}


@end

@implementation StageSelectViewController
@synthesize ballonImageView;
@synthesize ballonView;
@synthesize footerView;
@synthesize animalImageView;
@synthesize goldLabel;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (IBAction)stageSelect:(id)sender{
    
    int stageNumber = ((UIButton *)sender).tag;
    UIImage* redButton = [UIImage imageNamed:@"UI_Icon_red.png"];
    
    if (((UIButton *)sender).currentImage == redButton) {
        NSLog(@"can't play");
    }
    else{
        
        if (stageNumber >=1 && stageNumber <= 16) {
            
            UIStoryboard *storyboard     = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
            ChinaGameViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"GameChina"];
            vc.level = stageNumber;
            [self presentViewController:vc animated:NO completion:nil];
            
        }
        else if (stageNumber >=17 && stageNumber <= 32) {
            
            UIStoryboard *storyboard     = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
            PhonicGameViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"GameThai"];
            vc.level = stageNumber;
            [self presentViewController:vc animated:NO completion:nil];
            
        }
        else{
            
            UIStoryboard *storyboard     = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
            PhonicGameViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"GameUSA"];
            vc.level = stageNumber;
            [self presentViewController:vc animated:NO completion:nil];
        } 
        
    }
    
}

- (IBAction)pressedProfile:(id)sender {
    
    ProfileViewController *profileView = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileView"];
    [self presentViewController:profileView animated:YES completion:nil];
  
}

- (IBAction)backAction:(id)sender {
    
  [self.backButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    StoryLineViewController *storyView = [self.storyboard instantiateViewControllerWithIdentifier:@"StorylineView"];
    
    [self presentViewController:storyView animated:YES completion:nil];
    
}

- (IBAction)popupTapped:(UIButton *)sender {
  
    NSInteger buttonTag = [sender tag];
    
    PopupContryViewController *popupView = [self.storyboard instantiateViewControllerWithIdentifier:@"PopupView"];
    popupView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    popupView.modalPresentationStyle=UIModalPresentationFormSheet;
    popupView.view.superview.backgroundColor = [UIColor clearColor];
    [self presentViewController:popupView animated:YES completion:nil];
    
  
}


-(BOOL) prefersStatusBarHidden
{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    selectedCurveIndex = 1;
    
   
   // [stage setStage:10];
    NSLog(@"%d",[stage currentStage]);
    for (UIButton* object in self.button) {
        if (object.tag <= [stage currentStage]) {
            NSLog(@"object = %ld",(long)object.tag);
            [object setImage:[UIImage imageNamed:@"UI_Icon_greed"] forState:UIControlStateNormal];
            
        }
        
    }
    
    heightScore = [Score sharedInstance];
    
    gold = [[Gold alloc] init];
   
    center = CGPointMake(self.view.frame.size.width, self.view.frame.size.height);
  
    self.map.minimumZoomScale=1.0;
    self.map.maximumZoomScale=4.0;
    self.map.contentSize=CGSizeMake(1024, 768);
    
    NSInteger myTotalScore = [heightScore totalScore];
    NSInteger myGold = [gold getTotalGold];
    
    self.goldLabel.text = [NSString stringWithFormat:@"%li",(long)myGold];
    self.scoreLabel.text = [NSString stringWithFormat:@"%li",(long)myTotalScore];
    
  

 }

- (void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    UIButton *nextLevelButton ;
    stage = [Stage sharedInstance];
    int currentStage = [stage currentStage];
    NSLog(@"current stage = %d",currentStage);
    for (UIButton *object in self.button) {
        
        if (object.tag <= currentStage) {
            [object setImage:[UIImage imageNamed:@"UI_Icon_greed.png"] forState:UIControlStateNormal];
            nextLevelButton = object;
        }
    }
    
    
    soundBG = [[Sound alloc] init];
    [soundBG playSoundFile:@"selectcountry_music_bg"];
    [soundBG play];
    
    //********** Ballon ***********///////////
   
    //UIButton *nextLevelButton = (UIButton *)[self.view viewWithTag:2];
    NSLog(@"tag : %ld",(long)[nextLevelButton tag]);
    if ([nextLevelButton tag] > 1) {
        [ballonView moveTo:
         CGPointMake(nextLevelButton.center.x - (ballonView.frame.size.width/2),
                     nextLevelButton.frame.origin.y - (ballonView.frame.size.height + 5.0))
                  duration:3.0
                    option:curveValues[selectedCurveIndex]];
    }
   

    if (isConversation) {
        [self conversation];
    }
    
   
}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    footerView.hidden = YES;
    isConversation = false;
    
   [soundBG stop];
    [conversationSound stop];
    
}

- (void) conversation {
    

    NSString *lion1 = [Message getMessage:6];
    NSString *rat = [Message getMessage:7];
    NSString *lion2 = [Message getMessage:8];
    
    converSound =  @[@"lion sound_02",@"rat001",@"lion sound_03"];
        
    
     conversationTextArray = @[lion1,rat,lion2];

    conversationSound = [[Sound alloc] init];
    conversationSound.delegate = self;
    currentSound = 0;
    [self playSound:currentSound];
    
   
    
}

- (void)playSound:(int)index{
    [conversationSound playSoundFile:[converSound objectAtIndex:index]];
    [conversationSound play];
     NSArray *animalArray = @[@"head_lion2.png",@"button_head_rat.png",@"head_lion2.png"];
     animalImageView.image = [UIImage imageNamed:[animalArray objectAtIndex:index]];
    NSString *conversationString = [conversationTextArray objectAtIndex:index];
    self.conversationTxt.text = [NSString stringWithFormat:@"%@",conversationString];
    self.conversationTxt.font = [GeneralUtility fontThaiAndEng];
    
    
}
- (void)playFinish{
    currentSound++;
    
    if (currentSound < converSound.count) {
       
        [self playSound:currentSound];
        
          isConversation = false;
    }
    else{
        footerView.hidden = YES;
        isConversation = false;
    }
    
}

-(void)setNextImage:(NSString*)nextImage{

    animalImageView.image = [UIImage imageNamed:nextImage];
    
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.content;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
 

}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view //available starting with iOS 3.2
{
   
    [scrollView setScrollEnabled:FALSE];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    if(scale > 1)
        [scrollView setScrollEnabled:TRUE];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
