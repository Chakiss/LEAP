//
//  TitleView.h
//  Leap
//
//  Created by Chakrit Paniam on 4/27/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TileView;

@protocol TileTouchDelegate <NSObject>
//-(void)tileView:(TileView*)tileView didDragToPoint:(CGPoint)pt;
- (void)touchLetter:(NSString *)letter;
@end


@interface TileView : UIImageView

@property (strong, nonatomic, readonly) NSString* letter;
@property (assign, nonatomic) BOOL isMatched;
@property (weak, nonatomic) IBOutlet id<TileTouchDelegate> delegate;

-(instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength;
- (void)setLetter:(NSString *)letter;
@end
