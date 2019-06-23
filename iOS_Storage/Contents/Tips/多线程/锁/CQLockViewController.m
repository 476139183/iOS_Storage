//
//  CQLockViewController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/7/20.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQLockViewController.h"

static NSString * const CQLockViewCellReuseID = @"CQLockViewCellReuseID";

@interface CQLockViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger time;
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) NSLock *lock;


/** 用于测试多个线程操作的数组 */
@property (nonatomic, strong) NSMutableArray *itemArray;

@end

@implementation CQLockViewController

#pragma mark - getter

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"无锁多线程访问",
                       @"NSLock加锁多线程访问",
                       @"使用@synchronized加锁",
                       @"两个线程同时操作同一个数组"];
    }
    return _dataArray;
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.rowHeight = 40;
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CQLockViewCellReuseID];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - 无锁多线程访问
/** 无锁多线程访问 */
- (void)accessWithoutLock {
    NSLog(@"无锁多线程访问");
    self.time = 0;
    self.count = 0;
    // 两个线程调用changeWithoutLock方法
    [NSThread detachNewThreadSelector:@selector(changeWithoutLock) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(changeWithoutLock) toTarget:self withObject:nil];
}

- (void)changeWithoutLock {
    for (int i = 0; i < 100000; i++) {
        self.count ++;
    }
    self.time ++;
    if (self.time == 2) {
        NSLog(@"count===%ld", self.count);
    }
}

#pragma mark - NSLock加锁多线程访问

- (void)accessWithNSLock {
    NSLog(@"NSLock加锁多线程访问");
    if (self.lock) {
        self.lock = nil;
    }
    self.lock = [[NSLock alloc] init];
    self.time = 0;
    self.count = 0;
    // 两个线程调用changeWithNSLock方法
    [NSThread detachNewThreadSelector:@selector(changeWithNSLock) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(changeWithNSLock) toTarget:self withObject:nil];
}

- (void)changeWithNSLock {
    [self.lock lock];
    for (int i = 0; i < 100000; i++) {
        self.count ++;
    }
    self.time ++;
    if (self.time == 2) {
        NSLog(@"count===%ld", self.count);
    }
    [self.lock unlock];
}

#pragma mark - 使用@synchronized加锁

- (void)accessWithSynchronized {
    NSLog(@"使用@synchronized加锁");
    self.time = 0;
    self.count = 0;
    // 两个线程调用changeWithSynchronized方法
    [NSThread detachNewThreadSelector:@selector(changeWithSynchronized) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(changeWithSynchronized) toTarget:self withObject:nil];
}

- (void)changeWithSynchronized {
    @synchronized(self) {
        self.time++;
        for (int i = 0; i < 100000; i++) {
            self.count ++;
        }
        if (self.time == 2) {
            NSLog(@"count===%ld", self.count);
        }
    }
}

#pragma mark - 两个线程同时操作同一个数组

- (void)handleArrayWithTwoThread {
    self.itemArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
    // 这是一道面试题
    // 用户上拉加载更多的同时左滑删除cell
    // 需求就是不能两个线程同时操作数组
    [self pullUpLoadMore];
    [self deleteACell];
}

// 删除一个cell
- (void)deleteACell {
    // 注意加锁位置
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        @synchronized (self) {
            [self.itemArray removeObjectAtIndex:1];
            NSLog(@"删除一个cell后，数组count=%ld", self.itemArray.count);
        }
    });
}

// 上拉加载更多
- (void)pullUpLoadMore {
    // 不能卡顿
    // 执行完了才能继续操作array
    // 注意加锁位置
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        @synchronized (self) {
            for (int i = 1; i <= 10000; i++) {
                [self.itemArray addObject:@"0"];
            }
            NSLog(@"上拉加载更多后，数组count=%ld", self.itemArray.count);
        }
    });
}

#pragma mark - UITableView DataSource & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CQLockViewCellReuseID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: // 多线程无锁访问
        {
            [self accessWithoutLock];
        }
            break;
            
        case 1: // NSLock加锁多线程访问
        {
            [self accessWithNSLock];
        }
            break;
            
        case 2: // 使用synchronized加锁
        {
            [self accessWithSynchronized];
        }
            break;
            
        case 3: // 同时操作一个数组
        {
            [self handleArrayWithTwoThread];
        }
            break;
            
        default:
            break;
    }
}

@end
