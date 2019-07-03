//
//  GameRole.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameRole : NSObject

@property (nonatomic, assign) CGFloat hp;
@property (nonatomic, assign) CGFloat mp;

- (void)fight;
/** 展示状态栏 */
- (void)displayState;

@end

NS_ASSUME_NONNULL_END
