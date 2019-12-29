//
//  UIAlertController+Util.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "UIAlertController+Util.h"

@implementation UIAlertController (Util)

/** 内存泄漏提示弹窗 */
+ (void)showMemoryLeakWithInfo:(NSString *)info {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"内存泄漏" message:info preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:action];
    [UIApplication.sharedApplication.delegate.window.rootViewController presentViewController:alertVC animated:YES completion:nil];
}

@end
