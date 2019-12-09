//
//  CQContentViewController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/7/26.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQContentViewController.h"
#import "CQContentModel.h"

static NSString * const CQContentCellReuseID = @"CQContentCellReuseID";

@interface CQContentViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CQContentViewController {
    NSString *_contents;
}

#pragma mark - Lazy Load

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        // 加载本地数据
        NSString *catalogPath = [[NSBundle mainBundle] pathForResource:_contents ofType:@"plist"];
        NSArray *catalogArray = [NSArray arrayWithContentsOfFile:catalogPath];
        for (NSDictionary *catalogDict in catalogArray) {
            NSError *error = nil;
            CQContentModel *model = [[CQContentModel alloc] initWithDictionary:catalogDict error:&error];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

#pragma mark - 构造方法

- (instancetype)initWithContents:(NSString *)contents {
    if (self = [super init]) {
        _contents = contents;
    }
    return self;
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

    // 如果是nil，说明是swift类
    if (!detailVC) {
        NSString *prefix = [[NSBundle mainBundle] infoDictionary][@"CFBundleExecutable"];
        NSString *swiftClassName = [NSString stringWithFormat:@"%@.%@", prefix, model.controller_name];
        detailVC = [[NSClassFromString(swiftClassName) alloc] init];
    }
    
    detailVC.title = model.demo_name;
    detailVC.url = model.url;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
