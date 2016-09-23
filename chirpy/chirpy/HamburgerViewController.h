//
//  HamburgerViewController.h
//  chirpy
//
//  Created by Valentin Mihaylov on 9/22/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HamburgerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

- (void) openMenu;
- (void) closeMenu;
- (void) setContentViewController: (UIViewController *) contentViewController;

@end
