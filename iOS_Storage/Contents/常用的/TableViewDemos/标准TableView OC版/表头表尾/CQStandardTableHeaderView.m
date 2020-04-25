//
//  CQStandardTableHeaderView.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStandardTableHeaderView.h"

@implementation CQStandardTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor redColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    titleLabel.text = @"这是表头\n高度自适应";
    titleLabel.numberOfLines = 0;
    titleLabel.backgroundColor = [UIColor purpleColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
}

@end
