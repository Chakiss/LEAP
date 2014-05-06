//
//  List.m
//  DrinkXML
//
//  Created by Dan on 17/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LocalizeDataStore.h"

@implementation LocalizeDataStore
@synthesize cider, CN, EN, TH, textID;

- (void) text:(NSInteger) _id  andEN:(NSString *)_en andTH:(NSString *)_th andCH:(NSString *)_cn;
{
    textID = _id;
    EN = _en;
    TH = _th;
    CN = _cn;
}

@end
