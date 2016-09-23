//
//  HamburgerViewController.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/22/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "HamburgerViewController.h"
#import "MenuViewController.h"

@interface HamburgerViewController ()


@property (strong, nonatomic) MenuViewController *menuViewController;
@property (nonatomic, assign) BOOL isMenuOpen;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginConstraint;

@end

@implementation HamburgerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self closeMenu];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.menuViewController = [storyBoard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    UINavigationController *menuNavigationController = [[UINavigationController alloc] initWithRootViewController:self.menuViewController];
   // menuNavigationControler.navigationBar.barTintColor = [UIColor colorWithRed:85/255.0f green:172/255.0f blue:238/255.0f alpha:1.0f];
    menuNavigationController.navigationBar.barTintColor = nil;
    //menuNavigationController.navigationBar.topItem.title = @"Menu";
    menuNavigationController.navigationBar.tintColor = [UIColor whiteColor];
   // [menuNavigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    menuNavigationController.navigationBar.translucent = NO;
    
    self.menuViewController.hambergerViewController = self;
    [self.menuView addSubview:menuNavigationController.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setContentViewController:(UIViewController *)contentViewController {
    [self addChildViewController:contentViewController];
    contentViewController.view.frame = self.contentView.bounds;
    [self.contentView addSubview:contentViewController.view];
    [contentViewController didMoveToParentViewController:self];
}

- (void) openMenu{
    [UIView animateWithDuration:0.2 animations:^{
        self.leftMarginConstraint.constant = 200;
        [self.view layoutIfNeeded];
    }];
    
}

- (void) closeMenu {
    [UIView animateWithDuration:0.2 animations:^{
        self.leftMarginConstraint.constant = 0;
        [self.view layoutIfNeeded];
    }];}

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.view];
    CGPoint translation = [sender translationInView:self.view];
    CGPoint velocity = [sender velocityInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"gesture began");
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"gesture changed");
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        
        if (velocity.x < 0) {
            [self closeMenu];
        } else {
            [self openMenu];
        }
    }
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
