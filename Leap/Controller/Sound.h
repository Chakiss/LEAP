//
//  Sound.h
//  Leap
//
//  Created by Suparuch Sriploy on 4/29/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Sound : NSObject <AVAudioPlayerDelegate> {
    
    AVAudioPlayer   *player;
    
    BOOL playing;
    NSTimeInterval duration;
}

@property (nonatomic, strong) AVAudioPlayer *player;
@property(readonly, getter=isPlaying) BOOL playing;
@property (readonly) NSTimeInterval duration;


-(void)GetSoundFileDuration:(NSString *) sound_file_name;
-(void)play;
-(void)stop;

-(void)setVolume:(float) volume;

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
- (void)playSoundFile:(NSString *) sound_file_name;

- (void)notPlaying;

@end
