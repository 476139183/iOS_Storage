//
//  CQStrategyViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStrategyViewController.h"
#import "CQStrategyManager.h"

@interface CQStrategyViewController ()

@end

@implementation CQStrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"点击感受策略模式" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchDown];
}

- (void)test {
    [CQStrategyManager useStrategyWithType:CQStrategyTypeThree];
}

@end
