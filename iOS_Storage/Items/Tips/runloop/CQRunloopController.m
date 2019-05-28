//
//  CQRunloopController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/21.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQRunloopController.h"
#import "CQPermanentThreadController.h"
#import "CQRunloopModeController.h"
#import "CQRunLoopLifeController.h"

@interface CQRunloopController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation CQRunloopController

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"常驻线程",
                       @"mode 切换",
                       @"runloop生命周期",
                       @"自动释放池与runloop",
                       @"GCD Timer",
                       @"tableView优化之分段加载",
                       @"卡顿监控"];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseID = @"cellReuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CQBaseViewController *vc = nil;
    switch (indexPath.row) {
        case 0: // 常驻线程
        {
            vc = [[CQPermanentThreadController alloc] init];
        }
            break;
            
        case 1: // mode切换
        {
            vc = [[CQRunloopModeController alloc] init];
        }
            break;
            
        case 2: // runloop生命周期
        {
            vc = [[CQRunLoopLifeController alloc] init];
        }
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
