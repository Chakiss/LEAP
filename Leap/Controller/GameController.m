//
//  GameController.m
//  Leap
//
//  Created by Chakrit Paniam on 4/27/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import "GameController.h"
#import "config.h"
#import "TileView.h"
#import "TargetView.h"
#import "USAGame.h"
#import "AnswerView.h"

@implementation GameController
{
    //tile lists
    NSMutableArray* _tiles;
    NSMutableArray* _targets;
    
    //stopwatch variables
    USAGame *usaGame;
    int _secondsLeft;
    NSTimer* _timer;
    KKProgressTimer *timer1;
    int currentLetter;
}


-(void)randomWordInLevel{
    
    NSAssert(self.level.level, @"no level loaded");

    int randomIndex = arc4random()%[self.level.level count];
    NSString* word = self.level.level[ randomIndex ];
    int wordLen = [word length];

    NSLog(@"phrase1[%i]: %@", wordLen, word);
    
    float tileSide = ceilf( kScreenWidth*0.3 / (float)wordLen ) - kTileMargin;

    float xOffset = (kScreenWidth - wordLen * (tileSide + kTileMargin))/2;
    
    //adjust for tile center (instead of the tile's origin)
    xOffset += tileSide/2;
    
    _tiles = [NSMutableArray arrayWithCapacity: wordLen];
    
    //2 create tiles
    for (int i=0 ; i<wordLen ; i++) {
        NSString* letter = [word substringWithRange:NSMakeRange(i, 1)];
        
        //3
        if (![letter isEqualToString:@" "]) {
            TileView* tile = [[TileView alloc] initWithLetter:letter andSideLength:tileSide];
            tile.center = CGPointMake(xOffset + i*(tileSide + kTileMargin), kScreenHeight/4*3);
    
            [self.gameView addSubview:tile];
            [_tiles addObject: tile];
        }
    }
    _targets = [NSMutableArray arrayWithCapacity: wordLen];
    
    // create targets
    for (int i=0;i<wordLen;i++) {
        NSString* letter = [word substringWithRange:NSMakeRange(i, 1)];
        
        if (![letter isEqualToString:@" "]) {
            TargetView* target = [[TargetView alloc] initWithLetter:letter andSideLength:tileSide];
            target.center = CGPointMake(xOffset + i*(tileSide + kTileMargin), kScreenHeight/2+100);
            
            [self.gameView addSubview:target];
            [_targets addObject: target];
        }
    }
    
    AnswerView *answer = [[AnswerView alloc] init];
    answer.center = CGPointMake(kScreenWidth/2, kScreenHeight/2-100);
    [self.gameView addSubview:answer];
}

- (void)playGame{

    UIView *clockView = [[UIView alloc] initWithFrame:CGRectMake(804, 548, 200, 200)];
    timer1 = [[KKProgressTimer alloc] initWithFrame:clockView.bounds];
    [clockView addSubview:timer1];
    timer1.delegate = self;
    timer1.tag = 1;
    
    [self.gameView addSubview:clockView];
    
    currentLetter = 0;
    usaGame = [[USAGame alloc] init];
    
    [self startGame];
    
}

- (void)startGame{
    if (_targets[currentLetter]) {
        TargetView* target = _targets[currentLetter];
        [usaGame playSoundWithLetter:target.letter];
        
        __block CGFloat i1 = 0;
        [timer1 startWithBlock:^CGFloat {
            return i1++ / 400;
        }];
        
    }
}









@end
