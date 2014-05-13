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

@interface ProfileViewController ()
{
    Sound *tuneSound;
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
    
    
}

- (IBAction)pressedSetting:(id)sender {
    
    self.frontView.hidden = NO;
    self.woodView.hidden = YES;
    self.woodImageView.hidden = YES;
    
    UIImage *imageSettingBG = [UIImage imageNamed:@"bg_setting.png"];
    self.backgroudImageView.image = imageSettingBG;
    
    
    
}

- (IBAction)pressedShop:(id)sender {
}

- (IBAction)pressedRanking:(id)sender {
}

- (IBAction)musicValueChanged:(ANPopoverSlider *)sender {
    
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setFloat:[sender value] forKey:@"tune"];
 
   // tuneSound.tune = [sender value];
    
  
}

- (IBAction)pressedClose:(id)sender {
    
    StageSelectViewController *stageView = [self.storyboard instantiateViewControllerWithIdentifier:@"stageView"];
    
    [self presentViewController:stageView animated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"profileItem";
    
    ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.backgroundColor = [UIColor clearColor];
  //  cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    
    
    // cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



@end
