//
//  CQBlockReturnViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/6.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import "CQBlockReturnViewController.h"

@interface CQBlockReturnViewController ()

@end

@implementation CQBlockReturnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *a = [self returnInBlock];
    NSLog(@"%@", a);
}

- (NSString *)returnInBlock {
    
    dispatch_queue_t queue = dispatch_queue_create("semaphoreQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_semaphore_t signal = dispatch_semaphore_create(0);
    
    __block NSString *objectID;
    
    // 模拟block异步
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), queue, ^{
        objectID = @"222";
        dispatch_semaphore_signal(signal);
    });
    
    dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    
    return objectID;
}

@end
