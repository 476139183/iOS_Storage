//
//  CQFPSViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQFPSViewController.h"
#import "CQFPSCell.h"

@interface CQFPSViewController () <UITableViewDataSource>

@property (nonatomic, strong) UILabel *fpsLabel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CADisplayLink *link;

@property (nonatomic, assign) NSTimeInterval lastTime;
@property (nonatomic, assign) NSInteger count;

@end

@implementation CQFPSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fpsLabel = [[UILabel alloc] init];
    [self.view addSubview:self.fpsLabel];
    self.fpsLabel.text = @"帧率";
    self.fpsLabel.textAlignment = NSTextAlignmentCenter;
    [self.fpsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(NAVIGATION_BAR_HEIGHT);
        make.height.mas_equalTo(40);
    }];
    
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 50;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.fpsLabel.mas_bottom);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.link invalidate];
    self.link = nil;
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    NSLog(@"页面帧率：%f",fps);
    self.fpsLabel.text = [NSString stringWithFormat:@"页面帧率：%f", fps];
    _count = 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseID = @"cellReuseID";
    CQFPSCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    if (!cell) {
        cell = [[CQFPSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
    }
    [cell createSubviews];
    return cell;
}

@end
