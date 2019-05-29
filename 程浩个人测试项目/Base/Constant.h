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

/** 屏幕大小 */
#define kScreenBounds [UIScreen mainScreen].bounds
/** 屏幕宽度 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define APP_STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height //包含热点栏（如有）高度，标准高度为20pt，当有个人热点连接时，高度为40pt。iphonex系统标准高度是44,当有个人热点连接时，高度为64pt

//iPhoneX / iPhoneXS
#define isIphoneX_XS (kScreenWidth == 375.f && kScreenHeight == 812.f ? YES : NO)
//iPhoneXR / iPhoneXSMax
#define isIphoneXR_XSMax (kScreenWidth == 414.f && kScreenHeight == 896.f ? YES : NO)
//是否是刘海屏
#define   isFullScreen    (isIphoneX_XS || isIphoneXR_XSMax)

//Status bar height.标准情况下StatusBarHeight,APP_STATUSBAR_HEIGHT等同于APP_STATUSBAR_HEIGHT,连接热点会加20,适配热点连接时直接用这个，系统会扣除热点增加的高度
#define  StatusBarHeight  (isFullScreen ? 44.f : 20.f)
// Tabbar safe bottom margin.
#define  TabbarSafeBottomMargin  (isFullScreen ? 34.f : 0.f)
// Navigation bar height.
#define NavigationBarHeight 44.f
// Tabbar height.
#define TabbarHeight (isFullScreen ? (49.f+34.f) : 49.f)
// Status bar & navigation bar height.
#define  StatusBarAndNavigationBarHeight  (isFullScreen ? 88.f : 64.f)

//屏幕宽高 横屏的
#define EDTabbrWidth LengthInIP6(71)
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width<[UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.width>[UIScreen mainScreen].bounds.size.height ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)

#define LengthInIP6(lengthInIP6) ((CGFloat)lengthInIP6)/375*ScreenHeight
#define LengthInIP6P(lengthInIP6P) (((CGFloat)lengthInIP6P)/414.0*ScreenHeight)

#define LengthByWidthIP6(lengthInIP6) ((CGFloat)lengthInIP6)/667*ScreenWidth

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

#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif


#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object; if (!self) return;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object; if (!self) return;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object; if (!self) return;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object; if (!self) return;
#endif
#endif
#endif


//是否是空对象
#define CHIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))



#endif /* Constant_h */
