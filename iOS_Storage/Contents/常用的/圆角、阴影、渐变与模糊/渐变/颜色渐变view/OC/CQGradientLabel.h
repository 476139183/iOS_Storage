//
//  CQGradientLabel.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Util.h"

NS_ASSUME_NONNULL_BEGIN

@interface CQGradientLabel : UILabel

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors direction:(CQGradientDirection)direction;

/**
 xib或storyboard玩家无法调用指定构造方法时，通过此方法配置
 
 @param colors 渐变颜色数组
 @param direction 渐变方向
 */
- (void)configWithColors:(NSArray <UIColor *>*)colors direction:(CQGradientDirection)direction;

@end

NS_ASSUME_NONNULL_END
