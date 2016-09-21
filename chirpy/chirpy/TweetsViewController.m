//
//  TweetsViewController.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "TweetsViewController.h"
#import "TwitterClient.h"

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
    
    self.tweets = [[TwitterClient sharedInstance] getTweetsForUser:[User currentUser]];
    
    // Do any additional setup after loading the view.
}

- (void)onRefresh {
    self.tweets = [[TwitterClient sharedInstance] getTweetsForUser:[User currentUser]];
    [self.refreshControl endRefreshing];
}

- (IBAction)onLogout:(UIButton *)sender {
   // [User removeUser:[User currentUser]];
    [User removeUser:[User currentUser] view:self];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.movies.count;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
 /*   MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    NSDictionary *movie = self.movies[indexPath.row];
    
    cell.titleLabel.text = movie[@"title"];
    cell.synopsisLabel.text = movie[@"overview"];
    
    NSString *url = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w154%@", movie[@"poster_path"]];
    
    [cell.movieImage setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultMovie.png"]];
    
    return cell;
  */
    return nil;
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
