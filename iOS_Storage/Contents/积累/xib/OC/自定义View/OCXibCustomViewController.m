//
//  OCXibCustomViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import "OCXibCustomViewController.h"
#import "OCXibBlueView.h"

@interface OCXibCustomViewController ()

@end

@implementation OCXibCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    OCXibBlueView *blueView = [[NSBundle mainBundle] loadNibNamed:@"OCXibBlueView" owner:self options:nil].firstObject;
    [self.view addSubview:blueView];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
}

@end
