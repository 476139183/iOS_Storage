//
//  CQRunloopModeController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/21.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQRunloopModeController.h"

@interface CQRunloopModeController () <UIScrollViewDelegate>

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation CQRunloopModeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"runloop mode 切换";
    
    [self printCurrentMode];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(90, 90, 200, 300)];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.contentSize = CGSizeMake(2000, 2000);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)timerMethod {
    NSLog(@"timer method");
}

- (void)printCurrentMode {
    NSLog(@"current runloop mode === %@", [NSRunLoop currentRunLoop].currentMode);
}

// scrollView滚动时，RunloopMode为UITrackingRunLoopMode
// scrollView未滚动时，RunloopMode为kCFRunLoopDefaultMode
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"滚动中");
//    [self printCurrentMode];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self printCurrentMode];
}

@end
