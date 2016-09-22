//
//  TweetsViewController.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "TweetsViewController.h"
#import "TwitterClient.h"
#import "TweetCell.h"

@interface TweetsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@property (nonatomic, strong) NSArray* tweets;

@end

@implementation TweetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Tweeter View loaded");
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // refresh control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    [self getTweetsForUser:[User currentUser]];
    
}

- (void)onRefresh {
    [self getTweetsForUser:[User currentUser]];
    [self.refreshControl endRefreshing];
    //[self.tableView reloadData];
}

- (IBAction)onLogout:(UIButton *)sender {
   // [User removeUser:[User currentUser]];
    [User removeUser:[User currentUser] view:self];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tweetCell"];
    
    Tweet *tweet = self.tweets[indexPath.row];
    [cell setTweet:tweet];
    
 /*   MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    NSDictionary *movie = self.movies[indexPath.row];
    
    cell.titleLabel.text = movie[@"title"];
    cell.synopsisLabel.text = movie[@"overview"];
    
    NSString *url = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w154%@", movie[@"poster_path"]];
    
    [cell.movieImage setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultMovie.png"]];
    
    return cell;
  */
   return cell;
}

- (void) getTweetsForUser: (User *)user {
    
    [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //NSLog(@"tweets: %@", responseObject);
        self.tweets = [Tweet tweetsWithArray:responseObject];
        [self.tableView reloadData];
        
        for(Tweet *tweet in self.tweets) {
            NSLog(@"tweet: %@, created: %@", tweet.text, tweet.createdAt);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Failed to get tweets");
    }];
    
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
