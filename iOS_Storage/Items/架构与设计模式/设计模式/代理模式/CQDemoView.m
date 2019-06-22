//
//  CQDemoView.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQDemoView.h"

@implementation CQDemoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        
        UIButton *blueButton = [[UIButton alloc] init];
        [self addSubview:blueButton];
        blueButton.backgroundColor = [UIColor blueColor];
        [blueButton setTitle:@"点击" forState:UIControlStateNormal];
        [blueButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        [blueButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
    }
    return self;
}

- (void)buttonClicked {
    if ([self.delegate respondsToSelector:@selector(demoViewButtonDidClick:)]) {
        [self.delegate demoViewButtonDidClick:self];
    }
}

@end
