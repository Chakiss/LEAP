//
//  ViewController.m
//  Leap
//
//  Created by Chakrit Paniam on 3/2/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "ViewController.h"

#import "Sound.h"

@interface ViewController ()
{
    Sound *playSound;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    playSound = [[Sound alloc] init];
    [playSound PlaySoundFile:@"startscreen_music_bg"];
    [playSound play];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    /*
     When a row is selected, the segue creates the detail view controller as the destination.
     Set the detail view controller's detail item to the item associated with the selected row.
     */
     playSound = [[Sound alloc] init];
    [playSound PlaySoundFile:@"Button_sound"];
    [playSound play];
    
    [playSound stop];

}



- (IBAction)nextButton:(id)sender {
    
    playSound = [[Sound alloc] init];
    [playSound PlaySoundFile:@"Button_sound"];
    [playSound play];
}
@end
