//
//  ProfileCell.h
//  Leap
//
//  Created by Suparuch Sriploy on 5/13/14.
//  Copyright (c) 2014 Chakrit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *barrierImageView;
@property (strong, nonatomic) IBOutlet UILabel *goldLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userImageView;
@property (strong, nonatomic) IBOutlet UIImageView *flagImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIImageView *homeImage;
@property (strong, nonatomic) IBOutlet UIImageView *trophyImageView;


@end
