//
//  UIColor+Hex.h
//  程浩个人测试项目
//
//  Created by chenghao on 2019/5/28.
//  Copyright © 2019 id. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define CH_HexColor(hex) [UIColor colorWithHexString:@#hex]
#define CH_HexColor(hex,alphaValue) [UIColor colorWithHexString:@#hex alpha:alphaValue]

@interface UIColor (Hex)

/**
 *  @brief  随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)RandomColor;

+ (UIColor *)colorWithHex:(NSUInteger)hexColor;

+ (UIColor *)colorWithHex:(NSUInteger)hexColor alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
