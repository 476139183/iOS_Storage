//
//  ForenoonState.m
//  iOS_Storage
//
//  Created by caiqiang on 2019/6/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

#import "ForenoonState.h"
#import "NoonState.h"

@implementation ForenoonState

- (void)codeWithWork:(Work *)work {
    if (work.hour < 11) {
        NSLog(@"现在是早上，代码敲得飞6");
    } else {
        work.state = [[NoonState alloc] init];
        [self codeWithWork:work];
    }
}

@end
