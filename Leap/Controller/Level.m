//
//  Level.m
//  Anagrams
//
//  Created by Marin Todorov on 16/02/2013.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "Level.h"

@implementation Level

+(instancetype)levelWithNum:(int)levelNum;
{

  NSString* fileName = [NSString stringWithFormat:@"level%i.plist", levelNum];
  NSString* levelPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
  

  NSDictionary* levelDict = [NSDictionary dictionaryWithContentsOfFile:levelPath];
  

  NSAssert(levelDict, @"level config file not found");
  
  // create Level instance
  Level* l = [[Level alloc] init];
  
  // initialize the object from the dictionary
  l.level = levelDict[@"level"];
  l.pointsPerTile = [levelDict[@"pointsPerTile"] intValue];
  
  
  return l;
}

@end
