//
//  GCDViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/6/2.
//  Copyright © 2016年 id. All rights reserved.
//

#import "GCDViewController.h"
@interface GCDViewController()
@end

@implementation GCDViewController

//单例
+(instancetype)sharedManager{
    static GCDViewController *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[GCDViewController alloc] init];
    });
    return shareManager;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self after];
    UIButton *button1 = [[UIButton alloc]init];
    button1.titleLabel.text = @"异步并行";
    [button1 addTarget:self action:@selector(globalAsync) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

//延时执行
- (void)after{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIView *view =[[UIView alloc] initWithFrame:CGRectMake(10, 80, 100, 100)];
        view.backgroundColor = [UIColor grayColor];
        [self.view addSubview:view];
    });
}

- (void)globalAsync{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"11111:%@",[NSThread currentThread]);
    });
    dis
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
