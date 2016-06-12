//
//  TranfficViewController.m
//  chAutoLayout
//
//  Created by ch on 16/5/6.
//  Copyright © 2016年 ch. All rights reserved.
//

#import "TranfficViewController.h"

@implementation TranfficViewController

#pragma mark - Action Handle
- (void)tranfficAction:(UISwitch*)switcher
{
//    self.mapView.showTraffic = switcher.on;
}

#pragma mark - Initialization
- (void)initNavigationBar{
    UISwitch *trafficSwitch = [[UISwitch alloc] init];
    [trafficSwitch addTarget:self action:@selector(tranfficAction:) forControlEvents:UIControlEventValueChanged];
    trafficSwitch.on = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:trafficSwitch];
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initNavigationBar];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    self.mapView.showTraffic = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    /* Reset traffic. */
//    self.mapView.showTraffic = NO;
}

@end
