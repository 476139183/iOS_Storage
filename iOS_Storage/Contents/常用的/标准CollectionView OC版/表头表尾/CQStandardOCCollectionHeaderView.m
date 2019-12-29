//
//  CQStandardOCCollectionHeaderView.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStandardOCCollectionHeaderView.h"

@interface CQStandardOCCollectionHeaderView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation CQStandardOCCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView = [[UIView alloc] init];
        [self addSubview:self.contentView];
        self.contentView.backgroundColor = [UIColor orangeColor];
        [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(self);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        self.textLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.textLabel];
        self.textLabel.text = @"这是表头";
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = [UIFont boldSystemFontOfSize:30];
        self.textLabel.numberOfLines = 0;
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(30);
            make.bottom.mas_equalTo(-30);
        }];
        
        self.addButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.addButton.frame = CGRectMake(0, 0, 150, 40);
        [self.contentView addSubview:self.addButton];
        [self.addButton setTitle:@"点击添加文本" forState:UIControlStateNormal];
        [self.addButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [self.addButton addTarget:self action:@selector(addButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)addButtonClicked {
    self.textLabel.text = [self.textLabel.text stringByAppendingString:@"\n这是表头"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    !self.layoutBlock?: self.layoutBlock();
}

@end
