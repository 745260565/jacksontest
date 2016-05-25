//
//  Constant.h
//  chAutoLayout
//
//  Created by ch on 16/5/6.
//  Copyright © 2016年 ch. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define AMAPAppKey @"26e31a1137851b8e313f69c300b686f3"


//屏幕宽高
#define EDTabbrWidth LengthInIP6(71)
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width<[UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.width>[UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)



//定义颜色
#define ColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
//颜色
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 \
alpha:1.0]
#define UIColorFromRGBA(rgbValue, a) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 \
alpha:a]

#define weakify_self   __weak typeof(self) weakSelf = self;
#define strongify_self __strong typeof(self) self = weakSelf;
//判断ios版本
#define IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define IS_IOS_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#define IS_IOS_7_LOWER ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0 ? YES : NO)
#define IS_IOS_8_LOWER ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0 ? YES : NO)

#endif /* Constant_h */
