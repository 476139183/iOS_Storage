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
            [self bubbleSort];
        }
            break;
            
        case CQSortTypeSelection: // 选择排序
        {
            [self selectionSort];
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

- (void)bubbleSort {
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@1, @3, @2, @99, @33]];
    NSLog(@"冒泡排序前：%@", array);
    NSInteger count = 0;
    for (NSUInteger i = array.count; i > 0; i--) {
        // 比较相邻两个数，将大的那个数放在后面
        // 每轮循环可以将最大的数放到末尾
        for (NSUInteger j = 1; j < i; j++) {
            count ++;
            if (array[j-1] > array[j]) {
                // 交换数组元素
                [array exchangeObjectAtIndex:j withObjectAtIndex:(j-1)];
            }
        }
    }
    NSLog(@"冒泡排序后：%@", array);
    NSLog(@"运算次数：%ld", count);
}

#pragma mark 选择排序

// 从第一个元素开始，分别跟后面的元素比较
- (void)selectionSort {
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@1, @3, @2, @99, @33]];
    NSLog(@"选择排序前：%@", array);
    NSInteger count = 0;
    for (int i = 0; i < array.count-1; i++) {
        // 每轮循环可以把最小的数放到最前面
        for (int j = i+1; j < array.count; j++) {
            count ++;
            if (array[j] < array[i]) {
                [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    NSLog(@"选择排序后：%@", array);
    NSLog(@"运算次数：%ld", count);
}

#pragma mark 插入排序

- (void)insertionSort {
    
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
