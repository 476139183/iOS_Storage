//
//  CQTabBarController.m
//  iOS_Demo
//
//  Created by 蔡强 on 2018/7/2.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQTabBarController.h"
#import "CQDemoController.h"
#import "CQLibraryController.h"
#import "CQArchitectureController.h"
#import "CQArithmeticController.h"
#import "CQInterviewController.h"

@interface CQTabBarController ()

@end

@implementation CQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CQDemoController *demoVC = [[CQDemoController alloc] init];
    UINavigationController *demoNavi = [[UINavigationController alloc] initWithRootViewController:demoVC];
    demoNavi.tabBarItem.title = @"demo";
    
    CQLibraryController *libraryVC = [[CQLibraryController alloc] init];
    UINavigationController *libraryNavi = [[UINavigationController alloc] initWithRootViewController:libraryVC];
    libraryNavi.tabBarItem.title = @"框架/库";
    
    CQArchitectureController *architectureVC = [[CQArchitectureController alloc] init];
    UINavigationController *architectureNavi = [[UINavigationController alloc] initWithRootViewController:architectureVC];
    architectureNavi.tabBarItem.title = @"架构/设计模式";
    
    CQArithmeticController *arithmeticVC = [[CQArithmeticController alloc] init];
    UINavigationController *arithmeticNavi = [[UINavigationController alloc] initWithRootViewController:arithmeticVC];
    arithmeticNavi.tabBarItem.title = @"数据结构&算法";
    
    CQInterviewController *interviewVC = [[CQInterviewController alloc] init];
    UINavigationController *interviewNavi = [[UINavigationController alloc] initWithRootViewController:interviewVC];
    interviewNavi.tabBarItem.title = @"面试";
    
    self.viewControllers = @[demoNavi, libraryNavi, architectureNavi, arithmeticNavi, interviewNavi];
}

@end
