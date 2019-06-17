//
//  UIButton+CQBorder.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "UIButton+CQBorder.h"

@implementation UIButton (CQBorder)

- (instancetype)initWithFrame:(CGRect)frame borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    if (self = [super initWithFrame:frame]) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.CGColor;
    }
    return self;
}

@end
