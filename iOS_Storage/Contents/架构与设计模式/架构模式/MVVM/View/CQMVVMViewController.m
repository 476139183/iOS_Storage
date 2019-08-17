//
//  CQMVVMViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQMVVMViewController.h"
#import "CQMVVMModel.h"
#import "CQMVVMCell.h"
#import "CQMVVMCellModel.h"
#import "CQMVVMViewModel.h"

@interface CQMVVMViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<CQMVVMModel *> * dataArray;
@property (nonatomic, strong) CQMVVMViewModel *viewModel;

@end

@implementation CQMVVMViewController

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadMoreButonClicked)];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 40;
    
    
    self.viewModel = [[CQMVVMViewModel alloc] init];
    
    __weak typeof(self) weakSelf = self;
    self.viewModel.updateblock = ^(NSMutableArray * _Nonnull dataArray) {
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.dataArray addObjectsFromArray:dataArray];
        [strongSelf.tableView reloadData];
    };
}

- (void)loadMoreButonClicked {
    [self.viewModel loadMoreData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseID = @"cellReuseID";
    CQMVVMCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    if (!cell) {
        cell = [[CQMVVMCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
    }
    cell.numLabel.text = [NSString stringWithFormat:@"%ld", self.dataArray[indexPath.row].num];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

@end
