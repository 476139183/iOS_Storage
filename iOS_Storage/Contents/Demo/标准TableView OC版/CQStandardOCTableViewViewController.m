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

@end

@implementation CQStandardOCTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 组头是否悬停由UITableViewStyle决定
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // 设置表头
    self.tableView.tableHeaderView = [[CQStandardTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    // 设置表尾
    self.tableView.tableFooterView = [[CQStandardTableFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
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
