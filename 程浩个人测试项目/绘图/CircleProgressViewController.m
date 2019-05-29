//
//  CircleProgressViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/6/13.
//  Copyright © 2016年 id. All rights reserved.
//

#import "CircleProgressViewController.h"
#import "THCircularProgressView.h"
@interface CircleProgressViewController ()

@end

@implementation CircleProgressViewController
{
    NSTimer *timer;
    NSMutableArray *examples;
    CGFloat percentage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"progress";
    examples = [[NSMutableArray alloc] init];
    percentage = 1;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat radius = floor(width/4*0.8);
    
    THCircularProgressView *example1 = [[THCircularProgressView alloc] init];
    example1.progressColor = [UIColor redColor];
    example1.progressBackgroundColor = [UIColor colorWithWhite:0.96 alpha:1.0];
    example1.percentage = percentage;
    example1.progressMode = THProgressModeDeplete;
    example1.clockwise = NO;
    example1.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:example1];
//    [examples addObject:example1];
//    [example1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(CGPointMake(-width/4, -height/4));
//        make.size.mas_equalTo(CGSizeMake(2*radius, 2*radius));
//    }];
//    [example1 layoutIfNeeded];
    
    THCircularProgressView *example2 = [[THCircularProgressView alloc] initWithFrame:CGRectMake(width*0.75 -radius, height*0.25-radius, radius*2, radius*2)];
    example2.lineWidth = 30.0f;
    example2.progressColor = [UIColor greenColor];
    example2.centerLabel.font = [UIFont boldSystemFontOfSize:radius];
    example2.centerLabelVisible = YES;
//    [self.view addSubview:example2];
//    [examples addObject:example2];
    
    THCircularProgressView *example3 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width/4, height*0.75) radius:radius lineWidth:radius progressMode:THProgressModeDeplete progressColor:[UIColor blueColor] progressBackgroundMode:THProgressBackgroundModeCircle progressBackgroundColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f] percentage:percentage];
    example3.clockwise = NO;
//    [self.view addSubview:example3];
//    [examples addObject:example3];
    
    THCircularProgressView *example4 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width*0.75, height*0.75) radius:radius lineWidth:radius progressMode:THProgressModeFill progressColor:[UIColor purpleColor] progressBackgroundMode:THProgressBackgroundModeNone progressBackgroundColor:nil percentage:percentage];
    example4.clockwise = NO;
//    [self.view addSubview:example4];
//    [examples addObject:example4];
    
    THCircularProgressView *example5 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width*0.5, height*0.5) radius:radius lineWidth:10 progressMode:THProgressModeFill progressColor:[UIColor blueColor] progressBackgroundMode:THProgressBackgroundModeCircumference progressBackgroundColor:[UIColor grayColor] percentage:percentage];
    example5.clockwise = NO;
    [self.view addSubview:example5];
    [examples addObject:example5];
    
    NSLog(@"\n%@\n%@\n%@\n%@",NSStringFromCGPoint(example1.center),NSStringFromCGPoint(example2.center),NSStringFromCGPoint(example3.center),NSStringFromCGPoint(example4.center));
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [timer invalidate];
}

- (void)timerFired:(NSTimer*)timer{
    percentage -= 0.01/15;
    if (percentage <= 0) {
        percentage = 1;
    }
    for (THCircularProgressView *progressView in examples) {
        progressView.percentage = percentage;
    }
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static BOOL originalSize = YES;
    CGFloat multiplier = 0.5f;
    if (!originalSize) {
        multiplier = 2.0f;
    }
    originalSize = !originalSize;
    for (THCircularProgressView *view in examples) {
        CGRect frame = view.frame;
        frame.size.width = CGRectGetWidth(view.frame)*multiplier;
        frame.size.height = CGRectGetHeight(view.frame)*multiplier;
        view.frame = frame;
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
