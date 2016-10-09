//
//  DrawBackGroundView.m
//  程浩个人测试项目
//
//  Created by ch on 16/7/12.
//  Copyright © 2016年 id. All rights reserved.
//

#import "DrawBackGroundView.h"

@implementation DrawBackGroundView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"Home_refresh_bg"];
    [image drawInRect:self.bounds];
    self.userInteractionEnabled = YES;
}


@end
