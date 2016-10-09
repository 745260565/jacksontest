//
//  LockView.m
//  程浩个人测试项目
//
//  Created by ch on 16/7/11.
//  Copyright © 2016年 id. All rights reserved.
//

#import "LockView.h"

#define kbuttonCount 9
#define kwidth 74
#define kheitht 74
#define kcolCount 3

@interface LockView()
@property (nonatomic,strong) NSMutableArray *selectedButtons;//选中的按钮
@property (nonatomic,assign) CGPoint currentPoint;//当前移动的点
@end
@implementation LockView
- (NSMutableArray*)selectedButtons{
    if (_selectedButtons == nil) {
        _selectedButtons = [NSMutableArray array];
    }
    return _selectedButtons;
}

#pragma mark -- 初始化view
- (void)awakeFromNib{
    //添加按钮
    for (int i = 0; i<kbuttonCount; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.userInteractionEnabled = YES;
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        //绑定tag 后面方便获取用户滑动后的密码
        button.tag = i;
        [self addSubview:button];
    }
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //添加按钮
        for (int i = 0; i<kbuttonCount; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.userInteractionEnabled = YES;
            [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
            //绑定tag 后面方便获取用户滑动后的密码
            button.tag = i;
            [self addSubview:button];
        }
    }
    return self;
}

#pragma mark --布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    for (int i = 0; i<kbuttonCount; i++) {
        //取出UIButton
        UIButton *button = self.subviews[i];
        //设置位置
        CGFloat col = i%kcolCount;
        CGFloat row = i/kcolCount;
        //设置间距
        CGFloat margin = (self.frame.size.width - kcolCount*kwidth)/(kcolCount+1);
        
        CGFloat x = col*(margin + kwidth) +margin;
        CGFloat y = row*(margin + kheitht);
        
        //设置button frame
        button.frame = CGRectMake(x, y, kwidth, kheitht);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self buttonSelectedWithTouch:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self buttonSelectedWithTouch:touches withEvent:event];
    [self setNeedsLayout];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableString *strM = [NSMutableString string];
    for (UIButton *selBtn in self.selectedButtons) {
        selBtn.selected = NO;
        [strM appendFormat:@"%ld",selBtn.tag];
    }
    NSLog(@"%@",strM);
    [self.selectedButtons removeAllObjects];
    [self setNeedsDisplay];
}

- (void)buttonSelectedWithTouch:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)enent{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    //记录当前选中的点
    self.currentPoint = currentPoint;
    for (UIButton *button in self.subviews) {
        CGPoint btnPoint = [self convertPoint:currentPoint toView:button];
        if ([button pointInside:btnPoint withEvent:enent] && button.selected == NO) {
            button.selected = YES;
            [self.selectedButtons addObject:button];
        }
    }
}

- (void)drawRect:(CGRect)rect{
    if (self.selectedButtons.count == 0) return;
    UIBezierPath *path = [UIBezierPath bezierPath];
    int i = 0;
    for (UIButton *button in self.selectedButtons) {
        if (i == 0) {
            [path moveToPoint:button.center];
        }else{
            [path addLineToPoint:button.center];
        }
        i++;
    }
    [path addLineToPoint:self.currentPoint];
    [[UIColor whiteColor] set];
    path.lineWidth = 5;
    path.lineJoinStyle = kCGLineJoinRound;
    [path stroke];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
