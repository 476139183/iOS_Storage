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
    NSArray *contents = @[@"demo_contents",
                          @"architecture_contents",
                          @"library_contents",
                          @"arithmetic_contents",
                          @"tips_contents"];
    
    // 标题
    NSArray *titles   = @[@"demo",
                          @"架构/设计模式",
                          @"框架",
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
