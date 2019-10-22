//
//  CQGradientDemoViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQGradientDemoViewController.h"
#import "CQGradientOCDemoViewController.h"

@interface Model : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) SEL sel;

+ (instancetype)modelWithTitle:(NSString *)title sel:(SEL)sel;

@end

@implementation Model

+ (instancetype)modelWithTitle:(NSString *)title sel:(SEL)sel {
    Model *model = [self new];
    model.title = title;
    model.sel = sel;
    return model;
}

@end



@interface CQGradientDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation CQGradientDemoViewController

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[[Model modelWithTitle:@"OC" sel:@selector(gotoOCViewController)],
                       [Model modelWithTitle:@"Swift" sel:@selector(gotoSwiftViewController)]];
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

- (void)gotoOCViewController {
    CQGradientOCDemoViewController *vc = [CQGradientOCDemoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)gotoSwiftViewController {
    GradientSwiftDemoViewController *vc = [GradientSwiftDemoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellReuseID = @"cellReuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
    }
    Model *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Model *model = self.dataArray[indexPath.row];
    [self performSelector:model.sel afterDelay:0];
}

@end
