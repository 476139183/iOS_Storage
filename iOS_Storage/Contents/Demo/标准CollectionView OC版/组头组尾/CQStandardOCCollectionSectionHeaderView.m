//
//  CQStandardOCCollectionSectionHeaderView.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStandardOCCollectionSectionHeaderView.h"

@interface CQStandardOCCollectionSectionHeaderView ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation CQStandardOCCollectionSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor redColor];
    
    self.label = [[UILabel alloc] init];
    [self addSubview:self.label];
    self.label.text = @"组头";
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsZero);
    }];
}

@end
