//
//  AlphabetView.h
//  Leap
//
//  Created by Chakrit Paniam on 4/30/2557 BE.
//  Copyright (c) 2557 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlphabetViewDelegate <NSObject>
-(void)end;
@end

@interface AlphabetView : UIImageView


@property (strong, nonatomic, readonly) NSString* letter;
@property (weak, nonatomic) id<AlphabetViewDelegate> delegate;

-(instancetype)initWithLetter:(NSString*)letter;
- (void)move;
@end
