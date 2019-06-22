//
//  UIColor+Util.h
//  DataHub
//
//  Created by 蔡强 on 2018/8/6.
//  Copyright © 2018年 kuaijiankang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

/* 从十六进制字符串获取颜色 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/* 从十六进制字符串获取颜色 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
