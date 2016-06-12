//
//  DrawVC.m
//  程浩个人测试项目
//
//  Created by ch on 16/6/7.
//  Copyright © 2016年 id. All rights reserved.
//

#import "DrawVC.h"

@implementation DrawVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self drawLine1];
}

- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 20, 20);
    CGPathAddLineToPoint(path, NULL, 200, 300);
    CGContextAddPath(ctx, path);
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathAddEllipseInRect(path1, NULL, CGRectMake(50, 50, 100, 100));
    CGContextAddPath(ctx, path1);
    CGContextStrokePath(ctx);
    CGContextSetStrokeColor(ctx, 0x000000);
    CGPathRelease(path);
    CGPathRelease(path1);
}

- (void)drawLine1{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 20, 20);
    CGPathAddLineToPoint(path, NULL, 200, 300);
    CGContextAddPath(ctx, path);
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathAddEllipseInRect(path1, NULL, CGRectMake(50, 50, 100, 100));
    CGContextAddPath(ctx, path1);
    CGContextStrokePath(ctx);
    CGContextSetStrokeColor(ctx, 0x000000);
    CGPathRelease(path);
    CGPathRelease(path1);
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
