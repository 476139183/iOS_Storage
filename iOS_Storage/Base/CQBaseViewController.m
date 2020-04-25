//
//  CQBaseViewController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/6/28.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQBaseViewController.h"
#import "CQDetailViewController.h"
#import "CQMemoryLeakManager.h"

@interface CQBaseViewController ()

@end

@implementation CQBaseViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 隐藏系统导航栏
    self.navigationController.navigationBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加自定义导航栏
    self.naviBar = [[CQBaseNaviBar alloc] init];
    [self.view addSubview:self.naviBar];
    self.naviBar.titleLabel.text = self.title;
    [self.naviBar.backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.naviBar.detailButton addTarget:self action:@selector(detailButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(NAVIGATION_BAR_HEIGHT);
    }];
}

#warning 这里要修改

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.view bringSubviewToFront:self.naviBar];
}


- (void)dealloc {
    NSLog(@"已释放：%@", self.className);
}

/** 返回按钮点击 */
- (void)backButtonClicked {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [super dismissViewControllerAnimated:flag completion:completion];
    
    // [CQMemoryLeakManager checkController:self];
}

- (void)checkMemoryLeak {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self) {
            NSLog(@"Memory Leak === %@", self.className);
        }
    });
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    
    self.naviBar.titleLabel.text = title;
}

#pragma mark - 详情按钮点击

- (void)detailButtonClicked {
    if (!self.detailUrl || [self.detailUrl isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"木有详情"];
        return;
    }
    // 进入详情页
    CQDetailViewController *detailVC = [[CQDetailViewController alloc] initWithTitle:self.title url:self.detailUrl];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
