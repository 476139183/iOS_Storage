//
//  CQDecoratorViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQDecoratorViewController.h"
#import "UIButton+CQBorder.h"

@interface CQDecoratorViewController ()

@end

@implementation CQDecoratorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // colorWithHexString其实就是装饰模式的运用
    self.view.backgroundColor = [UIColor colorWithHexString:@"333333"];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(90, 100, 100, 40) borderWidth:1 borderColor:[UIColor blueColor]];
    [self.view addSubview:button];
    [button setTitle:@"装饰模式" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
