//
//  CQMemoryLeakView.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "CQMemoryLeakView.h"

@interface CQMemoryLeakView()

@property (nonatomic, copy) dispatch_block_t block;

@end

@implementation CQMemoryLeakView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.block = ^{
            self.backgroundColor = [UIColor redColor];
        };
        self.block();
    }
    return self;
}

- (void)dealloc {
    NSLog(@"CQMemoryLeakView 释放");
}

@end
