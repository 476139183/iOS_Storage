//
//  Work.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "TimeState.h"
@class TimeState;

NS_ASSUME_NONNULL_BEGIN

@interface Work : NSObject

@property (nonatomic, strong) TimeState *state;
@property (nonatomic, assign) CGFloat hour;

/** 敲代码 */
- (void)code;

@end

NS_ASSUME_NONNULL_END
