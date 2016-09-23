//
//  MenuViewController.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/22/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "MenuViewController.h"
#import "TweetsViewController.h"
#import "ContentViewController.h"

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) UIViewController *currentViewController;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self initViewControllers];
    
}

- (void) initViewControllers {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    // init the tweets view controller
    UINavigationController *tweetsNavigationController = [storyBoard instantiateViewControllerWithIdentifier:@"NavigationController"];
   
    ContentViewController *cvc = [storyBoard instantiateViewControllerWithIdentifier:@"contentViewController"];
    
    self.viewControllers = [NSArray arrayWithObjects:tweetsNavigationController, cvc, nil];
    
    
    self.currentViewController = tweetsNavigationController;
    [self.hambergerViewController setContentViewController:self.currentViewController];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    
    if(indexPath.row == 0){
        cell.backgroundColor = [UIColor greenColor];
    } else if (indexPath.row == 1){
        cell.backgroundColor = [UIColor blueColor];
    } else {
        cell.backgroundColor = [UIColor redColor];
    }
    
    return cell;

}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row < 3){
        [self.hambergerViewController setContentViewController:self.viewControllers[indexPath.row]];
    }

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
