//
//  CQBaseNavigationController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQBaseNavigationController.h"
#import "CQMemoryLeakManager.h"

@interface CQBaseNavigationController ()

@end

@implementation CQBaseNavigationController

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    // 检测内存泄漏
    //[CQMemoryLeakManager checkController:self];
    return [super popViewControllerAnimated:animated];
}

@end
