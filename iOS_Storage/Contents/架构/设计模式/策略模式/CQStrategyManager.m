//
//  CQStrategyManager.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStrategyManager.h"

@implementation CQStrategyManager

+ (void)useStrategyWithType:(CQStrategyType)type {
    // 传入type，根据type做决策
    switch (type) {
        case CQStrategyTypeOne:
        {
            NSLog(@"使用策略1");
        }
            break;
            
        case CQStrategyTypeTwo:
        {
            NSLog(@"使用策略2");
        }
            break;
            
        case CQStrategyTypeThree:
        {
            NSLog(@"使用策略3");
        }
            break;
    }
}

@end
