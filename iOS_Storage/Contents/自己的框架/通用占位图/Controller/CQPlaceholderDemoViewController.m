//
//  CQPlaceholderDemoViewController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/9/20.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQPlaceholderDemoViewController.h"

@interface CQPlaceholderDemoViewController ()

@property (nonatomic, strong) UIView *blackView;

@end

@implementation CQPlaceholderDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.detailUrl = @"https://www.jianshu.com/p/beca3ac24031";
    
    UILabel *label = [UILabel new];
    [self.view addSubview:label];
    label.text = @"点击详情按钮查看";
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
    
}

@end
