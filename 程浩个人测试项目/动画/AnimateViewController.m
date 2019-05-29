//
//  AnimateViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/7/5.
//  Copyright © 2016年 id. All rights reserved.
//

#import "AnimateViewController.h"
#define Radius 30

@interface AnimateViewController ()
@property (nonatomic,strong) UIView *centerCir;
@property (nonatomic,strong) UIView *leftCir;
@property (nonatomic,strong) UIView *rightCir;
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation AnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addThreeCir];
    [self timer];
    // Do any additional setup after loading the view.
}

- (NSTimer*)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(firstAnimation) userInfo:nil repeats:YES];
        [_timer fire];
    }
    return _timer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addThreeCir{
    self.centerCir = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Radius, Radius)];
    self.centerCir.center = self.view.center;
    self.centerCir.layer.cornerRadius = Radius*0.5;
    self.centerCir.layer.masksToBounds = YES;
    self.centerCir.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.centerCir];
    
    CGPoint centerPoint = self.centerCir.center;
    
    self.leftCir = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Radius, Radius)];
    CGPoint leftCenter = self.leftCir.center;
    leftCenter.x = centerPoint.x - Radius;
    leftCenter.y = centerPoint.y;
    self.leftCir.center = leftCenter;
    self.leftCir.layer.cornerRadius = Radius*0.5;
    self.leftCir.layer.masksToBounds = YES;
    self.leftCir.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.leftCir];
    
    self.rightCir = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Radius, Radius)];
    CGPoint rightCenter = self.leftCir.center;
    rightCenter.x = centerPoint.x + Radius;
    rightCenter.y = centerPoint.y;
    self.rightCir.center = rightCenter;
    self.rightCir.layer.cornerRadius = Radius*0.5;
    self.rightCir.layer.masksToBounds = YES;
    self.rightCir.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.rightCir];
}

- (void)firstAnimation{
    [UIView animateWithDuration:1.0f animations:^{
        self.leftCir.transform = CGAffineTransformMakeTranslation(-Radius, 0);
        self.leftCir.transform = CGAffineTransformScale(self.leftCir.transform, 0.75, 0.75);
        self.rightCir.transform = CGAffineTransformMakeTranslation(Radius, 0);
        self.rightCir.transform = CGAffineTransformScale(self.rightCir.transform, 0.75, 0.75);
        self.centerCir.transform = CGAffineTransformScale(self.centerCir.transform, 0.75, 0.75);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            self.leftCir.transform = CGAffineTransformIdentity;
            self.rightCir.transform = CGAffineTransformIdentity;
            self.centerCir.transform = CGAffineTransformIdentity;
            [self secondAnimation];
        }];
    }];
}

- (void)secondAnimation{
    UIBezierPath *leftCirPath = [UIBezierPath bezierPath];
    [leftCirPath addArcWithCenter:self.view.center radius:Radius startAngle:M_PI endAngle:2*M_PI+2*M_PI clockwise:NO];
    CAKeyframeAnimation *leftCirAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    leftCirAnimation.path = leftCirPath.CGPath;
    leftCirAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    leftCirAnimation.fillMode = kCAFillModeForwards;
    leftCirAnimation.repeatCount = 2;
    leftCirAnimation.duration = 1.0;
    [self.leftCir.layer addAnimation:leftCirAnimation forKey:@"cc"];
    
    UIBezierPath *rightCirPath = [UIBezierPath bezierPath];
    [rightCirPath addArcWithCenter:self.view.center radius:Radius startAngle:0 endAngle:M_PI+2*M_PI clockwise:NO];
    CAKeyframeAnimation *rightCirAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    rightCirAnimation.path = rightCirPath.CGPath;
    rightCirAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rightCirAnimation.fillMode = kCAFillModeForwards;
    rightCirAnimation.repeatCount = 2;
    rightCirAnimation.duration = 1.0;
    [self.rightCir.layer addAnimation:rightCirAnimation forKey:@"hh"];
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
