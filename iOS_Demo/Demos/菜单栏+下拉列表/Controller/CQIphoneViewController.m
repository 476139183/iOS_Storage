//
//  CQIphoneViewController.m
//  iOS_Demo
//
//  Created by 蔡强 on 2018/6/26.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQIphoneViewController.h"
#import "IphoneMenuView.h"
#import "IphoneListView.h"
#import "CQIphoneRequest.h"

@interface CQIphoneViewController () <IphoneMenuViewDelegate>

@property (nonatomic, strong) IphoneMenuView *menuView;

@end

@implementation CQIphoneViewController

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // UI搭建
    [self setupUI];
    // 加载数据
    [self loadMenuDataSuccess:nil failure:nil];
}

#pragma mark - UI搭建

- (void)setupUI {
    self.menuView = [[IphoneMenuView alloc] init];
    [self.view addSubview:self.menuView];
    self.menuView.delegate = self;
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(NAVIGATION_BAR_HEIGHT);
        make.height.mas_equalTo(30);
    }];
}

#pragma mark - Load Data

- (void)loadMenuDataSuccess:(void (^)(void))success failure:(void (^)(void))failure {
    [CQIphoneRequest loadMenuDataSuccess:^(NSDictionary *dataDict) {
        NSError *error = nil;
        IphoneMenuModel *model = [[IphoneMenuModel alloc] initWithDictionary:dataDict error:&error];
        self.menuView.model = model;
        !success ?: success();
    } failure:^(NSString *errorMessage) {
        [SVProgressHUD showErrorWithStatus:errorMessage];
        !failure ?: failure();
    }];
}

#pragma mark - Delegate - menuView

// 菜单按钮点击
- (void)menuView:(IphoneMenuView *)menuView clickedButtonAtIndex:(NSInteger)index {
    
}

@end
