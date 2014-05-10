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

@interface StageSelectViewController (){
    CGPoint center;
    
    CGSize			world;
	CGFloat			scale;
	NSMutableArray*		tiles;
	NSMutableSet*		extraTiles;
	CGRect			tileBox;
    
	UIView*			content;
    
    Stage *stage;
}


@end

@implementation StageSelectViewController

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
    
    stage = [Stage sharedInstance];
   // [stage setStage:10];
    NSLog(@"%d",[stage currentStage]);
    for (UIButton* object in self.button) {
        if (object.tag <= [stage currentStage]) {
            NSLog(@"object = %d",object.tag);
            [object setImage:[UIImage imageNamed:@"UI_Icon_greed"] forState:UIControlStateNormal];
            
        }
        
    }
    
    
    center = CGPointMake(self.view.frame.size.width, self.view.frame.size.height);
    self.map.minimumZoomScale=1.0;
    self.map.maximumZoomScale=4.0;
    self.map.contentSize=CGSizeMake(1280, 960);
    
	// Do any additional setup after loading the view.
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.content;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
}

//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
