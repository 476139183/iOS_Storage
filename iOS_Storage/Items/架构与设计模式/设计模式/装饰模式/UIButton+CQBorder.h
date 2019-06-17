//
//  UIButton+CQBorder.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (CQBorder)

// 给UIButton添加一个构造方法
// 这就是装饰模式
- (instancetype)initWithFrame:(CGRect)frame borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
