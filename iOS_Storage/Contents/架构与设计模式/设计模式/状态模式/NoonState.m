//
//  NoonState.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "NoonState.h"
#import "AfternoonState.h"

@implementation NoonState

- (void)codeWithWork:(Work *)work {
    if (work.hour < 13) {
        NSLog(@"中午了，有点想睡觉");
    } else {
        work.state = [[AfternoonState alloc] init];
        [self codeWithWork:work];
    }
}

@end
