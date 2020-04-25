//
//  CQStandardOCCollectionFooterView.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStandardOCCollectionFooterView.h"

@implementation CQStandardOCCollectionFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor purpleColor];
        
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.text = @"这是表尾";
        label.font = [UIFont boldSystemFontOfSize:30];
        label.textAlignment = NSTextAlignmentCenter;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return self;
}

@end
