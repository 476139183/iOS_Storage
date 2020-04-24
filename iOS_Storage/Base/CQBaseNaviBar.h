//
//  CQBaseNaviBar.h
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/24.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQBaseNaviBar : UIView

/// 标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 返回按钮
@property (nonatomic, strong) UIButton *backButton;
/// 详情按钮
@property (nonatomic, strong) UIButton *detailButton;

@end

NS_ASSUME_NONNULL_END
