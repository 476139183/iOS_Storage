//
//  CQCustomButtonController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/7/26.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQCustomButtonController.h"

@interface CQCustomButtonController ()

@end

@implementation CQCustomButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90, 90, 200, 60)];
    [self.view addSubview:label];
    label.numberOfLines = 0;
    label.text = @"关键就是继承UIControl，详情可以查看简书文章";
}

@end
