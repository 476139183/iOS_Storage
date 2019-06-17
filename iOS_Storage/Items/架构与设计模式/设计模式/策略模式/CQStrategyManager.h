//
//  CQStrategyManager.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CQStrategyType) {
    CQStrategyTypeOne,
    CQStrategyTypeTwo,
    CQStrategyTypeThree,
};

@interface CQStrategyManager : NSObject

+ (void)useStrategyWithType:(CQStrategyType)type;

@end

NS_ASSUME_NONNULL_END
