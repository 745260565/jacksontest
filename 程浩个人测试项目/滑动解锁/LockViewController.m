//
//  LockViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/7/11.
//  Copyright © 2016年 id. All rights reserved.
//

#import "LockViewController.h"
#import "Lock1ViewController.h"
#import "Lock2ViewController.h"

@interface LockViewController ()

@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 74, 100, 50)];
    [button1 setBackgroundColor:BlackColor];
    [button1 setTitle:@"滑动解锁1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(lock1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(120, 74, 100, 50)];
    [button2 setBackgroundColor:BlackColor];
    [button2 setTitle:@"滑动解锁2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(lock2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    // Do any additional setup after loading the view.
    UITextView *t1 = [[UITextView alloc] initWithFrame:CGRectMake(10, 150, 200, 200)];
    t1.font = [UIFont systemFontOfSize:18];
    t1.editable = NO;
    //t1.selectable = NO;
    t1.text = @"1234";
    [self.view addSubview:t1];
}

- (void)lock1{
    [self.navigationController pushViewController:[Lock1ViewController new] animated:YES];
}

- (void)lock2{
    [self.navigationController pushViewController:[Lock2ViewController new] animated:YES];
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
