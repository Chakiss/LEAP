//
//  Gold.m
//  Leap
//
//  Created by Suparuch Sriploy on 5/13/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import "Gold.h"

@implementation Gold



-(void)setGold:(int)score withLevel:(int)level{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger goldInteger = [defaults integerForKey:@"gold"];
    
    NSInteger totalGold = 0;
    
    if (score == 0) {
        
        totalGold = goldInteger + 20;
    }
    else if (score >= 1 && score <= 10){
        totalGold = goldInteger + (20*2);
    }
    else if (score >= 11 && score <= 20){
        totalGold = goldInteger + (20*3);
    }
    else if (score >= 21 && score <= 30){
        totalGold = goldInteger + (20*4);
    }
    else if (score >= 31 && score <= 40){
        totalGold = goldInteger + (20*5);
    }
    else if (score >= 41 && score <= 50){
        totalGold = goldInteger + (20*6);
    }
    else if (score >= 51 && score <= 60){
        totalGold = goldInteger + (20*7);
    }
    else if (score >= 61 && score <= 70){
        totalGold = goldInteger + (20*8);
    }
    else if (score >= 71 && score <= 80){
        totalGold = goldInteger + (20*9);
    }
    else if (score >= 81 && score <= 90){
        totalGold = goldInteger + (20*10);
    }
    else if (score >= 91 && score <= 100){
        totalGold = goldInteger + (20*11);
    }
    
    [defaults setDouble:totalGold forKey:@"gold"];
    
}

-(NSInteger)getGold{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger goldInteger = [defaults integerForKey:@"gold"];
    
    return goldInteger;
    
}



@end
