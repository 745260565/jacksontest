//
//  PaintView01.m
//  程浩个人测试项目
//
//  Created by ch on 16/7/1.
//  Copyright © 2016年 id. All rights reserved.
//

#import "PaintView01.h"

@implementation PaintView01
{
    //画的线路径的集合，内部是NSMutableArray类型
    NSMutableArray *paths;
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

//初始化paintViewInit样式和数据
- (void)paintViewInit{
    self.backgroundColor = WhiteColor;
    paths = [[NSMutableArray alloc] init];
}

- (void)drawRect:(CGRect)rect{
    //必须调用父类drawRect方法，否则 UIGraphicsGetCurrentContext()获取不到context
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (int i = 0; i<paths.count; i++) {
        NSMutableArray *pathPoints = [paths objectAtIndex:i];
        CGMutablePathRef path = CGPathCreateMutable();
        for (int j= 0; j<pathPoints.count; j++) {
            CGPoint point = [[pathPoints objectAtIndex:j] CGPointValue];
            if (j==0) {
                CGPathMoveToPoint(path, &CGAffineTransformIdentity, point.x, point.y);
            }else{
                CGPathAddLineToPoint(path, &CGAffineTransformIdentity, point.x, point.y);
            }
        }
        CGContextAddPath(ctx, path);
        CGContextStrokePath(ctx);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableArray *path = [[NSMutableArray alloc] init];
    [paths addObject:path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableArray *path = [paths lastObject];
    CGPoint movePoint = [[touches anyObject] locationInView:self];
    NSLog(@"touchesMoved     x:%f,y:%f",movePoint.x,movePoint.y);
    //CGPint要通过NSValue封装一次才能放入NSArray
    [path addObject:[NSValue valueWithCGPoint:movePoint]];
    //通知重新渲染界面，这个方法会重新调用UIView的drawRect:(CGRect)rect方法
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
