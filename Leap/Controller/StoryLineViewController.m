//
//  StoryLineViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "StoryLineViewController.h"

#import "AppDelegate.h"
#import "ButtonAnimation.h"
#import "GeneralUtility.h"
#import "Message.h"

@interface StoryLineViewController (){
    
    NSArray *storyLineImageArray;
    NSArray *storyLineTextArray;
    NSArray *nameBGSoundArray;
    NSArray *nameSoundArray;
    int currentImageStory ;
    int currentTextStory;
    Sound *soundBG;
    Sound *converSound;
    Sound *clickSound;
}

@end

@implementation StoryLineViewController

@synthesize localizeDataStore;
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
   
    nameBGSoundArray = @[@"music_storyline1",@"music_storyline2",@"music_storyline3"];
    
    soundBG = [[Sound alloc] init];
    [soundBG playSoundFile:[nameBGSoundArray objectAtIndex:0]];
    [soundBG play];

    currentTextStory = 0;
    
    NSString *Storyline1 = [NSString stringWithFormat:@"\n     %@",[Message getMessage:0]];
    NSString *Storyline11 = [NSString stringWithFormat:@"\n     %@",[Message getMessage:1]];
    NSString *Storyline2 =[NSString stringWithFormat:@"\n     %@",[Message getMessage:2]];
    NSString *Storyline21 = [NSString stringWithFormat:@"\n     %@",[Message getMessage:3]];
    NSString *Storyline3 = [NSString stringWithFormat:@"\n     %@",[Message getMessage:4]];
    NSString *Storyline32 = [NSString stringWithFormat:@"\n     %@",[Message getMessage:5]];

    nameSoundArray = @[@"voice001",@"voice002",@"voice003"];
        
    converSound = [[Sound alloc] init];
    [converSound playSoundFile:[nameSoundArray objectAtIndex:0]];
    [converSound play];

    
    currentImageStory = 0;
    currentTextStory = 0;
 

    storyLineImageArray = @[@"storyline1",@"storyline2",@"storyline3"];
    storyLineTextArray = @[Storyline1,Storyline11,Storyline2,Storyline21,Storyline3,Storyline32];
    
    self.StoryLineTextView.text =[storyLineTextArray[currentTextStory] stringByReplacingOccurrencesOfString: @"\\n" withString: @"\n"];
    self.StoryLineTextView.font = [GeneralUtility fontThaiAndEng];
    
    
    [self checkHiddenButton];
    
    [self.StoryLineTextView sizeToFit];
    
	// Do any additional setup after loading the view.
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

- (void)checkHiddenButton{
    if (currentTextStory == 0) {
        self.backButton.hidden = YES;
        self.nextStage.hidden = YES;
    }
    else if(currentTextStory == 5){
        self.nextButton.hidden = YES;
        self.nextStage.hidden = NO;
     
        
    }
    else{
        self.backButton.hidden = NO;
        self.nextStage.hidden = YES;
    }
    
}
- (IBAction)nextButtonTapped:(id)sender {
    
    [self.nextButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    currentTextStory++;
    
    clickSound = [[Sound alloc] init];
    [clickSound playSoundFile:@"Button_sound"];
    [clickSound play];

    if (currentTextStory < storyLineTextArray.count-1) {
       
        self.StoryLineTextView.text = storyLineTextArray[currentTextStory];
        
        self.storyLineImageView.image = [UIImage imageNamed:storyLineImageArray[currentTextStory/2]];
        
        if (currentTextStory == 2) {
            [soundBG playSoundFile:[nameBGSoundArray objectAtIndex:1]];
            [converSound playSoundFile:[nameSoundArray objectAtIndex:1]];
            
        }
        else if(currentTextStory == 4){
            
            [soundBG playSoundFile:[nameBGSoundArray objectAtIndex:2]];
            [converSound playSoundFile:[nameSoundArray objectAtIndex:2]];
           
        }
       
    }
    [self checkHiddenButton];
    [soundBG play];
    [converSound play];
    
    if (currentTextStory == 6) {
        [soundBG stop];
        [converSound stop];
    }


}

- (IBAction)backButtonTapped:(id)sender {
    
    [self.backButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    clickSound = [[Sound alloc] init];
    [clickSound playSoundFile:@"Button_sound"];
    [clickSound play];
    
    
    if (currentTextStory >= 0) {
        
        currentTextStory--;
        
        if (currentTextStory == 1) {
            
             self.StoryLineTextView.text = storyLineTextArray[currentTextStory];
             self.storyLineImageView.image = [UIImage imageNamed:storyLineImageArray[0]];
            
            [soundBG playSoundFile:[nameBGSoundArray objectAtIndex:0]];
          
        }
        else if(currentTextStory == 3){
            
            [soundBG playSoundFile:[nameBGSoundArray objectAtIndex:1]];
            
            
            self.StoryLineTextView.text = storyLineTextArray[currentTextStory];
            self.storyLineImageView.image = [UIImage imageNamed:storyLineImageArray[1]];
            
        }
        
        
    }
    
    [soundBG play];
    [self checkHiddenButton];
    


}
@end
