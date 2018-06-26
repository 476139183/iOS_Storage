//
//  CQIrregularViewController.m
//  iOS_Demo
//
//  Created by 蔡强 on 2018/6/26.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQIrregularViewController.h"
#import "IrregularLabel.h"

@interface CQIrregularViewController ()

@property (nonatomic, strong) IrregularLabel *label;

@end

@implementation CQIrregularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.label = [[IrregularLabel alloc] initWithFrame:CGRectMake(90, 200, 200, 40)];
    [self.view addSubview:self.label];
    self.label.text = @"这是一个不规则label";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor redColor];
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont boldSystemFontOfSize:16];
}

@end
