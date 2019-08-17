//
//  CQMVVMCell.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQMVVMCell.h"

@interface CQMVVMCell()

@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *delButton;

@end

@implementation CQMVVMCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.numLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.numLabel];
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.font = [UIFont systemFontOfSize:16];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.centerX.mas_equalTo(self.contentView);
    }];
}

- (void)addButtonClicked {
    self.viewModel.model.num += 1;
}

- (void)delButtonClicked {
    self.viewModel.model.num -= 1;
}

@end
