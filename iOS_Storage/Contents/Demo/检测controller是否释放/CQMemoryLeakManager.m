//
//  CQMemoryLeakManager.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQMemoryLeakManager.h"

@implementation CQMemoryLeakManager

/** 检测内存泄漏 */
+ (void)checkController:(UIViewController *)controller {
    
    // 只在debug模式下检测内存泄漏
#ifdef DEBUG
    if ([controller isKindOfClass:[CQBaseNavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)controller;
        // 拿到当前Controller
        UIViewController *vc = navigationController.viewControllers.lastObject;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (vc) {
                // 如果3秒后这个Controller还存在，可以视为内存泄漏
                [UIAlertController showMemoryLeakWithInfo:vc.className];
            } else {
                // Controller虽然释放了，但它的subView不一定释放
                // 所以还要遍历subView，找到未释放的view
                for (UIView *subView in vc.view.subviews) {
                    [UIAlertController showMemoryLeakWithInfo:subView.className];
                }
            }
        });
    } else if ([controller isKindOfClass:[CQBaseViewController class]]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (controller) {
                [UIAlertController showMemoryLeakWithInfo:controller.className];
            } else {
                // Controller虽然释放了，但它的subView不一定释放
                // 所以还要遍历subView，找到未释放的view
                for (UIView *subView in controller.view.subviews) {
                    [UIAlertController showMemoryLeakWithInfo:subView.className];
                }
            }
        });
    }
#endif
    
}

@end
