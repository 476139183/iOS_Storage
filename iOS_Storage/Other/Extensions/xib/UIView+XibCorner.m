//
//  UIView+XibCorner.m
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import "UIView+XibCorner.h"

@implementation UIView (XibCorner)

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius= cornerRadius;
    self.layer.masksToBounds= cornerRadius >0;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

//- (void)setBorderColor:(UIColor *)borderColor {
//    self.layer.borderColor = borderColor.CGColor;
//}
//
//- (UIColor *)borderColor {
//    return [[UIColor alloc] initWithCGColor:self.layer.borderColor];
//}
//
//- (void)setBorderWidth:(CGFloat)borderWidth {
//    self.layer.borderWidth = borderWidth;
//}
//
//- (CGFloat)borderWidth {
//    return self.layer.borderWidth;
//}

@end
