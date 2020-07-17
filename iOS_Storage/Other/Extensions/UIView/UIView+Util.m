//
//  UIView+Util.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/6/26.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)

- (void)removeAllSubviews {
    for (__strong UIView *subView in self.subviews) {
        [subView removeFromSuperview];
        subView = nil;
    }
}

/** 获取当前view所在的viewController */
- (UIViewController *)getCurrentViewController {
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            UIViewController *vc = (UIViewController *)nextResponder;
            return vc;
        }
    }
    return nil;
}

/** 获取最近的一个遵循指定协议的响应者 */
//- (UIResponder *)getLatestResponderConformsToProtocol:(Protocol *)protocol {
//
//    UIResponder *responder = self.nextResponder;
//
//    while (responder) {
//
//        if ([responder conformsToProtocol:protocol]) {
//            return responder;
//        }
//
//        responder = responder.nextResponder;
//    }
//
//    return nil;
//
//}

@end
