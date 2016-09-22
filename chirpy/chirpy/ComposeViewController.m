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

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITextView *tweetText;

@end

@implementation ComposeViewController

- (IBAction)onTweetButton:(id)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    User * user = [User currentUser];
    
    self.name.text = user.name;
    self.displayName.text = user.screenname;
    
    NSString *url = [NSString stringWithFormat:@"%@", user.profileImageUrl];
    [self.userImage setImageWithURL:[NSURL URLWithString:url]];
    
    [[UITextView appearance] setTintColor:[UIColor blueColor]];
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
