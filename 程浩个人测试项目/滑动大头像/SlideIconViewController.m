//
//  SlideIconViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/9/26.
//  Copyright © 2016年 id. All rights reserved.
//

#import "SlideIconViewController.h"

@interface SlideIconViewController ()

@end

@implementation SlideIconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)initUI{
    NSArray *imageArray = @[@"d1",@"d2",@"d3",@"d2",@"d1",@"d2",@"d1",@"d2",@"d3",@"d2"];
    
    UIScrollView *SVC = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
    SVC.backgroundColor = [UIColor redColor];
    SVC.bounces = NO;
    SVC.contentSize = CGSizeMake(50*imageArray.count, 100);
    [self.view addSubview:SVC];
    for (int i = 0; i<imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageArray[i]]];
        imageView.frame = CGRectMake(i*50, -50, 50, 50);
        imageView.layer.cornerRadius = 25;
        imageView.layer.masksToBounds = YES;
        imageView.layer.borderColor = BlackColor.CGColor;
        imageView.layer.borderWidth = 2;
        [SVC addSubview:imageView];
    }
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
