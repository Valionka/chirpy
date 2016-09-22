//
//  TweetCell.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/21/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "TweetCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"


@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTweet:(Tweet *)tweet {
    self.tweetLabel.text = tweet.text;
    self.nameLabel.text = tweet.user.name;
    //self.dateLabel.text = tweet.createdAt;
    
    NSString *url = [NSString stringWithFormat:@"%@", tweet.user.profileImageUrl];
    
   /* [self.userImage setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        NSLog(@"Success IMAGE");
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        NSLog(@"Failed IMAGE");
    }];
    */
    [self.userImage setImageWithURL:[NSURL URLWithString:url]];

}

@end
