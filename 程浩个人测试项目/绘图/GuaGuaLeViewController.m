//
//  GuaGuaLeViewController.m
//  程浩个人测试项目
//
//  Created by ch on 16/6/28.
//  Copyright © 2016年 id. All rights reserved.
//

#import "GuaGuaLeViewController.h"


@interface GuaGuaLeViewController ()
@property (nonatomic,retain)UIImageView *imageView;

@end

@implementation GuaGuaLeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    UILabel *label = [UILabel new];
    label.frame = self.view.frame;
    label.text = @"离思五首\n元稹\n曾经沧海难为水,\n除却巫山不是云!\n取次花丛懒回顾,\n半缘修道半缘君!\n";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithRed:(arc4random()%173)/346.0 + 0.5 green:(arc4random()%173)/346.0 + 0.5  blue:(arc4random()%173)/346.0 + 0.5  alpha: 1];
    label.font = [UIFont systemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(400);
    }];
    self.imageView = [UIImageView new];
    self.imageView.image = [UIImage imageNamed:@"蒲公英"];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(label.mas_width);
        make.height.mas_equalTo(label.mas_height);
    }];
    // Do any additional setup after loading the view.
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 触摸任意位置
    UITouch *touch = touches.anyObject;
     // 触摸位置在图片上的坐标
    CGPoint cententPoint = [touch locationInView:self.imageView];
    // 设置清除点的大小
    CGRect rect = CGRectMake(cententPoint.x, cententPoint.y, 30, 30);
    // 默认是去创建一个透明的视图
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
    //创建一个画板
    CGContextRef ref = UIGraphicsGetCurrentContext();
     // 把imageView的layer映射到上下文中
    [self.imageView.layer renderInContext:ref];
    // 清除划过的区域
    CGContextClearRect(ref, rect);
    // 获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束图片的画板, (意味着图片在上下文中消失)
    UIGraphicsEndImageContext();
    self.imageView.image = image;
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
