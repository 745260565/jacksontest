//
//  PaintViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/7/1.
//  Copyright © 2016年 id. All rights reserved.
//

#import "PaintViewController.h"
#import "PaintView01.h"
#import "PaintView02.h"

@interface PaintViewController ()

@end

@implementation PaintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    PaintView01 *paintView = [[PaintView01 alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:paintView];
    PaintView02 *paintView = [[PaintView02 alloc] initWithFrame:self.view.frame];
    [self.view addSubview:paintView];
    // Do any additional setup after loading the view.
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
