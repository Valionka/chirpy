//
//  ProfileViewController.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/22/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "ProfileViewController.h"
#import "TweetCell.h"
#import "TwitterClient.h"

@interface ProfileViewController ()

@property (nonatomic, strong) NSArray* tweets;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self getTweetsForUser:[User currentUser]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tweetCell"];
    
    Tweet *tweet = self.tweets[indexPath.row];
    [cell setTweet:tweet];
    
    return cell;
}

- (void) getTweetsForUser: (User *)user {
    
    [[TwitterClient sharedInstance] getUserTimeline:[User currentUser] completion:^(NSArray *tweets, NSError *error) {
        if(error) {
            NSLog(@"Could not fetch User timeline");
        } else {
            self.tweets = tweets;
            [self.tableView reloadData];
        }
    }];
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
