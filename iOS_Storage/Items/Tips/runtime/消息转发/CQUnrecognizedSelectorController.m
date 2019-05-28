//
//  CQUnrecognizedSelectorController.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/21.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQUnrecognizedSelectorController.h"
#import "Cat.h"

@interface CQUnrecognizedSelectorController ()

@end

@implementation CQUnrecognizedSelectorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"揭秘 Unrecognized Selector";
    
    // 如果方法没有实现，会报这个错
    // 但是在报这个错之前，有三次“补救”的机会
    // 详情见 Cat.m
    Cat *cat = [Cat new];
    [cat miao];
    
    
}

@end
