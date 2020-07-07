//
//  URLToQRCodeTool.h
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface URLToQRCodeTool : NSObject

/// url转二维码
/// @param urlString url
/// @param width 图片宽
+ (UIImage *)createrImageWithURLString:(NSString *)urlString imageWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
