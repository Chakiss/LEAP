//
//  StoryLineViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "StoryLineViewController.h"

#import "AppDelegate.h"

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

AppDelegate *app;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    nameBGSoundArray = @[@"music_storyline1",@"music_storyline2",@"music_storyline3"];
    
    soundBG = [[Sound alloc] init];
    [soundBG playSoundFile:[nameBGSoundArray objectAtIndex:0]];
    [soundBG play];

    currentTextStory = 0;
    
    app = [[UIApplication sharedApplication] delegate];
    
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString object
    NSString *languageString = [standardUserDefaults stringForKey:@"language"];
    
    NSString *Storyline1;
    NSString *Storyline11;
    NSString *Storyline2;
    NSString *Storyline21;
    NSString *Storyline3;
    NSString *Storyline32;
    
    
    
    if ([languageString isEqualToString:@"TH"]) {
        
        //Storyline1 = ((LocalizeDataStore *)[app.listArray objectAtIndex:0]).TH;
        Storyline1 = @"    เมื่อสิ่งปลูกสร้างจากทั่วโลกถูกดอกเตอร์Xหนูจอมเวทย์สีม่วงใช้เวทย์มนต์ส่งลมพายุหมุนขนาดใหญ่ดูด   เอาสิ่งปลูกสร้างสวยงามจากทั่วโลกมาไว้ในหมู่เกาะขนาดใหญ่ของตน";
        Storyline11 = @"     เพียงเพราะต้องการตกแต่ง หมู่เกาะของตนให้ดูสวยงามขึ้น";//((LocalizeDataStore *)[app.listArray objectAtIndex:1]).TH;
        Storyline2 = @"     ทำให้ทีมนักผจญภัย LEAP ผู้รักในความยุติธรรม ประกอบไปด้วย เลโอสิงโตสีส้มผู้มีจิตใจกล้าหาญ , โปโป้ หมีแพนด้าสีขาวดำ ผู้มีพละกำลัง มหาศาล , รูบี้ กระต่ายสีชมพู  ผู้มีปัญญาฉลาดปราดเปรื่อง"; //((LocalizeDataStore *)[app.listArray objectAtIndex:2]).TH;
        Storyline21 = @"     ต้องการที่จะทวงสิ่งปลูกสร้างที่ถูกขโมยไป ให้กลับคืนมาไว้ดังเดิม";//((LocalizeDataStore *)[app.listArray objectAtIndex:3]).TH;
        Storyline3 = @"    พวกเขาทั้งสามจึงได้เดินทางไปยังหมู่เกาะของจอมเวทย์สีม่วง";//((LocalizeDataStore *)[app.listArray objectAtIndex:4]).TH;
        Storyline32 = @"    เพื่อทำลายเวทย์มนต์และนำสิ่งปลูกสร้างที่ถูกขโมยไป ให้กลับคืนมาให้จงได้";//((LocalizeDataStore *)[app.listArray objectAtIndex:5]).TH;
        
        nameSoundArray = @[@"voice001",@"voice002",@"voice003"];
        
    }
    else if ([languageString isEqualToString:@"EN"]){
        
        Storyline1 = ((LocalizeDataStore *)[app.listArray objectAtIndex:0]).EN;
        Storyline11 = ((LocalizeDataStore *)[app.listArray objectAtIndex:1]).EN;
        Storyline2 = ((LocalizeDataStore *)[app.listArray objectAtIndex:2]).EN;
        Storyline21 = ((LocalizeDataStore *)[app.listArray objectAtIndex:3]).EN;
        Storyline3 = ((LocalizeDataStore *)[app.listArray objectAtIndex:4]).EN;
        Storyline32 = ((LocalizeDataStore *)[app.listArray objectAtIndex:5]).EN;
        
        nameSoundArray = nil;
        
    }
    else if ([languageString isEqualToString:@"CN"]){
    
        Storyline1 = ((LocalizeDataStore *)[app.listArray objectAtIndex:0]).CN;
        Storyline11 = ((LocalizeDataStore *)[app.listArray objectAtIndex:1]).CN;
        Storyline2 = ((LocalizeDataStore *)[app.listArray objectAtIndex:2]).CN;
        Storyline21 = ((LocalizeDataStore *)[app.listArray objectAtIndex:3]).CN;
        Storyline3 = ((LocalizeDataStore *)[app.listArray objectAtIndex:4]).CN;
        Storyline32 = ((LocalizeDataStore *)[app.listArray objectAtIndex:5]).CN;
        
        nameSoundArray = nil;
        
    }
    
    
    converSound = [[Sound alloc] init];
    [converSound playSoundFile:[nameSoundArray objectAtIndex:0]];
    [converSound play];

    
    currentImageStory = 0;
    currentTextStory = 0;
 

    storyLineImageArray = @[@"storyline1",@"storyline2",@"storyline3"];
    storyLineTextArray = @[Storyline1,Storyline11,Storyline2,Storyline21,Storyline3,Storyline32];
    
    self.StoryLineTextView.text = storyLineTextArray[currentTextStory];
    
  
    
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
    
    clickSound = [[Sound alloc] init];
    [clickSound playSoundFile:@"Button_sound"];
       [clickSound play];

    if (currentTextStory < storyLineTextArray.count-1) {
        currentTextStory++;
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


}

- (IBAction)backButtonTapped:(id)sender {
    
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
