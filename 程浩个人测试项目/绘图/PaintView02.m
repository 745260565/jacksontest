//
//  PaintView02.m
//  程浩个人测试项目
//
//  Created by ch on 16/7/4.
//  Copyright © 2016年 id. All rights reserved.
//

#import "PaintView02.h"
#import "PaintStep.h"

//屏幕的宽高，做自适应用的
#define width  [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@implementation PaintView02
{
    //画的线路径的集合，内部是NSMutableArray类型
    NSMutableArray *paintSteps;
    UIColor *currColor;
    UISlider *slider;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self paintViewInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self paintViewInit];
    }
    return self;
}

- (void)paintViewInit{
    self.backgroundColor = WhiteColor;
    paintSteps = [NSMutableArray array];
    [self createColorBord];
    [self createStrokeWithSlider];
}

//创建色板
- (void)createColorBord{
    currColor = BlackColor;
    UIView *colorBoardView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, width, 20)];
    [self addSubview:colorBoardView];
    colorBoardView.layer.borderWidth = 1;
    colorBoardView.layer.borderColor = BlackColor.CGColor;
    NSArray *colors = [NSArray arrayWithObjects:BlackColor,RedColor,BlueColor,GreenColor,YellowColor,BrownColor,OrangeColor,WhiteColor,OrangeColor,PurpleColor,CyanColor,LightGrayColor,nil];
    for (int i = 0; i<colors.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((width/colors.count)*i, 0, width/colors.count, 20)];
        [colorBoardView addSubview:btn];
        [btn setBackgroundColor:colors[i]];
        [btn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    }
}

//切换颜色
- (void)changeColor:(id)target{
    UIButton *btn = (UIButton*)target;
    currColor = btn.backgroundColor;
}

//创建笔触粗细选择器
- (void)createStrokeWithSlider{
    slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 94, width, 20)];
    slider.maximumValue = 20;
    slider.minimumValue = 1;
    [self addSubview:slider];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (int i = 0; i<paintSteps.count; i++) {
        PaintStep *step = paintSteps[i];
        NSMutableArray *pathPoints = step->pathPoints;
        CGMutablePathRef path = CGPathCreateMutable();
        for (int j = 0; j<pathPoints.count; j++) {
            CGPoint point = [[pathPoints objectAtIndex:j] CGPointValue];
            if (j==0) {
                CGPathMoveToPoint(path, &CGAffineTransformIdentity, point.x, point.y);
            }else{
                CGPathAddLineToPoint(path, &CGAffineTransformIdentity, point.x, point.y);
            }
        }
        CGContextSetStrokeColorWithColor(ctx, step->color);
        CGContextSetLineWidth(ctx, step->strokeWidth);
        CGContextAddPath(ctx, path);
        CGContextStrokePath(ctx);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    PaintStep *paintStep = [[PaintStep alloc] init];
    paintStep->color = currColor.CGColor;
    paintStep->pathPoints = [[NSMutableArray alloc] init];
    paintStep->strokeWidth = slider.value;
    [paintSteps addObject:paintStep];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    PaintStep *step = [paintSteps lastObject];
    NSMutableArray *pathPoints = step->pathPoints;
    CGPoint movePoint = [[touches anyObject] locationInView:self];
    [pathPoints addObject:[NSValue valueWithCGPoint:movePoint]];
    [self setNeedsDisplay];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
