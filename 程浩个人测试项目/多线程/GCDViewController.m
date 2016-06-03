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
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(10, 120, 72, 30)];
    button1.backgroundColor = [UIColor redColor];
    [button1 setTitle:@"异步并行" forState:UIControlStateNormal];
    button1.titleLabel.textColor = [UIColor whiteColor];
    [button1 addTarget:self action:@selector(globalAsync) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(10, 160, 72, 30)];
    button2.backgroundColor = [UIColor redColor];
    [button2 setTitle:@"异步串行" forState:UIControlStateNormal];
    button2.titleLabel.textColor = [UIColor whiteColor];
    [button2 addTarget:self action:@selector(serialAsync) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, 72, 30)];
    button3.backgroundColor = [UIColor redColor];
    [button3 setTitle:@"异步串行" forState:UIControlStateNormal];
    button3.titleLabel.textColor = [UIColor whiteColor];
    [button3 addTarget:self action:@selector(globalSync) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];

    
}

//延时执行
- (void)after{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIView *view =[[UIView alloc] initWithFrame:CGRectMake(10, 80, 20, 20)];
        view.backgroundColor = [UIColor grayColor];
        [self.view addSubview:view];
    });
}

//全局并行队列，异步任务，会开启多个线程
- (void)globalAsync{
    //全局队列和主队列是异步进行
    //获取全局并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //添加异步任务
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"11111:%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<35; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"22222:%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<15; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"33333:%@",[NSThread currentThread]);
        }
    });
    for (int i = 0; i<5; i++) {
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"主线程%@",[NSThread mainThread]);
    }
    [NSThread sleepForTimeInterval:2.0];
    NSLog(@"sleep完,%@",[NSThread currentThread]);
}

//串行队列，异步任务，会开启一个线程
- (void)serialAsync{
    //打印主线程
    for (int i = 0; i<5; i++) {
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"主线程%@",[NSThread mainThread]);
    }
    /**
     *  创建串行队列
     *
     *  @param label#> 第一个参数为串行队列的名称，是c语言的字符串 description#>
     *  @param attr#>  第二个参数为队列的属性，一般来说串行队列不需要赋值任何属性，所以通常传空值（NULL）也可以用DISPATCH_QUEUE_SERIAL表示串行 DISPATCH_QUEUE_CONCURRENT表示并行 description#>
     *
     *  @return
     */
    dispatch_queue_t queue = dispatch_queue_create("wendingding", DISPATCH_QUEUE_SERIAL);
    //添加同步任务
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"11111:%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<15; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"22222:%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<15; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"33333:%@",[NSThread currentThread]);
        }
    });
    for (int i = 0; i<5; i++) {
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"主线程%@",[NSThread mainThread]);
    }
    [NSThread sleepForTimeInterval:2.0];
    NSLog(@"sleep完,%@",[NSThread currentThread]);
}

- (void)globalSync{
    //打印主线程
    for (int i = 0; i<5; i++) {
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"主线程%@",[NSThread mainThread]);
    }
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //添加异步任务
    dispatch_sync(queue, ^{
        for (int i = 0; i<5; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"11111:%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<15; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"22222:%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<15; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"33333:%@",[NSThread currentThread]);
        }
    });
    for (int i = 0; i<5; i++) {
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"主线程%@",[NSThread mainThread]);
    }
    [NSThread sleepForTimeInterval:2.0];
    NSLog(@"sleep完,%@",[NSThread currentThread]);
}



- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
