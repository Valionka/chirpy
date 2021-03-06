//
//  LoginViewController.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/19/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "LoginViewController.h"
#import "TwitterClient.h"
#import "User.h"
#import "TweetsViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)onLogIn:(id)sender {
    [[TwitterClient sharedInstance] loginWithCompletion:^(User *user, NSError *error) {
        if(user != nil){
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            AppDelegate *delegate = [UIApplication sharedApplication].delegate;
           UINavigationController *hamburgerNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"HamburgerViewController"];
            delegate.window.rootViewController = hamburgerNavigationController;

           /* UINavigationController *tweetNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
            [self presentViewController:tweetNavigationController animated:YES completion:nil];
            */

        } else {
            // display error
        }
    }];
}

@end
