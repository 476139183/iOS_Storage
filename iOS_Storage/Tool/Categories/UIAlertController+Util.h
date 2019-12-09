//
//  UIAlertController+Util.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (Util)

/** 内存泄漏提示弹窗 */
+ (void)showMemoryLeakWithInfo:(NSString *)info;

@end

NS_ASSUME_NONNULL_END
