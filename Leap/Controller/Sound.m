//
//  Sound.m
//  Leap
//
//  Created by Suparuch Sriploy on 4/29/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import "Sound.h"

@implementation Sound

@synthesize player;
@synthesize playing;
@synthesize duration;

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:nil error:nil];
        self.player.delegate = self;
    }
    return self;
}

- (void) setVolume:(float)volume
{
    [player setVolume:volume];
}

- (void)playSoundFile:(NSString *)sound_file_name{
    
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:sound_file_name ofType:@"mp3"];
    NSURL *sound_file = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    
    NSError *error = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:sound_file error:&error];
    self.player.delegate = self;
    [self.player setNumberOfLoops:0];
    duration = self.player.duration;
    [self.player prepareToPlay];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"audioPlayerDidFinishPlaying");
    playing = NO;
}


- (void) play
{
    NSLog(@"Play Called");
    [self.player setVolume:1.0];
    [self.player play];
    playing = YES;
}

- (void) stop
{
    NSLog(@"Stop Called");
    [player stop];
    playing = NO;
}


-(void)GetSoundFileDuration:(NSString *) sound_file_name
{
    NSLog(@"%f",duration);
}

-(void) notPlaying
{
    playing = NO;
}



@end
