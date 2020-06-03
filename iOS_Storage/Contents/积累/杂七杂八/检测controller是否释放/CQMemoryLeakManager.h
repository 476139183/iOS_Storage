//
//  CQMemoryLeakManager.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQMemoryLeakManager : NSObject

/** 检测内存泄漏 */
+ (void)checkController:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END
