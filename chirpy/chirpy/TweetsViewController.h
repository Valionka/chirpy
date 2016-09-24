//
//  TweetsViewController.h
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "ComposeViewController.h"

@interface TweetsViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource, ComposeViewControllerDelegate>
@property (nonatomic, assign) BOOL isMentions;

- (void) getTweetsForUser: (User *)user;
- (void) getTweetsForUser: (User *)user;
- (void)didTweet:(Tweet *)tweet;
@end
