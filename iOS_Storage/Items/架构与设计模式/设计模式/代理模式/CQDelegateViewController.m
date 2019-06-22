//
//  CQDelegateViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQDelegateViewController.h"
#import "CQDemoView.h"

@interface CQDelegateViewController () <CQDemoViewDelegate>

@end

@implementation CQDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CQDemoView *demoView = [[CQDemoView alloc] initWithFrame:CGRectMake(90, 90, 90, 90)];
    [self.view addSubview:demoView];
    demoView.delegate = self;
}

#pragma mark - CQDemoView Delegate

- (void)demoViewButtonDidClick:(CQDemoView *)demoView {
    NSLog(@"点击");
}

@end
