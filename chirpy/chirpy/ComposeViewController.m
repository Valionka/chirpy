//
//  ComposeViewController.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/22/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "ComposeViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "Tweet.h"
#import "TwitterClient.h"
#import "TweetsViewController.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITextView *tweetText;


@end

@implementation ComposeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    User * user = [User currentUser];
    
    self.name.text = user.name;
    self.displayName.text = user.screenname;
    
    NSString *url = [NSString stringWithFormat:@"%@", user.profileImageUrl];
    [self.userImage setImageWithURL:[NSURL URLWithString:url]];
    
    //set focus on the text view
    [self.tweetText becomeFirstResponder];
    
    [[UITextView appearance] setTintColor:[UIColor blueColor]];
}


- (IBAction)onTweetButton:(id)sender {
    Tweet *tweet = [[Tweet alloc] initWithText:self.tweetText.text];
    
    [[TwitterClient sharedInstance] sendTweetWithParams:nil tweet:tweet completion:^(NSString *tweetIdStr, NSError *error) {
        if(error){
            NSLog([NSString stringWithFormat:@"Error sending tweet: %@", tweet]);
        } else {
            NSLog([NSString stringWithFormat:@"Sent tweet: %@", tweet]);
        }
    }];
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate didTweet:tweet];
   // [self dismissViewControllerAnimated:YES completion:nil];
    
   // [self.delegate didTweet:tweet];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
