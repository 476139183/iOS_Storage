//
//  IphoneMenuButton.m
//  iOS_Demo
//
//  Created by 蔡强 on 2018/6/26.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "IphoneMenuButton.h"

@interface IphoneMenuButton ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation IphoneMenuButton

#pragma mark - 构造方法

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI搭建

- (void)setupUI {
    self.nameLabel = [[UILabel alloc] init];
    [self addSubview:self.nameLabel];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_offset(0);
        make.right.mas_equalTo(-20);
    }];
    
    self.arrowImageView = [[UIImageView alloc] init];
    [self addSubview:self.arrowImageView];
    self.arrowImageView.image = [UIImage imageNamed:@"triangle_red"];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.right.mas_equalTo(self);
    }];
}

#pragma mark - set model

- (void)setModel:(IphoneMenuItemModel *)model {
    _model = model;
    
    self.nameLabel.text = _model.name;
}

#pragma mark - set selected

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if (selected) {
        
    } else {
        
    }
}

@end
