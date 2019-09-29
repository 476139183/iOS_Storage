//
//  CQGradientLabel.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQGradientLabel.h"

@interface CQGradientLabel ()

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, assign) CQGradientDirection direction;

@end

@implementation CQGradientLabel

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors direction:(CQGradientDirection)direction {
    if (self = [super init]) {
        self.colors = colors;
        self.direction = direction;
    }
    return self;
}

/**
 xib或storyboard玩家无法调用指定构造方法时，通过此方法配置
 
 @param colors 渐变颜色数组
 @param direction 渐变方向
 */
- (void)configWithColors:(NSArray *)colors direction:(CQGradientDirection)direction {
    self.colors = colors;
    self.direction = direction;
    self.backgroundColor = [UIColor colorWithGradientBounds:self.bounds colors:colors direction:direction];
}

- (void)layoutSubviews {
    self.backgroundColor = [UIColor colorWithGradientBounds:self.bounds colors:self.colors direction:self.direction];
}

@end
