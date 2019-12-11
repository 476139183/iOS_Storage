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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"详情" style:UIBarButtonItemStylePlain target:self action:@selector(detailButtonClicked)];
}

- (void)dealloc {
    NSLog(@"已释放：%@", self.className);
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [super dismissViewControllerAnimated:flag completion:completion];
    
    //[CQMemoryLeakManager checkController:self];
}

- (void)checkMemoryLeak {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self) {
            NSLog(@"Memory Leak === %@", self.className);
        }
    });
}

#pragma mark - 详情按钮点击

- (void)detailButtonClicked {
    if (!self.url || [self.url isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"暂无对应文章"];
        return;
    }
    // 进入详情页
    CQDetailViewController *detailVC = [[CQDetailViewController alloc] initWithTitle:self.title url:self.url];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
