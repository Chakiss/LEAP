//
//  ViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "ViewController.h"
#import "ButtonAnimation.h"

@interface ViewController ()
{
    Sound *soundBG;
    Sound *soundClick;
    
    ButtonAnimation *animaton;
}
@end

@implementation ViewController

@synthesize languageButton;

@synthesize settingLanguageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     soundBG = [[Sound alloc] init];
    [soundBG playSoundFile:@"startscreen_music_bg"];
    [soundBG play];
    
    soundClick = [[Sound alloc] init];
    [soundClick playSoundFile:@"Button_sound"];
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString object
    NSString *getLanguage = [standardUserDefaults stringForKey:@"language"];
    
    if(!getLanguage)
        [standardUserDefaults setObject:@"TH" forKey:@"language"];

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

- (IBAction)pressedPopupViewChooseLangugae:(id)sender {
    
    [soundClick play];
    
    settingLanguageView.hidden = NO;

    [self.languageButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
}

- (IBAction)pressedChooseLanguage:(id)sender {
    
   [soundClick play];
   NSInteger tagLanguageButton =  [sender tag];
   
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    UIImage *languageImage;
    
    if (tagLanguageButton == 1){
        [standardUserDefaults setObject:@"TH" forKey:@"language"];
        languageImage = [UIImage imageNamed:@"flag_thai.png"];
    }else if (tagLanguageButton == 2){
        [standardUserDefaults setObject:@"EN" forKey:@"language"];
        languageImage = [UIImage imageNamed:@"flag_america.png"];

    }
    else if (tagLanguageButton == 3){
        [standardUserDefaults setObject:@"CN" forKey:@"language"];
        languageImage = [UIImage imageNamed:@"flag_china.png"];

    }
    settingLanguageView.hidden = YES;
    
   [languageButton setImage:languageImage forState:UIControlStateNormal];
  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
     if ([segue.identifier isEqualToString:@"storylineSegue"]) {
         
        [self.nextButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
         
         [soundClick play];
         
         [soundBG stop];
     }
}
@end
