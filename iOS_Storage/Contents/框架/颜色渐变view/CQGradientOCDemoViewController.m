//
//  CQGradientOCDemoViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQGradientOCDemoViewController.h"

@interface CQGradientOCDemoViewController ()

@property (nonatomic, strong) CQGradientView *gradientView;
@property (nonatomic, strong) CQGradientControl *cc;
@property (nonatomic, strong) CQGradientButton *button;

@end

@implementation CQGradientOCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 右下到左上渐变
    self.gradientView = [[CQGradientView alloc] initWithColors:@[[UIColor yellowColor], [UIColor orangeColor]] direction:CQGradientDirectionLeftToRight];
    [self.view addSubview:self.gradientView];
    self.gradientView.frame = CGRectMake(90, 90, 90, 90);
    
    self.button = [[CQGradientButton alloc] initWithColors:@[[UIColor redColor], [UIColor blueColor]] direction:CQGradientDirectionBottomToTop];
    [self.view addSubview:self.button];
    self.button.frame = CGRectMake(90, 200, 90, 90);
    [self.button setTitle:@"title" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button.titleLabel setFont:[UIFont boldSystemFontOfSize:30]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.gradientView.frame = CGRectMake(90, 190, 190, 190);
}

@end
