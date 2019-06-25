//
//  CQMessageSendController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQMessageSendController.h"

@interface CQMessageSendController ()

@end

@implementation CQMessageSendController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"消息发送";
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:button1];
    button1.frame = CGRectMake(90, 90, 90, 40);
    [button1 setTitle:@"target为nil" forState:UIControlStateNormal];
    [button1 addTarget:nil action:@selector(button1Clicked) forControlEvents:UIControlEventTouchDown];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test];
}

- (void)button1Clicked {
    NSLog(@"button clicked");
}

- (void)test {
    NSLog(@"test");
}

@end
