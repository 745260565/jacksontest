//
//  DrawVC.m
//  程浩个人测试项目
//
//  Created by ch on 16/6/7.
//  Copyright © 2016年 id. All rights reserved.
//

#import "DrawVC.h"
#import "CircleProgressViewController.h"
#import "GuaGuaLeViewController.h"
#import "PaintViewController.h"

@implementation DrawVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 40)];
    [button1 addTarget:self action:@selector(circleProgress) forControlEvents:UIControlEventTouchUpInside];
    [button1 setBackgroundColor:[UIColor grayColor]];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitle:@"循环圆环" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(140, 100, 100, 40)];
    [button2 addTarget:self action:@selector(guaguale) forControlEvents:UIControlEventTouchUpInside];
    [button2 setBackgroundColor:[UIColor grayColor]];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitle:@"刮刮乐" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(20, 160, 100, 40)];
    [button3 addTarget:self action:@selector(paint) forControlEvents:UIControlEventTouchUpInside];
    [button3 setBackgroundColor:[UIColor grayColor]];
    [button3 setTitle:@"涂鸦" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button3];
}

- (void)circleProgress{
    [self.navigationController pushViewController:[CircleProgressViewController new] animated:YES];
}

- (void)guaguale{
    [self.navigationController pushViewController:[GuaGuaLeViewController new] animated:YES];
}

- (void)paint{
    [self.navigationController pushViewController:[PaintViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
