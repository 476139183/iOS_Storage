//
//  CQStateViewController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQStateViewController.h"
#import "Work.h"

@interface CQStateViewController ()

@end

@implementation CQStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Work *work = [[Work alloc] init];
    work.hour = 8;
    [work code];
}

@end
