//
//  CQSDWebImageViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import "CQSDWebImageViewController.h"
#import <UIImageView+WebCache.h>

@interface CQSDWebImageViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CQSDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(90, 90, 260, 90)];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor grayColor];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"]];
    
}

@end
