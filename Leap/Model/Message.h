//
//  Message.h
//  Leap
//
//  Created by Suparuch Sriploy on 5/15/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalizeDataStore.h"

@interface Message : NSObject

@property (nonatomic, strong) LocalizeDataStore *localizeDataStore;

+(NSString *)getMessage:(NSInteger)msgID;

@end
