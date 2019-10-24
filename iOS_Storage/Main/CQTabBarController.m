//
//  CQTabBarController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/7/2.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQTabBarController.h"
#import "CQContentViewController.h"

@interface CQTabBarController ()

@end

@implementation CQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 目录
    NSArray *contents = @[@"frequently_used_contents",
                          @"demo_contents",
                          @"third_part_contents",
                          @"framework_contents",
                          @"architecture_contents",
                          @"arithmetic_contents",
                          @"tips_contents"];
    
    // 标题
    NSArray *titles   = @[@"常用的",
                          @"demo",
                          @"三方库",
                          @"个人框架",
                          @"架构/设计模式",
                          @"算法/数据结构",
                          @"tips"];
    
    // controllers
    NSMutableArray *controllers = [NSMutableArray array];
    for (int i = 0; i < contents.count; i++) {
        CQContentViewController *contentVC = [[CQContentViewController alloc] initWithContent:contents[i]];
        UINavigationController *contentNaviVC = [[UINavigationController alloc] initWithRootViewController:contentVC];
        contentVC.title = contentNaviVC.tabBarItem.title = titles[i];
        [controllers addObject:contentNaviVC];
    }
    
    self.viewControllers = controllers.copy;
}

@end
