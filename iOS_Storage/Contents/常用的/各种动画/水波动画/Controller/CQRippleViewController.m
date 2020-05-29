//
//  CQRippleViewController.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/10/8.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQRippleViewController.h"

// 主题色
#define THEME_COLOR [UIColor colorWithRed:0.33 green:0.66 blue:0.91 alpha:1.00]

@interface CQRippleViewController ()

/** 容器view */
@property (nonatomic, strong) UIView *roundView;
/** 波浪layer */
@property (nonatomic, strong) CAShapeLayer *waveLayer;
/** 页面刷新器 */
@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation CQRippleViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"波浪动画";
    
    [self setupUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 改变shape的timer
    if (!self.displayLink) {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(createWavePath)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
}

- (void)dealloc {
    NSLog(@"已释放");
}

#pragma mark - UI

- (void)setupUI {
    // 容器view
    self.roundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:self.roundView];
    self.roundView.center = self.view.center;
    self.roundView.layer.cornerRadius = 50;
    self.roundView.layer.masksToBounds = YES;
    self.roundView.layer.borderColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.96 alpha:1.00].CGColor;
    self.roundView.layer.borderWidth = 1;
    
    // 先放蓝色字体label
    UILabel *blueLabel = [[UILabel alloc] initWithFrame:self.roundView.bounds];
    [self.roundView addSubview:blueLabel];
    blueLabel.textColor = THEME_COLOR;
    blueLabel.textAlignment = NSTextAlignmentCenter;
    blueLabel.font = [UIFont boldSystemFontOfSize:60];
    blueLabel.text = @"RD";
    blueLabel.backgroundColor = [UIColor whiteColor];
    blueLabel.clipsToBounds = YES;
    
    // 再放波浪layer
    self.waveLayer = [CAShapeLayer layer];
    self.waveLayer.frame = blueLabel.bounds;
    [blueLabel.layer addSublayer:self.waveLayer];
    
    // 最后放白色字体label
    UILabel *whiteLabel = [[UILabel alloc] initWithFrame:blueLabel.bounds];
    [blueLabel addSubview:whiteLabel];
    whiteLabel.textColor = [UIColor whiteColor];
    whiteLabel.text = blueLabel.text;
    whiteLabel.font = blueLabel.font;
    whiteLabel.textAlignment = NSTextAlignmentCenter;
    whiteLabel.layer.mask = self.waveLayer;
    whiteLabel.backgroundColor = THEME_COLOR;
}

#pragma mark - animation

- (void)createWavePath {
    
    static CGFloat offsetX = 0;
    offsetX += 0.1;
    
    // 绘制图层的路径
    CGMutablePathRef wavePath = CGPathCreateMutable();
    
    // 绘制路径的起始位置
    CGPathMoveToPoint(wavePath, nil, 0, 100);
    
    CGFloat y = 0.f;
    CGFloat pathWidth = 100;
    CGFloat pathheight = 100;
    // 画点
    for (float x = 0.0; x <= pathWidth; x++) {
        y = 10 * sin((x/180*M_PI) - 2*(offsetX/M_PI)) + 50;
        CGPathAddLineToPoint(wavePath, nil, x, y);
    }
    
    CGPathAddLineToPoint(wavePath, nil, pathWidth, pathheight);
    CGPathAddLineToPoint(wavePath, nil, 0, pathheight);
    CGPathAddLineToPoint(wavePath, nil, 0, 50);
    
    // 结束绘图信息
    CGPathCloseSubpath(wavePath);
    
    self.waveLayer.path = wavePath;
    
    // 释放绘图路径
    CGPathRelease(wavePath);
}

@end
