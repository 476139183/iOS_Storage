//
//  CQGCDController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/7/27.
//  Copyright © 2018年 蔡强. All rights reserved.
//

/// GCD是纯c的API

#import "CQGCDController.h"

@interface CQGCDController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation CQGCDController

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"串行队列 SerailQueue",
                       @"并行队列 ConcurrentQueue",
                       @"dispatch_set_target_queue",
                       @"栅栏函数 dispatch_barrier_async",
                       @"dispatch_apply",
                       @"dispatch_suspend"];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseID = @"cellReuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: // 串行队列
        {
            [self testSerialQueue];
        }
            break;
            
        case 1: // 并行队列
        {
            [self testConcurrentQueue];
        }
            break;
            
        case 2: // dispatch_set_target_queue
        {
            [self testSetTargetQueue];
        }
            break;
            
        case 3: // 栅栏函数
        {
            [self testBarrier];
        }
            break;
            
        case 4: // dispatch_apply
        {
            [self testDispatchApply];
        }
            break;
            
        case 5:
        {
            [self testDispatchSuspend];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 串行队列

- (void)testSerialQueue {
    dispatch_queue_t serialQueue;
    // 创建一个串行队列
    serialQueue = dispatch_queue_create("com.caiqiang.gcd.SerialQueue", DISPATCH_QUEUE_SERIAL);
    // 或者使用系统提供的
    //serialQueue = dispatch_get_main_queue();
    
    // 串行队列，打印 1 2 3
    dispatch_async(serialQueue, ^{
        NSLog(@"串行队列 任务1");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"串行队列 任务2");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"串行队列 任务3");
    });
    
    NSLog(@"任务结束");
}

#pragma mark - 并行队列

- (void)testConcurrentQueue {
    dispatch_queue_t concurrentQueue;
    // 创建一个并行队列
    concurrentQueue = dispatch_queue_create("com.caiqiang.gcd.ConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    // 也可以用系统提供的
    // concurrentQueue = dispatch_get_global_queue(0, 0);
    
    // 并行队列，顺序不定
    dispatch_async(concurrentQueue, ^{
        NSLog(@"并行队列 任务1");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"并行队列 任务2");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"并行队列 任务3");
    });
}

#pragma mark - dispatch_set_target_queue

- (void)testSetTargetQueue {
    // 目标串行队列
    dispatch_queue_t targetQueue = dispatch_queue_create("targetQueue", DISPATCH_QUEUE_SERIAL);
    // 串行队列
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);
    // 并发队列
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT);
    
    // 设置target
    dispatch_set_target_queue(queue1, targetQueue);
    dispatch_set_target_queue(queue2, targetQueue);
    
    // 在必须将不可并行执行的处理追加到多个Serail Dispatch Queue 中时，
    // 使用dispatch_set_target_queue将目标指定为某一个串行队列
    // 可防止并行执行
    // 下面打印的是 1 2 3 4
    dispatch_async(queue2, ^{
        NSLog(@"任务1");
    });
    dispatch_async(queue1, ^{
        NSLog(@"任务2");
    });
    dispatch_async(queue2, ^{
        NSLog(@"任务3");
    });
    dispatch_async(queue1, ^{
        NSLog(@"任务4");
    });
}

#pragma mark - 栅栏函数

- (void)testBarrier {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"上厕所");
    });
    dispatch_async(queue, ^{
        NSLog(@"洗漱");
    });
    dispatch_async(queue, ^{
        NSLog(@"吃早饭");
    });
    
    // 栅栏函数相当于将队列分为前后两个部分
    // 先将前面那部分队列的任务执行完
    // 再执行后面那部分队列的任务
    dispatch_barrier_async(queue, ^{
        NSLog(@"准备工作完成，上班");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"敲代码");
    });
    dispatch_async(queue, ^{
        NSLog(@"看新闻");
    });
    dispatch_async(queue, ^{
        NSLog(@"QQ群吹水");
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"完成当天工作，下班");
    });
}

#pragma mark - dispatch_apply

- (void)testDispatchApply {
    // 该函数按指定的次数将指定的block追加到指定的queue中，并等待全部处理执行结束
    // 可以看做一个循环
    dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"%ld", index);
    });
    NSLog(@"所有任务执行完毕");
}

#pragma mark - dispatch_suspend / dispatch_resume

- (void)testDispatchSuspend {
    // dispatch_suspend 函数挂起指定的 Dispatch Queue
    // dispatch_resume 函数恢复指定的 Dispatch Queue
    dispatch_queue_t queue = dispatch_queue_create("com.caiqiang.gcd.suspend", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        NSLog(@"任务1");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2");
    });
    
    // 挂起队列
    NSLog(@"suspend...");
    dispatch_suspend(queue);
    
    // 任务3一定在resume之后执行
    dispatch_async(queue, ^{
        NSLog(@"任务3");
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 恢复队列
        dispatch_resume(queue);
        NSLog(@"resume...");
    });
}

@end
