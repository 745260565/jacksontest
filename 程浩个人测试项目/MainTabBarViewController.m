//
//  MainTabBarViewController.m
//  程浩个人测试项目
//
//  Created by chenghao on 2019/5/6.
//  Copyright © 2019 id. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "BaseNavigationController.h"

#import "HomeViewController.h"
#import "MainTableViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setTranslucent:YES];
    
    [self initTabBarController];
    // Do any additional setup after loading the view.
}

- (void)initTabBarController{
    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    homeNav.tabBarItem.title = @"首页";
    homeNav.tabBarItem.image = [[UIImage imageNamed:@"tab_home_grey"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_home_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BaseNavigationController *firstNav = [[BaseNavigationController alloc] initWithRootViewController:[[MainTableViewController alloc] init]];
    firstNav.tabBarItem.title = @"功能";
    firstNav.tabBarItem.image = [[UIImage imageNamed:@"tab_home_grey"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_home_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.viewControllers = @[homeNav,firstNav];
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
