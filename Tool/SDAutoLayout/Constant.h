//
//  Constant.h
//  chAutoLayout
//
//  Created by ch on 16/5/6.
//  Copyright © 2016年 ch. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define AMAPAppKey @"584db3f09a878852c45138567826c943"
#define UMShareKey @"57306434e0f55a8474001aff"
#define IFLYAppKey @"574be2c3"

//屏幕宽高 横屏的
#define EDTabbrWidth LengthInIP6(71)
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width<[UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.width>[UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)

#define LengthInIP6(lengthInIP6) ((CGFloat)lengthInIP6)/375*ScreenHeight
#define LengthInIP6P(lengthInIP6P) (((CGFloat)lengthInIP6P)/414.0*ScreenHeight)

#define LengthByWidthIP6(lengthInIP6) ((CGFloat)lengthInIP6)/667*ScreenWidth

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define Double2Num(x) [NSNumber numberWithDouble:x]


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

#define ClearColor [UIColor clearColor]
#define WhiteColor [UIColor whiteColor]
#define GrayColor [UIColor grayColor]
#define GreenColor [UIColor greenColor]
#define GroupTableViewBackgroundColor [UIColor groupTableViewBackgroundColor]
#define DarkGrayColor [UIColor darkGrayColor]
#define LightGrayColor [UIColor lightGrayColor]
#define BlackColor [UIColor blackColor]
#define BlueColor [UIColor blueColor]
#define BrownColor [UIColor brownColor]
#define DarkTextColor [UIColor darkTextColor]
#define LightTextColor [UIColor lightTextColor]
#define MagentaColor [UIColor magentaColor]
#define OrangeColor [UIColor orangeColor]
#define PurpleColor [UIColor purpleColor]
#define RedColor [UIColor redColor]
#define YellowColor [UIColor yellowColor]
#define CyanColor [UIColor cyanColor]

#define weakify_self   __weak typeof(self) weakSelf = self;
#define strongify_self __strong typeof(self) self = weakSelf;
//判断ios版本
#define IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define IS_IOS_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#define IS_IOS_7_LOWER ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0 ? YES : NO)
#define IS_IOS_8_LOWER ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0 ? YES : NO)



#endif /* Constant_h */
