//
//  CQEasyButton.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQEasyButton.h"

@implementation CQEasyButton

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor {
    if (self = [super init]) {
        self.imageView.image = image;
        self.titleLabel.text = title;
        self.titleLabel.font = font;
        self.titleLabel.textColor = titleColor;
    }
    return self;
}

@end
