//
//  Message.m
//  Leap
//
//  Created by Suparuch Sriploy on 5/15/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import "Message.h"
#import "AppDelegate.h"

@implementation Message

@synthesize localizeDataStore;

AppDelegate *app;

+(NSString *)getMessage:(NSInteger)msgID{
    
    app = [[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString object
    NSString *languageString = [standardUserDefaults stringForKey:@"language"];
    
    NSString *msg;
    if ([languageString isEqualToString:@"TH"]) {
        msg = ((LocalizeDataStore *)[app.listArray objectAtIndex:msgID]).TH;
    }
    else if ([languageString isEqualToString:@"EN"]){
        msg = ((LocalizeDataStore *)[app.listArray objectAtIndex:msgID]).TH;
    }
    else if ([languageString isEqualToString:@"CH"]){
         msg = ((LocalizeDataStore *)[app.listArray objectAtIndex:msgID]).TH;
    }
  
    NSArray *array = [msg componentsSeparatedByString:@"\n"];
    
    NSString *newString = [array lastObject];
    
    
    return newString;
}

@end
