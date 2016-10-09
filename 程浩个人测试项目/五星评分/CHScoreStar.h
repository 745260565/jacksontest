//
//  CHScoreStar.h
//  程浩个人测试项目
//
//  Created by ch on 16/7/7.
//  Copyright © 2016年 id. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHScoreStar : UIView
/**
 *  星星背景颜色
 */
@property(nonatomic,strong)UIColor *starBGColor;
/**
 *  星星颜色
 */
@property(nonatomic,strong)UIColor *starColor;
/**
 *  分数，最小为0,最大为星星个数两倍
 */
@property(nonatomic,assign)CGFloat score;

@end
