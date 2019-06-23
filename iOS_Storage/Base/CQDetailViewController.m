//
//  CQDetailViewController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/6/28.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQDetailViewController.h"
#import <WebKit/WebKit.h>

@interface CQDetailViewController () <WKNavigationDelegate>

/** URL */
@property (nonatomic, copy) NSString *url;
/** webView */
@property (nonatomic, strong) WKWebView *webView;
/** 进度条 */
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation CQDetailViewController

#pragma mark - 构造方法

- (instancetype)initWithTitle:(NSString *)title url:(NSString *)url {
    if (self = [super init]) {
        self.title = title;
        self.url = url;
    }
    return self;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //------- webView -------//
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    self.webView.navigationDelegate = self;
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    //========== 加载资源 ==========//
    if ([self.url containsString:@"://"]) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    } else {
        //------- 加载本地文件 -------//
        NSString *path = [[NSBundle mainBundle] pathForResource:self.url ofType:nil];
        NSString *suffix = [[[self.url componentsSeparatedByString:@"."] lastObject] lowercaseString];
        
        NSError *error = nil;
        NSString *contentStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
        
        if ([suffix isEqualToString:@"md"]) {
            // 加载本地Markdown
            [self.webView loadHTMLString:[self convertMarkdownToHtmlWithContent:contentStr] baseURL:nil];
        } else if ([suffix containsString:@"htm"]) {
            // 加载本地html
            [self.webView loadHTMLString:contentStr baseURL:nil];
        }
    }
    
    //------- 进度条 -------//
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, 0)];
    self.progressView.tintColor = [UIColor orangeColor];
    self.progressView.trackTintColor = [UIColor whiteColor];
    [self.view addSubview:self.progressView];
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

#pragma mark - markdown 转 html

- (NSString *)convertMarkdownToHtmlWithContent:(NSString *)content {
    // 对markdown进行解析。。。
    return content;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}

@end
