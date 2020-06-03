//
//  Work.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "Work.h"
#import "TimeState.h"
#import "ForenoonState.h"

@implementation Work

- (instancetype)init {
    if (self = [super init]) {
        self.state = [[ForenoonState alloc] init];
    }
    return self;
}

- (void)code {
    [self.state codeWithWork:self];
}

@end
