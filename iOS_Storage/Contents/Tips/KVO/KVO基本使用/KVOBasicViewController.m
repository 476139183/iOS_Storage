//
//  KVOBasicViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

#import "KVOBasicViewController.h"

@interface KVOBasicViewController ()

@property (nonatomic, strong) MyTextField *textField;

@end

@implementation KVOBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textField = [[MyTextField alloc] init];
    [self.view addSubview:self.textField];
    self.textField.backgroundColor = [UIColor redColor];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.width.mas_equalTo(200);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    
    [self.textField addObserverBlockForKeyPath:@"backgroundColor" block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
        NSLog(@"%@", newVal);
    }];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.textField.backgroundColor = [UIColor greenColor];
}

@end





@interface MyTextField ()

@end


@implementation MyTextField



@end
