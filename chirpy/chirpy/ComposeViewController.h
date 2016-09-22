//
//  ComposeViewController.h
//  chirpy
//
//  Created by Valentin Mihaylov on 9/22/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@protocol ComposeViewControllerDelegate <NSObject>

- (void)didTweet:(Tweet *)tweet;

@optional
- (void)didTweetSuccessfully;

@end

@interface ComposeViewController : UIViewController

@property (nonatomic, weak) id <ComposeViewControllerDelegate> delegate;


@end
