//
//  CQPermanentThreadController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/21.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQPermanentThreadController.h"
#import "CQThread.h"

@interface CQPermanentThreadController ()

@end

@implementation CQPermanentThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"常驻线程";
    
    // 线程的生命周期与任务有关，任务执行完，自动销毁
    // 如果想让线程不死，可以让任务不结束，可以仿苹果的做法，让线程有任务就执行，没任务就休眠
    // 只要runloop中有timer/source/observer，就不会退出
    
    // 开启新线程
    CQThread *thread = [[CQThread alloc] initWithTarget:self selector:@selector(task) object:nil];
    [thread start];
}

- (void)task {
    NSLog(@"task");
    NSRunLoop *currentRunloop = [NSRunLoop currentRunLoop];
    // 给当前runloop添加端口（Adds a port as an input source to the specified mode of the run loo）
    [currentRunloop addPort:[NSPort port] forMode:NSRunLoopCommonModes];
    // 子线程的runloop需要手动开启
    [currentRunloop run];
}

@end
