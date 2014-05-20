//
//  ProfileViewController.m
//  Leap
//
//  Created by Suparuch Sriploy on 4/29/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import "ProfileViewController.h"

#import "ProfileCell.h"
#import "Sound.h"
#import "StageSelectViewController.h"
#import "ButtonAnimation.h"
#import "KxMenu.h"

@interface ProfileViewController ()
{
    Sound *tuneSound;
    Sound *clickSound;
    BOOL isShop;
    
    //*** makeData *//
    NSArray *barrierImageArray;
    UILabel *commingSoonLabel;

    // Raking MakeData
    NSArray *userArray;
    NSArray *nameArray;
    NSArray *trophyArray;
    NSArray *flagArray;
    
    //*************//
}

@end

@implementation ProfileViewController



-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self customSlider];
    
}

- (void)customSlider{
    
    //self.soundFXSlider.backgroundColor = [UIColor clearColor];
    UIImage *stetchLeftTrack = [[UIImage imageNamed:@"orangeslide.png"]
                                stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
    UIImage *stetchRightTrack = [[UIImage imageNamed:@"yellowslide.png"]
                                 stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
    [self.musicSlider setThumbImage: [UIImage imageNamed:@"slider_ball.png"] forState:UIControlStateNormal];
    [self.soundFXSlider setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
    [self.soundFXSlider setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *tableImage = [UIImage imageNamed:@"bg_ui_ranking.png"];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:self.myTableView.frame];
    [img setImage:tableImage];
    self.myTableView.backgroundView = img;
    self.myTableView.backgroundColor = [UIColor clearColor];
    
    //Sound
    
    tuneSound = [[Sound alloc] init];
    
    //**************** --- shop -- ************************///
    
    self.frontView.hidden = YES;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger goldInteger = [defaults integerForKey:@"gold"];
    
    self.goldLabel.text = [NSString stringWithFormat:@"%zd",goldInteger];
    
    isShop = true;
    
    [self makeData];
    
    [self language:nil];
}

- (void)language:(KxMenuItem *)langugae{
    
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
   
    if (langugae.title){
       [standardUserDefaults setObject:langugae.title forKey:@"language"];
    }
       
    NSString *languageString = [standardUserDefaults stringForKey:@"language"];
    UIImage * imageName;
    if ([languageString isEqualToString:@"TH"])
        imageName = [UIImage imageNamed:@"flag_thai.png"];
    else if ([languageString isEqualToString:@"EN"])
         imageName = [UIImage imageNamed:@"flag_america.png"];
    else if ([languageString isEqualToString:@"CN"])
        imageName = [UIImage imageNamed:@"flag_china.png"];

    self.languageImageView.image = imageName;
}


- (void)makeData {
    
    barrierImageArray = @[@"sticker_02.png",@"sticker_03.png",@"sticker_05.png"];
    
    userArray = @[@"female_user.png", @"male.png",@"User-icon.png"];
    
    nameArray = @[@"Lion",@"Rabbit",@"Rat"];
    
    trophyArray = @[@"gold.png",@"silver.png",@"copper.png"];
    
    flagArray = @[@"flag_america.png",@"flag_china.png",@"flag_thai.png"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressedMore:(id)sender {
    
    [self.moreButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    clickSound = [[Sound alloc] init];
    [clickSound playSoundFile:@"Button_sound"];
    [clickSound play];
    /*
    self.frontView.hidden = NO;
    //self.settingView.hidden = YES;
    self.coinImageView.hidden = YES;
    self.goldLabel.hidden = YES;
    
    commingSoonLabel = [[UILabel alloc] init];
    //self.frontView.center = CGPointMake(self.frontView.frame.size.width / 2, self.frontView.frame.size.height / 2);
    [commingSoonLabel setCenter:self.frontView.center];
    commingSoonLabel.text = @"COMMING SOON";
    commingSoonLabel.textColor = [UIColor redColor];
    commingSoonLabel.hidden = NO;
    
    [commingSoonLabel addSubview:self.frontView];
     */
  
}

- (IBAction)pressedSetting:(id)sender {
    
    [self.settingButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    clickSound = [[Sound alloc] init];
    [clickSound playSoundFile:@"Button_sound"];
    [clickSound play];
    
    self.frontView.hidden = NO;
    self.settingView.hidden = NO;
    self.woodView.hidden = YES;
    self.woodImageView.hidden = YES;
   commingSoonLabel.hidden = YES;
    self.coinImageView.hidden = YES;
    self.goldLabel.hidden = YES;
    
    UIImage *imageSettingBG = [UIImage imageNamed:@"bg_setting.png"];
    self.backgroudImageView.image = imageSettingBG;
    
    self.frontView.backgroundColor = [UIColor clearColor];
    
    
    
}

- (IBAction)pressedShop:(id)sender {
    
    [self.shopButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    clickSound = [[Sound alloc] init];
    [clickSound playSoundFile:@"Button_sound"];
    [clickSound play];
    
    self.woodView.hidden = NO;
    self.woodImageView.hidden = NO;
    self.frontView.hidden = YES;
    self.coinImageView.hidden = NO;
    self.goldLabel.hidden = NO;
    
    UIImage *imageSettingBG = [UIImage imageNamed:@"profile_shop.png"];
    self.backgroudImageView.image = imageSettingBG;
    
    isShop = true;
    
    [self.myTableView reloadData];
    
}

- (IBAction)pressedRanking:(id)sender {
    
    [self.rankingButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    clickSound = [[Sound alloc] init];
    [clickSound playSoundFile:@"Button_sound"];
    [clickSound play];
    
    self.woodView.hidden = NO;
    self.woodImageView.hidden = NO;
    self.frontView.hidden = YES;
    self.coinImageView.hidden = NO;
    self.goldLabel.hidden = NO;
    
    UIImage *imageSettingBG = [UIImage imageNamed:@"profile_shop.png"];
    self.backgroudImageView.image = imageSettingBG;
    
    isShop = false;
    
    [self.myTableView reloadData];
}

- (IBAction)musicValueChanged:(ANPopoverSlider *)sender {
    
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setFloat:[sender value] forKey:@"tune"];
 
   // tuneSound.tune = [sender value];

}

- (IBAction)languageTapped:(UIButton *)sender {
    
    UIImage * imageTH = [UIImage imageNamed:@"thai.png"];
    UIImage * imageEN = [UIImage imageNamed:@"thai.png"];
    UIImage * imageCN = [UIImage imageNamed:@"thai.png"];
  
    
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"TH"
                     image:imageTH
                    target:nil
                    action:@selector(language:)],
      
      [KxMenuItem menuItem:@"EN"
                     image:imageEN
                    target:self
                    action:@selector(language:)],
      
      [KxMenuItem menuItem:@"CN"
                     image:imageCN
                    target:self
                    action:@selector(language:)],

      ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    [KxMenu showMenuInView:self.view
                  fromRect:sender.frame
                 menuItems:menuItems];
    
}

- (IBAction)pressedClose:(id)sender {
    
    [self.closeButton.layer addAnimation:[ButtonAnimation animationButton] forKey:@"zoom"];
    
    clickSound = [[Sound alloc] init];
    [clickSound playSoundFile:@"Button_sound"];
    [clickSound play];
    
   // StageSelectViewController *stageView = [self.storyboard instantiateViewControllerWithIdentifier:@"stageView"];
    
   // [self presentViewController:stageView animated:YES completion:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
   
    if (isShop) {
       identifier = @"shopCell";
    }
    else{
        identifier = @"profileCell";
    }
    
    ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *imageName;
    if (isShop) {
        
        imageName = [barrierImageArray objectAtIndex:indexPath.row];
        cell.barrierImageView.image = [UIImage imageNamed:imageName];
        
    }
    else{
        
        imageName = [userArray objectAtIndex:indexPath.row];
        cell.userImageView.image = [UIImage imageNamed:imageName];
        cell.nameLabel.text = [nameArray objectAtIndex:indexPath.row];
        cell.scoreLabel.text = [NSString stringWithFormat:@"Score  8000"];
        cell.goldLabel.text = [NSString stringWithFormat:@"Gold  66342"];
        cell.flagImageView.image = [UIImage imageNamed:[flagArray objectAtIndex:indexPath.row]];
        cell.trophyImageView.image = [UIImage imageNamed:[trophyArray objectAtIndex:indexPath.row]];
        
    }
    
    
   
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



@end
