//
//  CQEasyButton.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQEasyButton : UIControl

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor;

@end

NS_ASSUME_NONNULL_END
