//
//  Lock1ViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/7/11.
//  Copyright © 2016年 id. All rights reserved.
//

#import "Lock1ViewController.h"
#import "LockView.h"
#import "DrawBackGroundView.h"

@interface Lock1ViewController ()

@end

@implementation Lock1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    DrawBackGroundView *bgVC = [DrawBackGroundView new];
    [self.view addSubview:bgVC];
    [bgVC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    LockView *lockVC = [LockView new];
    [bgVC addSubview:lockVC];
    [lockVC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(350);
    }];
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
