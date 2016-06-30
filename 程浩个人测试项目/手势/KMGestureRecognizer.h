//
//  KMGestureRecognizer.h
//  程浩个人测试项目
//
//  Created by ch on 16/6/29.
//  Copyright © 2016年 id. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,Direction) {
    DirectionUnknown,
    DirectionLeft,
    DirectionRight
};

@interface KMGestureRecognizer : UIGestureRecognizer
@property (nonatomic,assign)NSUInteger tickleCount;//挠痒次数
@property (nonatomic,assign)CGPoint currentTickleStart;//当前挠痒开始坐标位置
@property (nonatomic,assign)Direction lastDirection;//最后一次挠痒方向
@end
