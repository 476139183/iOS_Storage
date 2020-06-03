//
//  CQCheckDeallocViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/16.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQCheckDeallocViewController.h"
#import "CQMemoryLeakViewController.h"

@interface CQCheckDeallocViewController ()

@property (nonatomic, strong) UIButton *presentButton;
@property (nonatomic, strong) UIButton *pushButton;

@end

@implementation CQCheckDeallocViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.presentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.presentButton.frame = CGRectMake(100, 150, 90, 90);
    self.presentButton.backgroundColor = [UIColor orangeColor];
    [self.presentButton setTitle:@"present" forState:UIControlStateNormal];
    [self.presentButton addTarget:self action:@selector(presentButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    self.pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.pushButton.frame = CGRectMake(100, 300, 90, 90);
    [self.pushButton setTitle:@"push" forState:UIControlStateNormal];
    [self.pushButton addTarget:self action:@selector(pushButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.presentButton];
    [self.view addSubview:self.pushButton];
}

- (void)dealloc {
    NSLog(@"vc已释放");
}

- (void)presentButtonClicked {
    CQMemoryLeakViewController *vc = [[CQMemoryLeakViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)pushButtonClicked {
    CQMemoryLeakViewController *vc = [[CQMemoryLeakViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
