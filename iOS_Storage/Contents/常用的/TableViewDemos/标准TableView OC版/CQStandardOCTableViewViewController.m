//
//  CQStandardOCTableViewViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStandardOCTableViewViewController.h"
#import "CQStandardTableViewCell.h"
#import "CQStandardTableHeaderView.h"
#import "CQStandardTableFooterView.h"
#import "CQStandardTableSectionHeaderView.h"
#import "CQStandardTableSectionFooterView.h"

@interface CQStandardOCTableViewViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
/** 获取第几页的数据 */
@property (nonatomic, assign) NSInteger requestPage;

@end

@implementation CQStandardOCTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.detailUrl = @"标准TableView OC版.md";
    
    // 组头是否悬停由UITableViewStyle决定
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // 设置表头
    CQStandardTableHeaderView *tableHeaderView = [[CQStandardTableHeaderView alloc] init];
    [tableHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.tableView.width);
    }];
    // 表头高度自适应的关键
    [tableHeaderView layoutIfNeeded];
    [self.tableView layoutIfNeeded];
    self.tableView.tableHeaderView = tableHeaderView;
    
    // 设置表尾
    self.tableView.tableFooterView = [[CQStandardTableFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    
    // 下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownRefresh)];
    // 上拉加载更多
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(pullUpLoadMore)];
}

- (void)loadDataWithSuccess:(void (^)(NSArray *))success failure:(void (^)(NSString *))failure {
    //------- url -------//
    NSString *url = @"http://xxxx";
    //------- 参数 -------//
    NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
    paraDict[@"page"] = @(self.requestPage);
    //------- 请求 -------//
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
}

- (void)pullDownRefresh {
    
}

- (void)pullUpLoadMore {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseID = @"cellReuseID";
    CQStandardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    if (!cell) {
        cell = [[CQStandardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组 第%ld行", indexPath.section, indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第%ld组的第%ld行", indexPath.section, indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *headerReuseID = @"cellReuseID";
    CQStandardTableSectionHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerReuseID];
    if (!header) {
        header = [[CQStandardTableSectionHeaderView alloc] initWithReuseIdentifier:headerReuseID];
    }
    header.textLabel.text = [NSString stringWithFormat:@"第%ld组 组头", section];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    static NSString *footerReuseID = @"footerReuseID";
    CQStandardTableSectionFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerReuseID];
    if (!footer) {
        footer = [[CQStandardTableSectionFooterView alloc] initWithReuseIdentifier:footerReuseID];
    }
    footer.textLabel.text = [NSString stringWithFormat:@"第%ld组 组尾", section];
    return footer;
}

@end
