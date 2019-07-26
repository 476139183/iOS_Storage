//
//  CQStandardOCCollectionSectionFooterView.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStandardOCCollectionSectionFooterView.h"

@interface CQStandardOCCollectionSectionFooterView ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation CQStandardOCCollectionSectionFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor greenColor];
    
    self.label = [[UILabel alloc] init];
    [self addSubview:self.label];
    self.label.text = @"组尾";
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsZero);
    }];
}

@end
