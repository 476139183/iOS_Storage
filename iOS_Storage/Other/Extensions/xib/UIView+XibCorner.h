//
//  UIView+XibCorner.h
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface UIView (XibCorner)

@property(nonatomic,assign) IBInspectable CGFloat cornerRadius;
//@property(nonatomic,assign) IBInspectable UIColor *borderColor;
//@property(nonatomic,assign) IBInspectable CGFloat borderWidth;

@end

NS_ASSUME_NONNULL_END
