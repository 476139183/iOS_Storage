//
//  UIView+Util.h
//  iOS_Storage
//
//  Created by 蔡强 on 2018/6/26.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Util)

/** 移除所有subview */
- (void)removeAllSubviews;

/** 获取当前view所在的viewController */
- (UIViewController *)getCurrentViewController;

/** 获取最近的一个遵循指定协议的响应者 */
//- (UIResponder *)getLatestResponderConformsToProtocol:(Protocol *)protocol;

@end
