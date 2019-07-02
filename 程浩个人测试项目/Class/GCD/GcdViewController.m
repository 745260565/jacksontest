//
//  GcdViewController.m
//  程浩个人测试项目
//
//  Created by chenghao on 2019/6/18.
//  Copyright © 2019 id. All rights reserved.
//

#import "GcdViewController.h"

@interface GcdViewController ()

@end

@implementation GcdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建串行队列
//    dispatch_queue_t queue = dispatch_queue_create("testQueue", DISPATCH_QUEUE_SERIAL);
    //创建并行队列
//    dispatch_queue_t queue = dispatch_queue_create("testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"apply--begin");
    dispatch_apply(6, queue, ^(size_t index) {
        NSLog(@"%zd---%@",index,[NSThread currentThread]);
    });
    NSLog(@"apply-end");
    // Do any additional setup after loading the view.
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
