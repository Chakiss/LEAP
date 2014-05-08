//
//  StageSelectViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "StageSelectViewController.h"
#import "PhonicGameViewController.h"


@interface StageSelectViewController (){
    CGPoint center;
    
    CGSize			world;
	CGFloat			scale;
	NSMutableArray*		tiles;
	NSMutableSet*		extraTiles;
	CGRect			tileBox;		
    
	UIView*			content;
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
    UIStoryboard *storyboard     = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    PhonicGameViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"GameThai"];
    vc.stage = 18;
    [self presentViewController:vc animated:NO completion:nil];
}


-(BOOL) prefersStatusBarHidden
{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    center = CGPointMake(self.view.frame.size.width, self.view.frame.size.height);
    self.map.minimumZoomScale=1.0;
    self.map.maximumZoomScale=4.0;
    self.map.contentSize=CGSizeMake(1280, 960);

	// Do any additional setup after loading the view.
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
   // UIView *view = [[UIView alloc] initWithFrame:scrollView.frame];
  //  for (id object in scrollView.subviews) {
    //    [view addSubview:object];
   // }
    return self.content;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
  
}
//
//- (CGRect)zoomRectForScrollView:(UIScrollView *)scrollView withScale:(float)scale withCenter:(CGPoint)center {
//    
//    CGRect zoomRect;
//    
//    // The zoom rect is in the content view's coordinates.
//    // At a zoom scale of 1.0, it would be the size of the
//    // imageScrollView's bounds.
//    // As the zoom scale decreases, so more content is visible,
//    // the size of the rect grows.
//    zoomRect.size.height = scrollView.frame.size.height / scale;
//    zoomRect.size.width  = scrollView.frame.size.width  / scale;
//    
//    // choose an origin so as to get the right center.
//    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
//    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
//    
//    return zoomRect;
//
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
