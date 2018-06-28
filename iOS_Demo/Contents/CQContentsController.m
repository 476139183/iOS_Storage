//
//  HomeViewController.m
//  iOS_Demo
//
//  Created by 蔡强 on 2018/6/23.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQContentsController.h"
#import "CQContentModel.h"

static NSString * const CQContentCellReuseID = @"CQContentCellReuseID";

@interface CQContentsController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CQContentsController

#pragma mark - Lazy Load

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSString *catalogPath = [[NSBundle mainBundle] pathForResource:@"cq_contents" ofType:@"plist"];
        NSArray *catalogArray = [NSArray arrayWithContentsOfFile:catalogPath];
        for (NSDictionary *catalogDict in catalogArray) {
            NSError *error = nil;
            CQContentModel *model = [[CQContentModel alloc] initWithDictionary:catalogDict error:&error];
            [_dataArray addObject:model];
        }
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
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CQContentCellReuseID];
}

#pragma mark - UITableView DataSource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CQContentCellReuseID];
    CQContentModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.demo_name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CQContentModel *model = self.dataArray[indexPath.row];
    CQBaseViewController *detailVC = [[NSClassFromString(model.controller_name) alloc] init];
    detailVC.title = model.demo_name;
    detailVC.jianshuURL = model.jianshu_url;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
