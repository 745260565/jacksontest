//
//  PaintStep.h
//  程浩个人测试项目
//
//  Created by ch on 16/7/4.
//  Copyright © 2016年 id. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PaintStep : NSObject{
    @public
    //路径
    NSMutableArray *pathPoints;
    //颜色
    CGColorRef color;
    //笔画粗细
    float strokeWidth;
}

@end
