//
//  CQDemoView.h
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CQDemoView;

NS_ASSUME_NONNULL_BEGIN

@protocol CQDemoViewDelegate <NSObject>

- (void)demoViewButtonDidClick:(CQDemoView *)demoView;

@end

@interface CQDemoView : UIView

@property (nonatomic, weak) id <CQDemoViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
