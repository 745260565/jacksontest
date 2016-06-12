//
//  LocationShareViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/5/9.
//  Copyright © 2016年 id. All rights reserved.
//

#import "LocationShareViewController.h"

@implementation LocationShareViewController

- (void)returnAction{
    [super returnAction];
//    self.mapView.showsUserLocation = NO;
}

#pragma mark - Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.mapView.showsUserLocation = YES;
}

- (void)shareAction
{
//    if (self.mapView.userLocation.location == nil)
//    {
//        NSLog(@"尚未获取位置信息！");
//        return;
//    }
//    
//    AMapLocationShareSearchRequest *request = [[AMapLocationShareSearchRequest alloc] init];
//    request.name = @"我的位置";
//    request.location = [AMapGeoPoint locationWithLatitude:self.mapView.userLocation.location.coordinate.latitude longitude:self.mapView.userLocation.location.coordinate.longitude];
//    [self.search AMapLocationShareSearch:request];
}



@end
