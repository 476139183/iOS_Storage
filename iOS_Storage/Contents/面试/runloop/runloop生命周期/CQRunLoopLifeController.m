//
//  CQRunLoopLifeController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQRunLoopLifeController.h"
#import "CQRunLoop.h"

@interface CQRunLoopLifeController ()

@end

@implementation CQRunLoopLifeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"runloop生命周期";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(observerRunLoop) object:nil];
    [thread start];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self observerRunLoop];
//        [[NSRunLoop currentRunLoop] run];
//    });
}



/**
 kCFRunLoopEntry -- 进入runloop循环
 kCFRunLoopBeforeTimers -- 处理定时调用前回调
 kCFRunLoopBeforeSources -- 处理input sources的事件
 kCFRunLoopBeforeWaiting -- runloop睡眠前调用
 kCFRunLoopAfterWaiting -- runloop唤醒后调用
 kCFRunLoopExit -- 退出runloop
 */
- (void)observerRunLoop {
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"###cmm子线程###进入kCFRunLoopEntry");
                break;
                
            case kCFRunLoopBeforeTimers:
                NSLog(@"###cmm子线程###即将处理Timer事件");
                break;
                
            case kCFRunLoopBeforeSources:
                NSLog(@"###cmm子线程###即将处理Source事件");
                break;
                
            case kCFRunLoopBeforeWaiting:
                NSLog(@"###cmm子线程###即将休眠");
                break;
                
            case kCFRunLoopAfterWaiting:
                NSLog(@"###cmm子线程###被唤醒");
                break;
                
            case kCFRunLoopExit:
                NSLog(@"###cmm子线程###退出RunLoop");
                break;
                
            default:
                break;
        }
    });
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    CQRunLoop *currentRunLoop = [CQRunLoop currentRunLoop];
    //[currentRunLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    //CFRunLoopRun();
    [currentRunLoop run];
}

@end
