//
//  Level.h
//  Anagrams
//
//  Created by Marin Todorov on 16/02/2013.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject


@property (assign, nonatomic) int pointsPerTile;
@property (strong, nonatomic) NSArray* level;


+(instancetype)levelWithNum:(int)levelNum;

@end
