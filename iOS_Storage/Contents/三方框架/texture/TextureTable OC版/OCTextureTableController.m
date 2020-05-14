//
//  OCTextureTableController.m
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import "OCTextureTableController.h"

@interface OCTextureTableController ()

@property (nonatomic, strong) CQBaseNaviBar *naviView;
@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation OCTextureTableController

- (instancetype)init
{
    self = [super initWithNode:[ASDisplayNode new]];
    if (self) {
        self.tableNode = [[ASTableNode alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.naviView = [[CQBaseNaviBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_BAR_HEIGHT)];
    self.naviView.titleLabel.text = @"OC 版 table node";
    [self.naviView.backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    self.naviView.detailButton.hidden = YES;
    [self.view addSubview:self.naviView];
    
    self.tableNode.backgroundColor = [UIColor yellowColor];
    self.tableNode.frame = CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT);
    [self.node addSubnode:self.tableNode];
}

- (void)backButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
