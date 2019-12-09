//
//  CQMemoryLeakViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQMemoryLeakViewController.h"
#import "CQMemoryLeakView.h"

@interface CQMemoryLeakViewController ()

@property (nonatomic, strong) UIButton *dismissButton;
@property (nonatomic, strong) UIButton *popButton;

@property (nonatomic, copy) dispatch_block_t block;

@property (nonatomic, strong) CQMemoryLeakView *redView;

@end

@implementation CQMemoryLeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.block = ^{
//        self.view.backgroundColor = [UIColor yellowColor];
//    };
//    self.block();
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.dismissButton.frame = CGRectMake(100, 150, 90, 90);
    [self.dismissButton setTitle:@"dismiss" forState:UIControlStateNormal];
    [self.dismissButton addTarget:self action:@selector(dismissButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    self.popButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.popButton.frame = CGRectMake(100, 300, 90, 90);
    [self.popButton setTitle:@"pop" forState:UIControlStateNormal];
    [self.popButton addTarget:self action:@selector(popButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.dismissButton];
    [self.view addSubview:self.popButton];
    
//    self.redView = [[CQMemoryLeakView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [self.view addSubview:self.redView];
}

- (void)dismissButtonClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)popButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
