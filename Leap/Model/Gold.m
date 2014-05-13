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
    
    NSInteger goldInteger = [defaults integerForKey:@"totalGold"];
    
    NSInteger totalGold = 0;
    NSInteger gold = 0;
    
    if (score == 0) {
        gold = 20;
        totalGold = goldInteger + gold;
    }
    else if (score >= 1 && score <= 10){
        gold = (20*2);
        totalGold = goldInteger + gold;
    }
    else if (score >= 11 && score <= 20){
        gold = (20*3);
        totalGold = goldInteger + gold;
    }
    else if (score >= 21 && score <= 30){
        gold = (20*4);
        totalGold = goldInteger + gold;
    }
    else if (score >= 31 && score <= 40){
        gold = (20*5);
        totalGold = goldInteger + gold;
    }
    else if (score >= 41 && score <= 50){
        gold = (20*6);
        totalGold = goldInteger + gold;
    }
    else if (score >= 51 && score <= 60){
        gold = (20*7);
        totalGold = goldInteger + gold;
    }
    else if (score >= 61 && score <= 70){
        gold = (20*8);
        totalGold = goldInteger + gold;
    }
    else if (score >= 71 && score <= 80){
        gold = (20*9);
        totalGold = goldInteger + gold;
    }
    else if (score >= 81 && score <= 90){
        gold = (20*10);
        totalGold = goldInteger + gold;
    }
    else if (score >= 91 && score <= 100){
        gold = (20*11);
        totalGold = goldInteger + gold;
    }
   
    [defaults setDouble:gold forKey:@"gold"];
    [defaults setDouble:totalGold forKey:@"totalGold"];
    
    
}

-(NSInteger)getTotalGold{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger goldInteger = [defaults integerForKey:@"totalGold"];
    
    return goldInteger;
    
}




@end
