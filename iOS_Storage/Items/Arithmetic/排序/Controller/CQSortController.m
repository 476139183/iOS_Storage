//
//  CQSortController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/8/22.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQSortController.h"
#import "CQSortModel.h"

@interface CQSortController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <CQSortModel *> *dataArray;

@end

@implementation CQSortController

#pragma mark - Lazy Load

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSArray *dictArray = @[@{@"name" : @"冒泡排序", @"type" : @(CQSortTypeBubble)},
                               @{@"name" : @"选择排序", @"type" : @(CQSortTypeSelection)},
                               @{@"name" : @"插入排序", @"type" : @(CQSortTypeInsertion)}];
        for (NSDictionary *dict in dictArray) {
            NSError *error = nil;
            CQSortModel *model = [[CQSortModel alloc] initWithDictionary:dict error:&error];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - 排序

- (void)sortWithType:(CQSortType)type {
    switch (type) {
        case CQSortTypeBubble: // 冒泡排序
        {
            [self sortWithBubble];
        }
            break;
            
        case CQSortTypeSelection: // 选择排序
        {
            
        }
            break;
            
        case CQSortTypeInsertion: // 插入排序
        {
            
        }
            break;
            
        default:
            break;
    }
}

#pragma mark 冒泡排序

- (void)sortWithBubble {
    
}

#pragma mark 选择排序

#pragma mark 插入排序

void printArray(int a[5]) {
    for (int i = 0; i < 5; i ++) {
        
    }
}

#pragma mark - UITableView DataSource & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseID = @"cellReuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row].name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self sortWithType:self.dataArray[indexPath.row].type];
}

@end
