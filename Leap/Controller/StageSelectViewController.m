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

#import "Stage.h"
#import "Sound.h"

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
            vc.stage = stageNumber;
            [self presentViewController:vc animated:NO completion:nil];
            
        }
        else{
            
            UIStoryboard *storyboard     = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
            PhonicGameViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"GameUSA"];
            vc.stage = stageNumber;
            [self presentViewController:vc animated:NO completion:nil];
        } 
        
    }
    
}


-(BOOL) prefersStatusBarHidden
{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isConversation = true;
    
    selectedCurveIndex = 1;
    
    stage = [Stage sharedInstance];
   // [stage setStage:10];
    NSLog(@"%d",[stage currentStage]);
    for (UIButton* object in self.button) {
        if (object.tag <= [stage currentStage]) {
            NSLog(@"object = %d",object.tag);
            [object setImage:[UIImage imageNamed:@"UI_Icon_greed"] forState:UIControlStateNormal];
            
        }
        
    }
    
    score = [Score sharedInstance];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%i",[score score]];
    
    
    center = CGPointMake(self.view.frame.size.width, self.view.frame.size.height);
  
    self.map.minimumZoomScale=1.0;
    self.map.maximumZoomScale=4.0;
    self.map.contentSize=CGSizeMake(1024, 768);
    
    
    
    
	// Do any additional setup after loading the view.
  

 }

- (void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    soundBG = [[Sound alloc] init];
    [soundBG playSoundFile:@"selectcountry_music_bg"];
    [soundBG play];
    
    //********** Ballon ***********///////////
    
    UIButton *nextLevelButton = (UIButton *)[self.view viewWithTag:2];
    
    [ballonView moveTo:
     CGPointMake(nextLevelButton.center.x - (ballonView.frame.size.width/2),
                 nextLevelButton.frame.origin.y - (ballonView.frame.size.height + 5.0))
              duration:3.0
                option:curveValues[selectedCurveIndex]];

    
    if (isConversation) {
        [self conversation];
    }
    
    
}

- (void) conversation {
    
    app = [[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString object
    NSString *languageString = [standardUserDefaults stringForKey:@"language"];
    
    NSString *lion1;
    NSString *rat;
    NSString *lion2;
    
   
    
    
    if ([languageString isEqualToString:@"TH"]) {
        
        
        lion1 = @"    เมื่อสิ่งปลูกสร้างจากทั่วโลกถูกดอกเตอร์Xหนูจอมเวทย์สีม่วงใช้เวทย์มนต์ส่งลมพายุหมุนขนาดใหญ่ดูด   เอาสิ่งปลูกสร้างสวยงามจากทั่วโลกมาไว้ในหมู่เกาะขนาดใหญ่ของตน";
        rat = @"     เพียงเพราะต้องการตกแต่ง หมู่เกาะของตนให้ดูสวยงามขึ้น";//((LocalizeDataStore *)[app.listArray objectAtIndex:1]).TH;
        lion2 = @"     ทำให้ทีมนักผจญภัย LEAP ผู้รักในความยุติธรรม ประกอบไปด้วย เลโอสิงโตสีส้มผู้มีจิตใจกล้าหาญ , โปโป้ หมีแพนด้าสีขาวดำ ผู้มีพละกำลัง มหาศาล , รูบี้ กระต่ายสีชมพู  ผู้มีปัญญาฉลาดปราดเปรื่อง"; //((LocalizeDataStore *)[app.listArray objectAtIndex:2]).TH;
        converSound =  @[@"lion sound_02",@"rat001",@"lion sound_03"];
        
    }
    else if ([languageString isEqualToString:@"EN"]){
        
        lion1 = ((LocalizeDataStore *)[app.listArray objectAtIndex:0]).EN;
        rat = ((LocalizeDataStore *)[app.listArray objectAtIndex:1]).EN;
        lion2 = ((LocalizeDataStore *)[app.listArray objectAtIndex:2]).EN;
        
        converSound =  @[@"lion sound_02",@"rat001",@"lion sound_03"];
    }
    else if ([languageString isEqualToString:@"CN"]){
        
        lion1 = ((LocalizeDataStore *)[app.listArray objectAtIndex:0]).CN;
        rat = ((LocalizeDataStore *)[app.listArray objectAtIndex:1]).CN;
        lion2 = ((LocalizeDataStore *)[app.listArray objectAtIndex:2]).CN;
        
        converSound =  @[@"lion sound_02",@"rat001",@"lion sound_03"];
        
    }
    
    
    
    conversationSound = [[Sound alloc] init];
    conversationSound.delegate = self;
    currentSound = 0;
    [self playSound:currentSound];
    
   
    
  //  for (int i = 0; i < [converSound count]; i++) {
      
    
      //  [conversationSound playSoundFile:[converSound objectAtIndex:0]];
        //[conversationSound play];
        
      //  [NSThread sleepForTimeInterval:[conversationSound duration]];
        
   // }
 
    
    
  
    
}

- (void)playSound:(int)index{
    [conversationSound playSoundFile:[converSound objectAtIndex:index]];
    [conversationSound play];
     NSArray *animalArray = @[@"head_lion2.png",@"button_head_rat.png",@"head_lion2.png"];
     animalImageView.image = [UIImage imageNamed:[animalArray objectAtIndex:index]];
    
    
}
- (void)playFinish{
    currentSound++;
    
    if (currentSound < converSound.count) {
       
        [self playSound:currentSound];
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
