//
//  CQTabBarController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/7/2.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQTabBarController.h"
#import "CQContentViewController.h"
#import "CQBaseNavigationController.h"

@interface CQTabBarItemModel : NSObject

/** 目录 */
@property (nonatomic, copy) NSString *contents;
/** 标题 */
@property (nonatomic, copy) NSString *title;

@end

@implementation CQTabBarItemModel

+ (instancetype)modelWithContents:(NSString *)contents title:(NSString *)title {
    CQTabBarItemModel *model = [[CQTabBarItemModel alloc] init];
    model.contents = contents;
    model.title = title;
    return model;
}

@end

@interface CQTabBarController ()

@end

@implementation CQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray<CQTabBarItemModel *> *items = @[[CQTabBarItemModel modelWithContents:@"frequently_used_contents" title:@"常用的"],
                                            [CQTabBarItemModel modelWithContents:@"demo_contents" title:@"demo"],
                                            [CQTabBarItemModel modelWithContents:@"third_part_contents" title:@"三方库"],
                                            [CQTabBarItemModel modelWithContents:@"framework_contents" title:@"个人框架"],
                                            [CQTabBarItemModel modelWithContents:@"architecture_contents" title:@"架构/设计模式"],
                                            [CQTabBarItemModel modelWithContents:@"arithmetic_contents" title:@"算法/数据结构"],
                                            [CQTabBarItemModel modelWithContents:@"tips_contents" title:@"tips"]];
    
    // controllers
    NSMutableArray *controllers = [NSMutableArray array];
    for (int i = 0; i < items.count; i++) {
        CQTabBarItemModel *model = items[i];
        CQContentViewController *contentVC = [[CQContentViewController alloc] initWithContents:model.contents];
        CQBaseNavigationController *contentNaviVC = [[CQBaseNavigationController alloc] initWithRootViewController:contentVC];
        contentVC.title = contentNaviVC.tabBarItem.title = model.title;
        [controllers addObject:contentNaviVC];
    }
    
    self.viewControllers = controllers;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
}

@end
