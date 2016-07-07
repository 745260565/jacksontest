//
//  MainTableViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/5/9.
//  Copyright © 2016年 id. All rights reserved.
//

#import "MainTableViewController.h"

@implementation MainTableViewController
{
    NSArray *titles;
    NSArray *VCTitles;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *mainCellIdentifier = @"mainCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mainCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = titles[indexPath.row];
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *className = VCTitles[indexPath.row];
    UIViewController *subViewController = [[NSClassFromString(className) alloc] init];
    subViewController.title = titles[indexPath.row];
    [self.navigationController pushViewController:(UIViewController*)subViewController animated:YES];
}

#pragma mark - Initialization
- (void)initTitles{
    titles = @[@"高德地图2D",@"Masonry",@"SDAutoLayout",@"第三方分享",@"pop动画",@"讯飞语音",@"多线程",@"绘图",@"QuickLook",@"文件管理",@"手势",@"动画"];
    VCTitles = @[@"MainMapViewController",@"MasnoryViewController",@"DemoTableViewController",@"ShareVC",@"PopViewController",@"IflyViewController",@"GCDViewController",@"DrawVC",@"QLViewController",@"FileManagerViewController",@"GesViewController",@"AnimateViewController"];
}

#pragma mark - Life Cycle
- (id)init
{
    if (self = [super init])
    {
        [self initTitles];
    }
    return self;
}

- (void)awakeFromNib{
    [self initTitles];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
