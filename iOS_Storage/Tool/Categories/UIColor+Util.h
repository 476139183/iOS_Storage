//
//  UIColor+Util.h
//  DataHub
//
//  Created by 蔡强 on 2018/8/6.
//  Copyright © 2018年 kuaijiankang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CQGradientDirection) {
    CQGradientDirectionTopToBottom,          // 从上往下
    CQGradientDirectionLeftToRight,          // 从左往右
    CQGradientDirectionBottomToTop,          // 从下往上
    CQGradientDirectionRightToLeft,          // 从右往左
    CQGradientDirectionLeftTopToRightBottom, // 左上到右下
    CQGradientDirectionLeftBottomToRightTop, // 左下到右上
    CQGradientDirectionRightTopToLeftBottom, // 右上到左下
    CQGradientDirectionRightBottomToLeftTop  // 右下到左上
};

@interface UIColor (Util)

/* 从十六进制字符串获取颜色 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/* 从十六进制字符串获取颜色 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 *  @brief  生成渐变色
 *
 *  @param  bounds  bound
 *  @param  colors  渐变颜色组
 *  @param  direction  渐变方向
 *
 *  @return 渐变色
 */
+ (UIColor *)colorWithGradientBounds:(CGRect)bounds colors:(NSArray <UIColor *>*)colors direction:(CQGradientDirection)direction;

@end
