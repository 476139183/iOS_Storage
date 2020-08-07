//
//  CQBaseNaviBar.m
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/24.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import "CQBaseNaviBar.h"

@interface CQBaseNaviBar ()

@end

@implementation CQBaseNaviBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    
    // 标题
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    self.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.bottom.mas_equalTo(self);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(SCREEN_WIDTH - 100);
    }];
    
    // 返回按钮
    self.backButton = [[UIButton alloc] init];
    [self addSubview:self.backButton];
    [self.backButton setImage:[UIImage imageNamed:@"nav_back_icon"] forState:UIControlStateNormal];
    [self.backButton setEnlargeEdgeWithTop:10 right:10 bottom:0 left:20];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.titleLabel);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(18);
    }];
    
    // 详情按钮
    self.detailButton = [[UIButton alloc] init];
    [self addSubview:self.detailButton];
    [self.detailButton setTitle:@"详情" forState:UIControlStateNormal];
    [self.detailButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.detailButton.titleLabel setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightMedium]];
    [self.detailButton setEnlargeEdgeWithTop:10 right:10 bottom:0 left:10];
    self.detailButton.hidden = YES;
    [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.mas_equalTo(self.titleLabel);
        make.right.mas_equalTo(self).offset(-20);
    }];
    
    // 灰色线
    UIView *lineView = [[UIView alloc] init];
    [self addSubview:lineView];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
}

@end
