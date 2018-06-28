//
//  CQDetailViewController.m
//  iOS_Demo
//
//  Created by 蔡强 on 2018/6/28.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQDetailViewController.h"
#import <WebKit/WebKit.h>

@interface CQDetailViewController ()

@property (nonatomic, copy) NSString *jianshuURL;

@end

@implementation CQDetailViewController

- (instancetype)initWithTitle:(NSString *)title jianshuURL:(NSString *)jianshuURL {
    if (self = [super init]) {
        self.title = title;
        self.jianshuURL = jianshuURL;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.jianshuURL]]];
}

@end
