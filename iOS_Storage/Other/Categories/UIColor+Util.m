//
//  UIColor+Util.m
//  DataHub
//
//  Created by 蔡强 on 2018/8/6.
//  Copyright © 2018年 kuaijiankang. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

/**
 *  @brief  生成渐变色
 *
 *  @param  bounds  bound
 *  @param  colors  渐变颜色组
 *  @param  direction  渐变方向
 *
 *  @return 渐变色
 */
+ (UIColor *)colorWithGradientBounds:(CGRect)bounds colors:(NSArray <UIColor *>*)colors direction:(CQGradientDirection)direction {
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(bounds.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    
    CGPoint startPt =  CGPointMake(0, 0);
    CGPoint endPt =  CGPointMake(0, 0);
    
    CGFloat width = bounds.size.width;
    CGFloat height = bounds.size.height;
    
    switch (direction) {
        case CQGradientDirectionTopToBottom:
        {
            // 上 到 下
            startPt= CGPointMake(0, 0);
            endPt= CGPointMake(0, height);
            break;
        }
        case CQGradientDirectionLeftToRight:
        {
            // 左 到 右
            startPt = CGPointMake(0, 0);
            endPt = CGPointMake(width, 0);
            break;
        }
        case CQGradientDirectionBottomToTop:
        {
            // 下 到 上
            startPt = CGPointMake(0, height);
            endPt = CGPointMake(0, 0);
            break;
        }
        case CQGradientDirectionRightToLeft:
        {
            // 右 到 左
            startPt = CGPointMake(width, 0);
            endPt = CGPointMake(0, 0);
            break;
        }
        case CQGradientDirectionLeftTopToRightBottom:
        {
            // 左上 到 右下
            startPt = CGPointMake(0, 0);
            endPt = CGPointMake(width, height);
            break;
        }
        case CQGradientDirectionLeftBottomToRightTop:
        {
            // 左下 到 右上
            startPt = CGPointMake(0, height);
            endPt = CGPointMake(width, 0);
            break;
        }
        case CQGradientDirectionRightTopToLeftBottom: {
            // 右上 到 左下
            startPt = CGPointMake(width, 0);
            endPt = CGPointMake(0, height);
            break;
        }
        case CQGradientDirectionRightBottomToLeftTop: {
            // 右下 到 左上
            startPt = CGPointMake(width, height);
            endPt = CGPointMake(0, 0);
            break;
        }
    }
    CGContextDrawLinearGradient(context, gradient, startPt, endPt, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return [UIColor colorWithPatternImage:image];
}

@end
