//
//  TweetCell.h
//  chirpy
//
//  Created by Valentin Mihaylov on 9/21/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;

- (void)setTweet:(Tweet *)tweet;

@end
