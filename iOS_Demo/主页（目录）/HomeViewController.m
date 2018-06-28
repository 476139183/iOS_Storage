//
//  HomeViewController.m
//  iOS_Demo
//
//  Created by 蔡强 on 2018/6/23.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "HomeViewController.h"

static NSString * const HomeCellReuseID = @"HomeCellReuseID";

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation HomeViewController

#pragma mark - Lazy Load

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[
                       @{@"demo_name" : @"比例拼图", @"controller_name" : @"CQJigsawViewController"},
                       @{@"demo_name" : @"不规格label", @"controller_name" : @"CQIrregularViewController"},
                       @{@"demo_name" : @"菜单栏+下拉列表", @"controller_name" : @"CQIphoneViewController"},
                       @{@"demo_name" : @"局部瀑布流", @"controller_name" : @"CQWaterfallController"},
                       ];
    }
    return _dataArray;
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"demos";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:HomeCellReuseID];
}

#pragma mark - UITableView DataSource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeCellReuseID];
    NSDictionary *demoDict = self.dataArray[indexPath.row];
    cell.textLabel.text = demoDict[@"demo_name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *demoDict = self.dataArray[indexPath.row];
    UIViewController *vc = [[NSClassFromString(demoDict[@"controller_name"]) alloc] init];
    vc.title = demoDict[@"demo_name"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
